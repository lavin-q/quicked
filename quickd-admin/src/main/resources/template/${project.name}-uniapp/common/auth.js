
const tokenKey = 'HSE-token'
const usernameKey = 'HSE-username'
const userInfoKey = 'HSE-userinfo'
const permissionsKey = 'HSE-permission'

// 获取token值
function getUserToken(){
	return uni.getStorageSync(tokenKey);
}

function setUserToken(token){
	uni.setStorageSync(tokenKey,token);
}

function removeUserToken(){
	uni.removeStorageSync(tokenKey);
}

// 获取用户名
function getUsername(){
	return uni.getStorageSync(usernameKey);
}

function setUsername(username){
	uni.setStorageSync(usernameKey,username);
}

function removeUsername(){
	uni.removeStorageSync(usernameKey);
}

// 获取用户信息
function getUserInfo(){
	return uni.getStorageSync(userInfoKey);
}

function setUserInfo(userinfo){
	uni.setStorageSync(userInfoKey,userinfo);
}

function removeUserInfo(){
	uni.removeStorageSync(userInfoKey);
}

// 获取用户权限
function getPermissions(){
	return uni.getStorageSync(permissionsKey);
}

function setPermissions(permissions){
	uni.setStorageSync(permissionsKey,permissions);
}

function removePermissions(){
	uni.removeStorageSync(permissionsKey);
}

export {
	getUserToken,
	setUserToken,
	removeUserToken,
	
	getUsername,
	setUsername,
	removeUsername,
	
	getUserInfo,
	setUserInfo,
	removeUserInfo,
	
	getPermissions,
	setPermissions,
	removePermissions
}