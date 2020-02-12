import request from '@/utils/request'

export function getMenuList() {
  return request({
    url: '/sys/menu/all',
    method: 'get'
  })
}
export function listTopMenu() {
  return request({
    url: '/sys/menu/listTopMenu',
    method: 'get'
  })
}
