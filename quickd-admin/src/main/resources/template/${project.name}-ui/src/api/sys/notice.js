import request from '@/utils/request'
// 获取列表
export function list(params) {
  return request({
    url: '/sys/notice/list',
    method: 'get',
    params: params
  })
}

// 获取信息
export function info(id) {
  return request({
    url: '/sys/notice/info?id=' + id,
    method: 'get'
  })
}
// 获取信息
export function listNoticeByUser() {
  return request({
    url: '/sys/notice/listByUser',
    method: 'get'
  })
}

// 更新用户系统消息阅读状态
export function setRead(params) {
  return request({
    url: '/sys/noticeRead/setRead',
    method: 'put',
    params: params
  })
}


// 添加
export function add(params) {
  return request({
    url: '/sys/notice',
    method: 'post',
    data: params
  })
}

// 修改
export function update(params) {
  return request({
    url: '/sys/notice/update',
    method: 'put',
    data: params
  })
}
// 删除
export function del(params) {
  return request({
    url: '/sys/notice',
    method: 'delete',
    data: params
  })
}
// 下载
export function download(params) {
  return request({
    url: '/sys/notice/export',
    method: 'post',
    params: params,
    responseType: 'blob'
  })
}

// 发布
export function publish(params) {
  return request({
    url: '/sys/notice/doReleaseData',
    method: 'put',
    data: params
  })
}

// 撤销
export function cancel(params) {
  return request({
    url: '/sys/notice/doReovkeData',
    method: 'put',
    data: params
  })
}

