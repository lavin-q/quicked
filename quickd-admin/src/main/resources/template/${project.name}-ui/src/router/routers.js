import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '../layout/Layout'

/**
* hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
* redirect: noredirect           if `redirect:noredirect` will no redirect in the breadcrumb
* name:'router-name'             the name is used by <keep-alive> (must set!!!)
* meta : {
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
  }
**/
export const constantRouterMap = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path*',
        component: () => import('@/views/redirect/index')
      }
    ]
  },
  { path: '/login',
    meta: { title: '登录', keepAlive: false, noCache: true },
    component: () => import('@/views/login'),
    hidden: true
  },
  {
    path: '/404',
    meta: { title: '404未找到', keepAlive: true, noCache: true },
    component: () => import('@/views/error-page/404'),
    hidden: true
  },
  {
    path: '/401',
    meta: { title: '401页面失效，需重新登录', keepAlive: true, noCache: true },
    component: () => import('@/views/error-page/401'),
    hidden: true
  },
  {
    path: '/noAccess',
    meta: { title: '对不起，您没有权限访问该页面！', keepAlive: true, noCache: true },
    component: () => import('@/views/error-page/unauthorized'),
    hidden: true
  },
{
  path: '/preview/:hash',
    component: () => import('@/views/modules/datav/Preview'),
  hidden: true
},
{
  path: '/dashboard/:hash',
    component: () => import('@/views/modules/datav/Preview'),
  hidden: true
},
{
  path: '/edit/dashboard/:hash',
    component: () => import('@/views/modules/datav/Designer'),
  hidden: true
},
  {
    path: '/',
    component: Layout,
    redirect: 'dashboard',
    children: [
      {
        path: 'dashboard',
        component: () => import('@/views/dashboard/index'),
        name: '首页',
        meta: { title: '首页', icon: 'dashboard', affix: true }
      }
    ]
  },
{
  path: '/user',
    component: Layout,
  hidden: true,
  redirect: 'noredirect',
  children: [
  {
    path: 'center',
    component: () => import('@/views/modules/sys/user/center'),
  name: '个人中心',
  meta: { title: '个人中心', icon: 'user' }
}
]
}
]

export default new Router({
  // mode: 'history', // 后端支持可开
  mode: 'hash',
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

