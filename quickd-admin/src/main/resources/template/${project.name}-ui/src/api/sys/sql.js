import request from '@/utils/request'

// 列表
export function getSqlList(param){
	return request({
		url:'/sys/sql/list',
		method:'get',
		params:param
	})
}

export function deleteSql(data){
	return request({
		url:'/sys/sql/delete',
		method:'post',
		data:data
	})
}