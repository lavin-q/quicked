import $request from "../../common/request"
import * as $auth from "../../common/auth"

const user = {
	state:{
		token:$auth.getUserToken() || null,
		username:$auth.getUsername() || null,
		userInfo: $auth.getUserInfo() || {}, // 登录成功返回的个人信息
		permissions:$auth.getPermissions() || ""
	},
	mutations:{
		// 微信登录的用户信息
		SET_USERINFO(state,userInfo){
			state.userInfo = userInfo;
			$auth.setUserInfo(userInfo);
		},

		SET_TOKEN: (state,token) => {
			state.token = token;
			$auth.setUserToken(token);
		},
		SET_USERNAME: (state,name) => {
			state.username = name;
			$auth.setUsername(name);
		},
		SET_PERMISSIONS: (state,permissionArr) => {
			state.permissions = permissionArr
			$auth.setPermissions(permissionArr);
		}
	},
	actions:{

		// 用户登录
		loginByUsername({ commit },userInfo) {
			return new Promise((resolve,reject) => {
				let postData = {
					username:userInfo.username || null,
					password:userInfo.password || null,
					// clientId:userInfo.clientId || null,
					// systemInfo:JSON.stringify(uni.getSystemInfoSync())
				}
				$request.post('/login',postData).then(res=>{
					if(res.code==0){
						commit('SET_TOKEN',res.data.token);
						commit('SET_USERNAME',res.data.username);
						// commit('SET_PERMISSIONS',res.data.userInfo.perms.join(','));

						let userInfo = Object.assign({},res.data);
						// delete userInfo.perms;
						// delete userInfo.password;
						commit('SET_USERINFO',userInfo);
					}
					resolve(res);
				}).catch(error => {
					reject(error)
				});
			})
		},

		// 登出
		logOut({commit}) {
			return new Promise((resolve,reject) => {
				$request.post('/logout').then(res=>{
					if(res.code==0){
						commit('SET_TOKEN',null);
						// commit('SET_USERNAME',null);
						commit('SET_PERMISSIONS',"");
						commit('SET_USERINFO',{});
						$auth.removeUserToken();
						$auth.removeUsername();
						$auth.removeUserInfo();
						$auth.removePermissions();
					}
					resolve(res);
				}).catch(error => {
					commit('SET_TOKEN',null);
					commit('SET_USERNAME',null);
					commit('SET_PERMISSIONS',"");
					commit('SET_USERINFO',{});
					$auth.removeUserToken();
					$auth.removeUsername();
					$auth.removeUserInfo();
					$auth.removePermissions();
					reject(error)
				});
			})
		}
	}
}

export default user