import request from '@/utils/request'

// 任务列表
export function getJobList(param){
	return request({
		url:'sys/schedule/list',
		method:'get',
		params:param
	})
}

// 任务日志列表
export function getJobLogList(param){
	return request({
		url:'sys/scheduleLog/list',
		method:'get',
		params:param
	})
}

// 任务日志列表
export function getJobLogInfo(id){
	return request({
		url:'sys/scheduleLog/info?id='+id,
		method:'get',
		params:param
	})
}

export function deleteJob(data){
	return request({
		url:'/sys/schedule/delete',
		method:'delete',
		data:data
	})
}

export function pauseJob(data){
	return request({
		url:'/sys/schedule/pause',
		method:'put',
		data:data
	})
}
export function resumeJob(data){
	return request({
		url:'/sys/schedule/resume',
		method:'put',
		data:data
	})
}

export function runJob(data){
	return request({
		url:'/sys/schedule/run',
		method:'put',
		data:data
	})
}
export function getJobInfo(id){
	return request({
		url:'/sys/schedule/'+id,
		method:'get'
	})
}

export function addJob(data){
	return request({
		url:'/sys/schedule/save',
		method:'post',
		data: data,
		headers: {
			'Content-type': 'application/json;charset=UTF-8'
		}
	})
}

export function updJob(data){
	return request({
		url:'/sys/schedule/update',
		method:'put',
		data: data,
		headers: {
			'Content-type': 'application/json;charset=UTF-8'
		}
	})
}
