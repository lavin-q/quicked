import request from '@/utils/request'
// 获取列表
export function list (params) {
    return request({
        url: '/sys/logOperation/list',
        method: 'get',
        params: params
    })
}
// 获取列表
export function select (params) {
    return request({
        url: '/sys/logOperation/select',
        method: 'get',
        params: params
    })
}
// 获取信息
export function info (id) {
    return request({
        url: '/sys/logOperation/info/info?id=' + id,
    method: 'get'
    })
}

// 添加
export function add (params) {
    return request({
        url: '/sys/logOperation/save',
        method: 'post',
        data: params
    })
}

// 修改
export function update (params) {
    return request({
        url: '/sys/logOperation/update',
        method: 'post',
        data: params
    })
}
// 审核
export function audit (params) {
    return request({
        url: '/sys/logOperation/audit',
        method: 'post',
        data: params
    })
}
// 删除
export function del (params) {
    return request({
        url: '/sys/logOperation/delete',
        method: 'post',
        data: params
    })
}
// 下载
export function download(param){
    return request({
        url:'/sys/logOperation/download',
        method:'post',
        params:param,
        responseType: 'blob'
    })
}

