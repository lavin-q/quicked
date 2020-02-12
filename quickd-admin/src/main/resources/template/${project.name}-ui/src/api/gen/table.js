import request from '@/utils/request'

// 获取列表
export function list(params) {
  return request({
    url: '/gen/table/list',
    method: 'get',
    params: params
  })
}
// 获取列表
export function select(params) {
  return request({
    url: '/gen/table/select',
    method: 'get',
    params: params
  })
}
// 获取信息
export function info(id) {
  return request({
    url: '/gen/table/info?id=' + id,
    method: 'get'
  })
}

// 添加
export function add(params) {
  return request({
    url: '/gen/table/save',
    method: 'post',
    data: params
  })
}

// 修改
export function update(params) {
  return request({
    url: '/gen/table/update',
    method: 'put',
    data: params
  })
}
export function updateColumn(data) {
  return request({
    url: '/gen/tableColumn/updateColumn',
    method: 'put',
    data: data
  })
}

// 删除
export function del(params) {
  return request({
    url: '/gen/table/delete',
    method: 'delete',
    data: params
  })
}

// 获取列表
export function tableList() {
  return request({
    url: '/gen/table/tableList',
    method: 'get'
  })
}

// 获取列列表
export function listTableColumn(params) {
  return request({
    url: '/gen/tableColumn/listTableColumn',
    method: 'get',
    params: params
  })
}

// 获取列表
export function columnSelect(params) {
  return request({
    url: '/gen/tableColumn/select',
    method: 'get',
    params: params
  })
}


// 修改
export function genCode(params) {
  return request({
    url: '/gen/table/code',
    method: 'post',
    data: params
  })
}
