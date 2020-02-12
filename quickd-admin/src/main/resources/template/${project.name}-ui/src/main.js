import Vue from 'vue'

import 'normalize.css/normalize.css' // A modern alternative to CSS resets
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN' // lang i18n
import '@/components/Dashboard/Widgets/libs' // chart libs
import '@/styles/index.scss' // global css

import App from './App'
import router from './router/routers'
import store from './store'
import permission from './components/permission'
import * as filters from '@/filters' // global filters
import elFormRules from '@/plugins/elFormRules' // form rules
import globalMethods from '@/plugins/globalMethods' // form rules

import hasPermission from '@/directive/hasPermission'

import '@/icons' // icon
import './router/index' // permission control

import echarts from 'echarts'
import 'echarts/lib/chart/map.js'
import 'echarts/map/js/china.js'

Vue.use(permission)
Vue.use(ElementUI, { locale })
Vue.config.productionTip = false
Vue.use(elFormRules)
Vue.use(globalMethods)
Vue.use(hasPermission)
require('babel-polyfill')

// register global utility filters.
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})

// 挂载全局
Vue.prototype.$echarts = echarts

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
