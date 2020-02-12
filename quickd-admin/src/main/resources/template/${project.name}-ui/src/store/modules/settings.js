import Settings from '@/settings'
import variables from '@/styles/element-variables.scss'

const settings = {
  state: {
    showRightPanel: false,
    tagsView: Settings.tagsView,
    fixedHeader: Settings.fixedHeader,
    sidebarLogo: Settings.sidebarLogo,
    theme: variables.theme,
    settingBtn: Settings.settingBtn,
    uniqueOpened: Settings.uniqueOpened,
    showFooter: Settings.showFooter,
    footerTxt: Settings.footerTxt,
    caseNumber: Settings.caseNumber
  },
  mutations: {
    CHANGE_SETTING: (state, { key, value }) => {
      if (state.hasOwnProperty(key)) {
        state[key] = value
      }
    }
  },
  actions: {
    changeSetting({ commit }, data) {
      commit('CHANGE_SETTING', data)
    }
  }
}
export default settings
