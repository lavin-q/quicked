export default {
	token:state => state.user.token,
	username:state => state.user.username,
	userInfo:state => state.user.userInfo,
	permissions:state => state.user.permissions,
// 	username: (state, getters) => {
// 		return state.user.username
// 	}
}