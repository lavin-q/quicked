import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user'
import state from './state'
import getters from './getters'
import actions from './actions'
import mutations from './mutations'

Vue.use(Vuex)

export default new Vuex.Store({
	modules: {
		user
	 },
	state,
	getters,
	actions,
	mutations
})
