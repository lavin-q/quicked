import { constantRouterMap } from '@/router/routers'
import Layout from '@/layout/Layout'
import { isExternal } from '@/utils/tool'

/**
 * Use meta.role to determine if the current user has permission
 * @param roles
 * @param route
 */

const permission = {
  state: {
    routers: constantRouterMap,
    addRouters: []
  },
  mutations: {
    SET_ROUTERS: (state, routers) => {
      state.addRouters = routers
      state.routers = constantRouterMap.concat(routers)
    }
  },
  actions: {
    generateRoutes({ commit }, asyncRouter) {
      commit('SET_ROUTERS', asyncRouter)
    }
  }
}

export const _generateAsyncRouter = (routers) => { // 遍历后台传来的路由字符串，转换为组件对象
  const res = []

  routers.forEach(router => {
    const tmp = {
      path: router.url,
      component: router.component,
      name: router.name,
      meta: { 'title': router.name, icon: router.icon, isIframe: false, iframeUrl: null }
    }
    if (tmp.component) {
      if (tmp.component === 'Layout') { // Layout组件特殊处理
        tmp.component = Layout
      } else if (isExternal(tmp.component)||tmp.redirect=='layouts/IframePageView') {
        tmp.meta.isIframe = true
        tmp.meta.iframeUrl = tmp.component
        tmp.component = Layout
      } else {
        const component = tmp.component
        tmp.component = loadView(component)
      }
    }
    if (router.children && router.children.length) {
      tmp.children = _generateAsyncRouter(router.children)
    }
    res.push(tmp)
  })

  return res
}

export const filterAsyncRouter = (menuList) => { // 遍历后台传来的路由字符串，转换为组件对象
  const detailMenuLists = [
    // {
    //   url: 'xxx/form',
    //   component: ('modules/base/xxx/xxx-form'),
    //   name: '编辑xxx信息',
    //   icon: null,
    //   menuId: 9101,
    //   // parentId: 114,
    //   parentId: 0,
    //   parentName: 'xx信息',
    //   type: 1,
    //   parentUrl: '/xxx/info',
    //   hidden: true
    // }
  ]

  const allMenuList = [...menuList, ...detailMenuLists]

  // 过滤出一级菜单(顶部菜单)
  let level1MenuList = allMenuList.filter((item) => {
    if (item.type === 0) {
      item.url = '/' + item.url
      item.parentUrl = null
      if (item.component !== 'Layout') { // 一级菜单是iframe
        const itemTemp = Object.assign({}, item)
        itemTemp.url = ''
        item.children = [itemTemp]
        item.component = 'Layout'
        item.name = ''
      }
      return true
    } else {
      return false
    }
  })
  // 若一级菜单不存在，则说明是全部左侧菜单，过滤出一级菜单(顶部菜单)
  if (level1MenuList.length === 0) {
    level1MenuList = allMenuList.filter((item) => {
      if (item.type === 1) {
        item.url = '/' + item.url
        item.parentUrl = null
        if (item.component !== 'Layout') { // 一级菜单是iframe
          const itemTemp = Object.assign({}, item)
          itemTemp.url = ''
          item.children = [itemTemp]
          item.component = 'Layout'
          item.name = ''
        }
        return true
      } else {
        return false
      }
    })
  }
  // 格式化菜单数据，分一级菜单，子菜单放入children属性下
  const formatedMenuList = level1MenuList.map((item) => {
    const arrTemp = allMenuList.filter((it) => {
      if (item.id === it.parentId && it.type !== 2) {
        it.parentUrl = item.url
        return true
      } else {
        return false
      }
    })
    if (arrTemp.length > 0) {
      item.children = arrTemp
    }
    return item
  })
  const asyncRouter = _generateAsyncRouter(formatedMenuList)

  // const res = [{
  //   path: '/',
  //   component: Layout,
  //   isLayout: true,
  //   redirect: 'dashboard',
  //   children: asyncRouter
  // }]
  return asyncRouter
}

export const loadView = (view) => { // 路由懒加载
  return () => import(`@/views/${view}`)
}

export default permission
