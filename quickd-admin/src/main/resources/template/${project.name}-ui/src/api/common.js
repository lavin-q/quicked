import request from '@/utils/request'

// 根据手机号，获取手机验证码
export function getMobCode(data) {
  return request({
    url: '/code/getSmsCodeOnlyMob',
    method: 'post',
    params: { mob: data },
    headers: {
      'Content-type': 'application/x-www-form-urlencoded'
    }
  })
}

// 验证手机号验证码
export function checkMobileCode(data) {
  return request({
    url: '/code/checkCode',
    method: 'post',
    params: data,
    headers: {
      'Content-type': 'application/x-www-form-urlencoded'
    }
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

// 找回密码
export function findLostPwd(data) {
  return request({
    url: '/code/findLostPwd',
    method: 'post',
    params: data
  })
}

// 刷新token
export function freshToken(data) {
  return request({
    url: '/sys/freshToken',
    method: 'post',
    params: data,
    headers: {
      'Content-type': 'application/x-www-form-urlencoded'
    }
  })
}

// 上传图片信息
export function uploadImages(contentfile) {
  return request({
    url: '/sys/oss/upload/multi',
    method: 'post',
    timeout: 60000,
    data: contentfile,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

// 系统公告
export function noticeInfo() {
  return request({
    url: '/sys/notice/info',
    method: 'get'
  })
}

// 系统公告
export function noticeList() {
  return request({
    url: '/sys/notice/list',
    method: 'get'
  })
}

// 获取服务器时间
export function latestTime() {
  return request({
    url: '/tool/now',
    method: 'get'
  })
}
