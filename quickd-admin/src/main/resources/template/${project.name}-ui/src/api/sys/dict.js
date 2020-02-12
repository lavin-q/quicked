import request from '@/utils/request'
// 获取列表
export function list(params) {
  return request({
    url: '/sys/dict/list',
    method: 'get',
    params: params
  })
}
// 获取列表
export function select(params) {
  return request({
    url: '/sys/dict/select',
    method: 'get',
    params: params
  })
}
// 获取信息
export function info(id) {
  return request({
    url: '/sys/dict/info?id=' + id,
    method: 'get'
  })
}

// 添加
export function add(params) {
  return request({
    url: '/sys/dict',
    method: 'post',
    data: params
  })
}

// 修改
export function update(params) {
  return request({
    url: '/sys/dict/update',
    method: 'put',
    data: params
  })
}
// 删除
export function del(params) {
  return request({
    url: '/sys/dict/delete',
    method: 'delete',
    data: params
  })
}

// 字典配置列表
export function listOfDictItem(params) {
  return request({
    url: '/sys/dictItem/list',
    method: 'get',
    params: params
  })
}
// 字典配置列表
export function selectOfDictItem(params) {
  return request({
    url: '/sys/dictItem/select',
    method: 'get',
    params: params
  })
}
// 字典配置信息
export function infoOfDictItem(id) {
  return request({
    url: '/sys/dictItem/info?id=' + id,
    method: 'get'
  })
}

// 字典配置添加
export function addOfDictItem(params) {
  return request({
    url: '/sys/dictItem/save',
    method: 'post',
    data: params
  })
}

// 字典配置修改
export function updateOfDictItem(params) {
  return request({
    url: '/sys/dictItem/update',
    method: 'put',
    data: params
  })
}
// 字典配置删除
export function delOfDictItem(params) {
  return request({
    url: '/sys/dictItem/delete',
    method: 'delete',
    data: params
  })
}

