/*
 * 地图与地图组件管理器
 */
const maps = {
  state: {
    roads: [],
    map: null
  },
  mutations: {
    UPDATE_ROADS: (state, roads) => {
      state.roads = roads
    },
    GET_MAP: (state, map) => {
      state.map = map
    }
  },
  actions: {
    updateRoads({ commit }, roads) {
      commit('UPDATE_ROADS', roads)
    },
    getMap: ({ commit }, map) => {
      commit('GET_MAP', map)
    }
  }
}

export default maps
