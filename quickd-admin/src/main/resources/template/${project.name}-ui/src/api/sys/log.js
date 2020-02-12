import request from '@/utils/request'

// 列表
export function getLogList(param){
	return request({
		url:'/sys/log/list',
		method:'get',
		params:param
	})
}

export function deleteLog(data){
	return request({
		url:'/sys/log/delete',
		method:'post',
		data:data
	})
}