import request from '@/utils/request'

// 列表
export function getMenuList(param) {
  return request({
    url: '/sys/menu/queryTreeList',
    method: 'get',
    params: param
  })
}

export function deleteMenu(data) {
  return request({
    url: '/sys/menu/delete',
    method: 'delete',
    data: data
  })
}

export function getMenuInfo(id) {
  return request({
    url: '/sys/menu/info?id=' + id,
    method: 'get'
  })
}

export function addMenu(data) {
  return request({
    url: '/sys/menu/save',
    method: 'post',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

export function updMenu(data) {
  return request({
    url: '/sys/menu/update',
    method: 'put',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

// 列表
export function getPermissionList(param) {
  return request({
    url: '/sys/menu/queryTreeList',
    method: 'get',
    params: param
  })
}
