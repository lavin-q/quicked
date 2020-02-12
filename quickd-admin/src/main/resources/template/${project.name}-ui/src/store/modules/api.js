const baseUrl = process.env.BASE_API
const api = {
  state: {
    // 实时控制台
    socketApi: baseUrl + '/websocket?token=kl',
    // 图片上传
    imagesUploadApi: baseUrl + '/api/pictures',
    // 修改头像
    updateAvatarApi: baseUrl + '/api/users/updateAvatar',
    // Sql 监控
    sqlApi: baseUrl + '/druid',
    // swagger
    swaggerApi: baseUrl + '/doc.html',
    // 文件上传
    fileUploadApi: baseUrl + '/api/localStorage',
    // baseUrl，
    baseApi: baseUrl
  }
}

export default api
