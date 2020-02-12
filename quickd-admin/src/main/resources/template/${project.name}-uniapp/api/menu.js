import request from '@/common/request.js'

// 获取列表
export function listUniappMenu(param){
	return request.get('/sys/menu/listUniappMenu',param,{'Content-type': 'application/json;charset=UTF-8'})
}
