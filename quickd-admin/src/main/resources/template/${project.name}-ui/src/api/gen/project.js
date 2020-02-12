import request from '@/utils/request'
// 获取列表
export function list(params) {
  return request({
    url: '/gen/project/list',
    method: 'get',
    params: params
  })
}

export function genCode(obj) {
  return request({
    url: '/gen/project/gen-code',
    method: 'post',
    data: obj,
    responseType: 'blob'
  })
}

// 获取信息
export function info(id) {
  return request({
    url: '/gen/project/info?id=' + id,
    method: 'get'
  })
}

// 添加
export function add(params) {
  return request({
    url: '/gen/project/save',
    method: 'post',
    data: params
  })
}

// 修改
export function update(params) {
  return request({
    url: '/gen/project/update',
    method: 'put',
    data: params
  })
}
// 删除
export function del(params) {
  return request({
    url: '/gen/project/delete',
    method: 'delete',
    data: params
  })
}



