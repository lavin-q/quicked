import Vue from 'vue'
import SvgIcon from '@/components/SvgIcon' // svg组件

// register globally
Vue.component('svg-icon', SvgIcon)

const requireAll = requireContext => requireContext.keys().map(requireContext)
const req = require.context('./svg', false, /\.svg$/)
const iconMap = requireAll(req)

export default {
  // 获取图标icon-(*).svg名称列表, 例如[shouye, xitong, zhedie, ...]
  getNameList() {
    // return iconMap.map(item => item.default.id.split('-')[1])
    return iconMap.map(item => item.default.id.replace(/icon-/g, ''))
  }
}
