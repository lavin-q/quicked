import request from '@/utils/request'
// 获取列表
export function list (params) {
    return request({
        url: 'sys/logError/list',
        method: 'get',
        params: params
    })
}
// 获取列表
export function select (params) {
    return request({
        url: 'sys/logError/select',
        method: 'get',
        params: params
    })
}
// 获取信息
export function info (id) {
    return request({
        url: 'sys/logError/info/info?id=' + id,
    method: 'get'
    })
}

// 添加
export function add (params) {
    return request({
        url: 'sys/logError/save',
        method: 'post',
        data: params
    })
}

// 修改
export function update (params) {
    return request({
        url: 'sys/logError/update',
        method: 'post',
        data: params
    })
}
// 审核
export function audit (params) {
    return request({
        url: 'sys/logError/audit',
        method: 'post',
        data: params
    })
}
// 删除
export function del (params) {
    return request({
        url: 'sys/logError/delete',
        method: 'post',
        data: params
    })
}
// 下载
export function download(param){
    return request({
        url:'sys/logError/download',
        method:'post',
        params:param,
        responseType: 'blob'
    })
}

