import * as $auth from "./auth"
import config from './config.js'

function error(res){
	if (res.code === 401) { // 401, token失效
		$auth.removeUserToken();
// 		uni.redirectTo({
// 			url:"/pages/login/login"
// 		});
		uni.reLaunch({url:"/pages/login/login"});
		// location.reload() // 刷新页面, 清空整站临时存储数据
	}else if(res.code === 404){
		uni.showToast({
			title:res.msg,
			icon:"none"
		})
	}else if(res.code === 500){
		uni.showToast({
			title:res.msg,
			icon:"none"
		})
	}
}
function httpService(url,method,data,header){
	data = data || {};
	header = header || {};
	method = method || "get";
	let token = $auth.getUserToken();
	if(token){
		header.token = token;			// 获取token值
	}
	let promise = new Promise((resolve,reject)=>{
		uni.request({
			url: config.websiteBaseUrl + url,
			header:header,
			data: data,
			method: method,
			success: res => {
				if(res.data && (res.data.code === 401 || res.data.code === 401 || res.data.code === 404 || res.data.code === 500)){
					error(res.data);
					return reject(res.data.msg);
				}
				resolve(res.data);
			},
			fail: (res) => {
				uni.hideLoading();
				if(res.data && (res.data.code === 401 || res.data.code === 401 || res.data.code === 404 || res.data.code === 500)){
					error(res.data);
					return reject(res.data.msg);
				}
				reject(res);
			},
			complete: () => {
				
			}
		});
	})
	return promise;
}

// 单文件上传
function httpUpload(filePath,formData,header,success,fail,name,url){
	name = name || 'file';
	url = url?config.websiteBaseUrl + url:config.websiteBaseUrl;
	header = header || {};
	header['Content-type'] = 'multipart/form-data';
	let token = $auth.getUserToken();
	if(token){
		header.token = token;			// 获取token值
	}
	let uploadTask = uni.uploadFile({
		url: url,
		filePath:filePath,
		name: 'file', 
		formData: formData || {},
		header:header,
		success: (uploadFileRes) => {
			// console.log(uploadFileRes);
			if(uploadFileRes.statusCode===200){
				let res = JSON.parse(uploadFileRes.data);
				error(res);
				if(success){
					success.call(null,res);
				}
				
			}else{
				if(fail){
					fail.call(null,res);
				}
			}
		},
		fail: (res) => {
			let err = JSON.parse(res);
			error(err);
		},
		complete: () => {
			
		}
	});
	return uploadTask;
}

function downloadFile(url,header,success,fail){
	header = header || {};
	let token = $auth.getUserToken();
	if(token){
		header.token = token;			// 获取token值
	}
	if(!url){
		return;
	}
	let downloadTask = uni.downloadFile({
		url: url,
		success: (res) => {
			if(res.statusCode===200){
				if(success){
					success.call(null,res);
				}
			}else{
				if(fail){
					fail.call(null,res);
				}
			}
		},
		fail:(res) => {
			let err = JSON.parse(res);
			error(err);
			if(fail){
				fail.call(null,err)
			}
		},
		complete: () => {
			
		}
	});
	return downloadTask;
}

export default {
	get:function(url,data,header){
		return httpService(url,'GET',data,header);
	},
	post:function(url,data,header){
		return httpService(url,'POST',data,header);
	},
	dele:function(url,data,header){
		return httpService(url,'DELETE',data,header);
	},
	put:function(url,data,header){
		return httpService(url,'PUT',data,header);
	},
	upload:function(filePath,formData,header,success,fail,name,url){
		return httpUpload(filePath,formData,header,success,fail,name,url);
	},
	download:function(url,header,success,fail){
		return downloadFile(url,header,success,fail);
	}
}