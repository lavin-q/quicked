import request from '@/utils/request'

// 列表
export function list(param) {
  return request({
    url: '/online/graphreport/head/list',
    method: 'get',
    params: param
  })
}

export function info(id) {
  return request({
    url: '/online/graphreport/head/getInfo?id=' + id,
    method: 'get'
  })
}

export function add(data) {
  return request({
    url: '/online/graphreport/head/add',
    method: 'post',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

export function update(data) {
  return request({
    url: '/online/graphreport/head/edit',
    method: 'put',
    data: data,
    headers: {
      'Content-type': 'application/json;charset=UTF-8'
    }
  })
}

// 删除
export function del(id) {
  return request({
    url: '/online/graphreport/head/delete?id=' + id,
    method: 'delete'
  })
}

// 批量删除
export function delBatch(ids) {
  return request({
    url: '/online/graphreport/head/deleteBatch?ids=' + ids,
    method: 'delete'
  })
}

export function getChartsData(id) {
  return request({
    url: '/online/graphreport/api/getChartsData?id=' + id,
    method: 'get'
  })
}
