import store from '@/store'

const globalMethods = {}
// 判断用户权限的全局方法
globalMethods.install = Vue => {
  Vue.prototype.hasPermission = function(permission) {
    var permissions = store.state.user.permissions
    if (permissions && permissions.indexOf(permission) > -1) {
      return true
    } else {
      return false
    }
  }
}

export default globalMethods
