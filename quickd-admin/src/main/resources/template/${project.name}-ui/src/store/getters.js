
export default {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  size: state => state.app.size,
  // 内容, 是否需要刷新
  contentIsNeedRefresh: state => state.app.contentIsNeedRefresh,
  menuList: state => state.app.menuList,
  token: state => state.user.token,
  username: state => state.user.username,
  permissions: state => state.user.permissions,
  user: state => state.user.user,
  addRouters: state => state.permission.addRouters,
  permission_routers: state => state.permission.routers,
  roads: state => state.maps.roads,
  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews,
  socketApi: state => state.api.socketApi,
  imagesUploadApi: state => state.api.imagesUploadApi,
  baseApi: state => state.api.baseApi,
  fileUploadApi: state => state.api.fileUploadApi,
  updateAvatarApi: state => state.api.updateAvatarApi,
  qiNiuUploadApi: state => state.api.qiNiuUploadApi,
  sqlApi: state => state.api.sqlApi,
  swaggerApi: state => state.api.swaggerApi,
  globalDictMap: state => state.globalDictMap.globalDictMap
}
