import store from '@/store'

// 判断用户是否有权限
function _hasPermission(value) {
  var userPermissions = store.state.user.permissions
  if (userPermissions === undefined || userPermissions == null) {
    return false
  }
  if (userPermissions && userPermissions.indexOf(value) > -1) {
    return true
  } else {
    return false
  }
}
const vueHasPermission = {}

const hasPermission = {
  // bind: function(el, binding) {
  //   if (!_hasPermission(binding.value)) {
  //     el.remove();
  //     // el.parentNode.removeChild(el);
  //   }
  // }
  inserted(el, binding) {
    if (!_hasPermission(binding.value)) {
      el.remove()
    }
  }
}
vueHasPermission.install = Vue => {
  /** 权限指令 v-permission **/
  Vue.directive('permission', hasPermission)
}
export default vueHasPermission
