import router from './routers'
import store from '../store'
import Settings from '@/settings'
import NProgress from 'nprogress' // Progress 进度条
import 'nprogress/nprogress.css' // Progress 进度条样式
import { MessageBox } from 'element-ui'
import { getToken } from '@/utils/auth'
import { filterAsyncRouter } from '../store/modules/permission'

NProgress.configure({ showSpinner: false })// NProgress Configuration

const whiteList = ['/login'] // 不重定向白名单
router.beforeEach((to, from, next) => {
  beforeEachHandle(to, from, next)
})

const maxErrorTimes = Settings.maxErrorTimesOfGetMenusData // 菜单获取的最大的报错次数
let currentErrorTimes = maxErrorTimes // 当前剩余报错次数
function beforeEachHandle(to, from, next) {
  if (to.meta.title) {
    document.title = to.meta.title + ' - ' + Settings.webName
  }

  NProgress.start()
  if (getToken()) {
    if (!store.getters.user) {
      store.dispatch('getInfo', []).then(res => {
        console.log(res)
      })
    }

    if (to.path === '/login') { // 已登录且要跳转的页面是登录页
      next({ path: '/' })
      NProgress.done()
    } else {
      if (currentErrorTimes === 0) {
        MessageBox.alert('对不起，菜单数据获取失败', '信息提示', {
          callback: () => {
            store.dispatch('logOut').then(() => {
              location.reload() // 为了重新实例化vue-router对象 避免bug
              next({ path: '/login' })
            })
          }
        })
      } else {
        if (store.getters.menuList.length === 0) { // 判断当前是否已拉取完menu信息
          // 动态路由，拉取菜单
          loadMenus(next, to)
        } else {
          currentErrorTimes = maxErrorTimes
          next()
        }
      }
    }
  } else {
    if (whiteList.indexOf(to.path) !== -1) { // 在免登录白名单，直接进入
      next()
    } else {
      next(`/login?redirect=${to.path}`) // 否则全部重定向到登录页
      NProgress.done()
    }
  }
}

export const loadMenus = (next, to) => {
  store
    .dispatch('getMenuList').then(res => {
      if (res.code === 0) {
        const asyncRouter = filterAsyncRouter(res.data.menuList)
        asyncRouter.push({ path: '*', redirect: '/404', hidden: true })
        store.dispatch('generateRoutes', asyncRouter).then(() => { // 存储路由
          router.addRoutes(asyncRouter) // 动态添加可访问路由表
          next({ ...to, replace: true })// hack方法 确保addRoutes已完成
        })
      } else {
        currentErrorTimes--
        store.dispatch('setMenuList', []).then(() => {
          next({ path: to.path }) // 重新刷新一次
        })
      }
    })
    .catch(err => {
      currentErrorTimes--
      console.log(err)
      store.dispatch('logOut').then(() => {
        location.reload() // 为了重新实例化vue-router对象 避免bug
      })
    })
}

router.afterEach(() => {
  NProgress.done() // 结束Progress
})
