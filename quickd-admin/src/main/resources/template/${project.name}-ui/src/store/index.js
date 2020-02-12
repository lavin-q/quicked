import Vue from 'vue'
import Vuex from 'vuex'
import app from './modules/app'
import api from './modules/api'
import errorLog from './modules/errorLog'
import tagsView from './modules/tagsView'
import user from './modules/user'
import permission from './modules/permission'
import settings from './modules/settings'
import maps from './modules/maps'
import globalDictMap from './modules/globalDictMap'
import getters from './getters'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    api,
    errorLog,
    tagsView,
    user,
    permission,
    settings,
    maps,
    globalDictMap
  },
  getters
})

export default store
