import request from '@/utils/request'

// 列表
export function getList(param){
	return request({
		url:'/sys/generator/list',
		method:'get',
		params:param
	})
}
// 生成代码
export function generator(data){
	return request({
		url:'/sys/generator/delete',
		method:'get',
		data:data
	})
}