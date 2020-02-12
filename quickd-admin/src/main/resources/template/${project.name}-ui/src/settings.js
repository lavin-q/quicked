/**
 * @description 系统全局配置
 */

export default {
  /**
   * @description 记住密码状态下的token在Cookie中存储的天数，默认1天
   */
  tokenCookieExpires: 1,
  /**
   * @description 记住密码状态下的密码在Cookie中存储的天数，默认1天
   */
  passCookieExpires: 1,
  /**
   * @description 此处修改网站名称
   */
  webName: '${project.sysName}',
  /**
   * @description 此处修改项目版本号
   */
  webVersion: 'v1.0',
  /**
   * @description 是否只保持一个子菜单的展开
   */
  uniqueOpened: true,
  /**
   * @description token key
   */
  TokenKey: '${project.name}-TOEKN',

  /**
   * @description 请求超时时间，毫秒（默认2分钟）
   */
  timeout: 1200000,

  /**
   * 菜单获取最大报错次数
   */
  maxErrorTimesOfGetMenusData: 5,

  /* ---------------------------------------------------------------------------------
    页面显示 内容 配置--->
  ----------------------------------------------------------------------------------**/

  /**
   * @description 是否显示 tagsView
   */
  tagsView: true,

  /**
   * @description 固定头部
   */
  fixedHeader: false,

  /**
   * @description 是否显示logo
   */
  sidebarLogo: true,

  /**
   * 是否显示设置的悬浮按钮
   */
  settingBtn: false,

  /**
   * 是否显示设置的底部信息
   */
  showFooter: true,

  /**
   * 底部文字，支持html语法
   */
  footerTxt: '',

  /**
   * 备案号
   */
  caseNumber: '',

  /* --------------------------------------------------------------------------------
    <---页面显示 内容 配置
  ----------------------------------------------------------------------------------**/

  /* ---------------------------------------------------------------------------------
    页面显示 色彩 配置--->
  ----------------------------------------------------------------------------------**/

  /**
   *  导航条, 布局风格, default(默认白色) / blue(蓝色) / colorful(鲜艳)
   */
  navbarLayoutType: 'colorful',
  /**
   *  侧边栏, 布局皮肤, default(默认白色) / dark(黑色) / colorful(鲜艳)
   */
  sidebarLayoutSkin: 'default'

  /* ---------------------------------------------------------------------------------
    <---页面显示 色彩 配置
  ----------------------------------------------------------------------------------**/
}
