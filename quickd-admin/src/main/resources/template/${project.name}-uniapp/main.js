import Vue from 'vue'
import App from './App'
import config from './common/config.js'
import $request from './common/request.js'
import store from './store'

import list from './pages/list/index.vue'
Vue.component('list',list)

import mine from './pages/mine/index.vue'
Vue.component('mine',mine)

import cuCustom from './colorui/components/cu-custom.vue'
Vue.component('cu-custom',cuCustom)

import custom from './colorui/components/custom.vue'
Vue.component('custom',custom)

Vue.config.productionTip = false

Vue.prototype.$store = store;
Vue.prototype.$websiteBaseUrl = config.websiteBaseUrl;
Vue.prototype.$request = $request;
App.mpType = 'app'

const app = new Vue({
    store,
    ...App
})
app.$mount()
