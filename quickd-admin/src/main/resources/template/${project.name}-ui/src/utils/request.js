import axios from 'axios'
import { Notification, MessageBox, Message } from 'element-ui'
import { getToken, setToken, removeToken } from '@/utils/auth'
import Settings from '@/settings'

// create an axios instance
const service = axios.create({
  baseURL: process.env.BASE_API, // api的base_url
  timeout: Settings.timeout, // 请求超时时间
})


const err = (error) => {
  if (error.response) {
    let data = error.response.data
    const token = getToken()
    console.log("------异常响应------",token)
    console.log("------异常响应------",error.response.status)
    switch (error.response.status) {
      case 403:
        Message.error({
          showClose: true,
          message: '403：拒绝访问',
          duration: 4000
        })
        break
      case 404:
        Message.error({
          showClose: true,
          message: '很抱歉，资源未找到!',
          duration: 4000
        })
        break
      case 504:
        Message.error({
          showClose: true,
          message: '网络超时!',
          duration: 4000
        })
        break
      case 401:
        if (token) {
          MessageBox.alert('很抱歉，登录已过期，请重新登录', '登录已过期', {
            callback: () => {
            store.dispatch('logOut').then(() => {
              removeToken()
              location.reload() // 为了重新实例化vue-router对象 避免bug
              next({ path: '/login' })
            })
        }
        })
        }
        break
      default:
        Message.error({
          showClose: true,
          message: data.message,
          duration: 4000
        })
        break
    }
  }
  return Promise.reject(error)
};

// request interceptor
service.interceptors.request.use(config => {
    const token = getToken()
    if (token) {
      config.headers['token'] =token// 让每个请求携带自定义 token 请根据实际情况自行修改
    }
    if (config.params && config.params.filters) {
      config.params.filters = encodeURI(JSON.stringify(config.params.filters))
    }
    return config
   },(error) => {
      return Promise.reject(error)
})

// response interceptor
service.interceptors.response.use((response) => {
  return response.data
}, err)


export default service
