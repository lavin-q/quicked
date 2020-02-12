import request from '@/utils/request'

// 列表
export function getRoleList(param) {
  return request({
    url: '/sys/role/list',
    method: 'get',
    params: param
  })
}

export function deleteRole(data) {
  return request({
    url: '/sys/role/delete',
    method: 'delete',
    data: data
  })
}

export function getRoleInfo(id) {
  return request({
    url: '/sys/role/info?id=' + id,
    method: 'get'
  })
}

export function getSelectRole() {
  return request({
    url: '/sys/role/select',
    method: 'get'
  })
}

export function addRole(data) {
  return request({
    url: '/sys/role/save',
    method: 'post',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

export function updRole(data) {
  return request({
    url: '/sys/role/update',
    method: 'put',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

// 下载
export function download(param) {
  return request({
    url: '/sys/role/export',
    method: 'post',
    params: param,
    responseType: 'blob'
  })
}

// 导入
export function importExcel(param) {
  return request({
    url: '/sys/role/importExcel',
    method: 'post',
    params: param,
    responseType: 'blob'
  })
}

// 角色的菜单分配
export function queryRolePermission(param) {
  return request({
    url: '/sys/menu/queryRolePermission',
    method: 'get',
    params: param
  })
}

export function saveRoleMenus(param) {
  return request({
    url: '/sys/menu/saveRoleMenus',
    method: 'post',
    params: param
  })
}

// 角色的权限分配
export function getRolePermissions(param) {
  return request({
    url: '/sys/role/permissions',
    method: 'get',
    params: param
  })
}

export function saveRolePermissions(data) {
  return request({
    url: '/sys/role/permissions',
    method: 'post',
    data: data
  })
}
