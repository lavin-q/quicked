import { loginByUsername, logout, getUserInfo } from '@/api/login'
import { getToken, setToken, setUserId,removeToken } from '@/utils/auth'
import router from '@/router/routers'

const user = {
  state: {
    id: '',
    token: getToken(),
    user: null,
    username: sessionStorage.getItem('username') || '',
    permissions: []
  },
  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_USER: (state, user) => {
      state.user = user
    },
    SET_USERNAME: (state, name) => {
      state.username = name
      sessionStorage.setItem('username', name)
    },
SET_USER_ID: (state, id) => {
  state.id = id
},
    SET_PERMISSIONS: (state, permissionArr) => {
      state.permissions = permissionArr
    }
  },
  actions: {

    // 用户登录
    loginByUsername({ commit }, userInfo) {
      return new Promise((resolve, reject) => {
        loginByUsername(userInfo).then(response => {
          if (response && response.code === 0) {	// 登录成功
            const res = response.data
            commit('SET_USER_ID', res.id)
            commit('SET_TOKEN', res.token)
            commit('SET_USER', res)
            commit('SET_USERNAME', res.username)
            setToken(res.token)
            setUserId(res.id)
          }
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 登出
    logOut({ commit }) {
      return new Promise((resolve, reject) => {
        logout().then(res => {
          if (res.code === 0) {
            commit('SET_TOKEN', '')
            commit('SET_USER', null)
            commit('SET_PERMISSIONS', [])
            removeToken()
            router.push({ path: '/login' })
            location.reload()
          }
          resolve(res)
        }).catch(error => {
          commit('SET_TOKEN', '')
          commit('SET_USER', null)
          commit('SET_PERMISSIONS', [])
          removeToken()
          location.reload()
          reject(error)
        })
      })
    },

    // 获取用户信息
    getInfo({ commit }) {
      return new Promise((resolve, reject) => {
        getUserInfo().then(res => {
          if (res.code === 0) {
            commit('SET_USER', res.data)
            commit('SET_USERNAME', res.data.username)
          }
          resolve(res)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 设置用户权限permission
    setPermissions({ commit }, permissionArr) {
      return new Promise((resolve) => {
        commit('SET_PERMISSIONS', permissionArr)
        resolve()
      })
    }
  }
}

export default user
