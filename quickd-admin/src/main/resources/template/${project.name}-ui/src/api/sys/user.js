import request from '@/utils/request'

// 用户列表
export function getUserList(param) {
  return request({
    url: '/sys/user/list',
    method: 'get',
    params: param
  })
}
export function getUserPage(param) {
  return request({
    url: '/sys/user/page',
    method: 'get',
    params: param
  })
}
export function deleteUser(data) {
  return request({
    url: '/sys/user',
    method: 'delete',
    data: data
  })
}

export function getUserInfo(id) {
  return request({
    url: '/sys/user/info?id=' + id,
    method: 'get'
  })
}

export function addUser(data) {
  return request({
    url: '/sys/user/add',
    method: 'post',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

export function updUser(data) {
  return request({
    url: '/sys/user/update',
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
    url: '/sys/user/export',
    method: 'post',
    params: param,
    responseType: 'blob'
  })
}

// 导入
export function importExcel(param) {
  return request({
    url: '/sys/user/importExcel',
    method: 'post',
    params: param,
    responseType: 'blob'
  })
}
export function updateEmail(code, data) {
  return request({
    url: '/sys/user/updateEmail/' + code,
    method: 'post',
    data
  })
}
// 修改密码
export function modifyPwd(data) {
  return request({
    url: '/sys/user/password',
    method: 'post',
    data: data
  })
}
export function resetEmail(data) {
  return request({
    url: 'sys/user/resetEmail',
    method: 'post',
    data
  })
}
