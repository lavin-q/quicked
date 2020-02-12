import request from '@/utils/request'
// 获取列表
export function list(params) {
  return request({
    url: '/sys/dept/list',
    method: 'get',
    params: params
  })
}
// 获取列表
export function treeList(params) {
  return request({
    url: '/sys/dept/queryTreeList',
    method: 'get',
    params: params
  })
}
// 获取信息
export function info(id) {
  return request({
    url: '/sys/dept/info?id=' + id,
    method: 'get'
  })
}

// 添加
export function add(params) {
  return request({
    url: '/sys/dept/add',
    method: 'post',
    data: params
  })
}

// 修改
export function update(params) {
  return request({
    url: '/sys/dept/update',
    method: 'put',
    data: params
  })
}
// 删除
export function del(params) {
  return request({
    url: '/sys/dept/delete',
    method: 'delete',
    data: params
  })
}

// 获取部门下的人员列表
export function getDeptUserList(params) {
  return request({
    url: '/sys/user/list',
    method: 'get',
    params: params
  })
}

// 删除部门下的人员列表
export function delDeptUserList(params) {
  return request({
    url: '/sys/dept/delete',
    method: 'delete',
    data: params
  })
}
