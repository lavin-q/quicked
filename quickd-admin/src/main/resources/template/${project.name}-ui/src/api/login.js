import request from '@/utils/request'

/**
 *  json: 'application/json; charset=utf-8'
 *  form: 'application/x-www-form-urlencoded; charset=utf-8'
 */

// 获取验证码
export function getCodeKeySrc(codeKey) {
  return request({
    url: `/captcha?uuid=${codeKey}`,
    responseType: 'arraybuffer',
    transformResponse: [function(response) {
      const res = 'data:image/png;base64,' + btoa(
        new Uint8Array(response)
          .reduce((data, byte) => data + String.fromCharCode(byte), '')
      )
      return res
    }]
  })
}

// 用户名登录
export function loginByUsername(data) {
  return request({
    url: '/login',
    method: 'post',
    data: data
  })
}

// 登出
export function logout() {
  return request({
    url: '/sys/logout',
    method: 'post'
  })
}

// 获取当前用户信息
export function getUserInfo() {
  return request({
    url: '/sys/user/userInfo',
    method: 'get'
  })
}
