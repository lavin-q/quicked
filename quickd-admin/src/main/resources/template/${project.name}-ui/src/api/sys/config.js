import request from '@/utils/request'
// 获取列表
export function list (config) {
    return request({
        url: '/sys/config/list',
        method: 'get',
        config: config
    })
}
// 获取列表
export function select (config) {
    return request({
        url: '/sys/config/select',
        method: 'get',
        config: config
    })
}
// 获取信息
export function configInfo (configKey) {
    return request({
        url: '/sys/config/getConfig?key=' + configKey,
        method: 'get'
    })
}

// 添加
export function saveOrUpdateConfig (config) {
    return request({
        url: '/sys/config/saveOrUpdate',
        method: 'post',
        data: config
    })
}



