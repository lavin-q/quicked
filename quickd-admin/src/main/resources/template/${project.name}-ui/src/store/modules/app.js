import Cookies from 'js-cookie'
import Settings from '@/settings'
import { getMenuList } from '@/api/menu'

const app = {
  state: {
    sidebar: {
      opened: !+Cookies.get('sidebarStatus'),
      withoutAnimation: false
    },
    // 导航条, 布局风格, defalut(白色) / colorful(鲜艳)
    navbarLayoutType: Settings.navbarLayoutType,
    // 侧边栏, 布局皮肤, default(白色) / dark(黑色)
    sidebarLayoutSkin: Settings.sidebarLayoutSkin,
    // 内容, 是否需要刷新
    contentIsNeedRefresh: false,
    menuList: [],
    device: 'desktop', // desktop 桌面pc端，mobile 移动端
    size: Cookies.get('size') || 'small'
  },
  mutations: {
    TOGGLE_SIDEBAR: state => {
      if (state.sidebar.opened) {
        Cookies.set('sidebarStatus', 1)
      } else {
        Cookies.set('sidebarStatus', 0)
      }
      state.sidebar.opened = !state.sidebar.opened
      state.sidebar.withoutAnimation = false
    },
    CLOSE_SIDEBAR: (state, withoutAnimation) => {
      Cookies.set('sidebarStatus', 1)
      state.sidebar.opened = false
      state.sidebar.withoutAnimation = withoutAnimation
    },
    OPEN_SIDEBAR: (state, withoutAnimation) => {
      Cookies.set('sidebarStatus', 0)
      state.sidebar.opened = true
      state.sidebar.withoutAnimation = withoutAnimation
    },
    SET_MENULIST: (state, menuList) => {
      state.menuList = menuList
    },
    TOGGLE_DEVICE: (state, device) => {
      state.device = device
    },
    SET_SIZE: (state, size) => {
      state.size = size
      Cookies.set('size', size)
    }
  },
  actions: {
    toggleSideBar: ({ commit }) => {
      commit('TOGGLE_SIDEBAR')
    },

    closeSideBar({ commit }, { withoutAnimation }) {
      commit('CLOSE_SIDEBAR', withoutAnimation)
    },

    openSideBar({ commit }, { withoutAnimation }) {
      commit('OPEN_SIDEBAR', withoutAnimation)
    },

    getMenuList({ dispatch, commit }) {
      return new Promise((resolve, reject) => {
        getMenuList().then(response => {
          if (response && response.code === 0) { // 菜单获取成功
            commit('SET_MENULIST', response.data.menuList)
            dispatch('setPermissions', response.data.permissions)
          }
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    setMenuList({ commit }, menuListArr) {
      return new Promise((resolve) => {
        commit('SET_MENULIST', menuListArr)
        resolve()
      })
    },

    toggleDevice({ commit }, device) {
      commit('TOGGLE_DEVICE', device)
    },

    setSize({ commit }, size) {
      commit('SET_SIZE', size)
    }
  }
}

export default app
