import Cookies from 'js-cookie'
import Settings from '@/settings'

const TokenKey = Settings.TokenKey
const UserKey = 'User-ID'
export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token, { expires: Settings.tokenCookieExpires })
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}
export function getUserId () {
  return Cookies.get(UserKey)
}

export function setUserId (id) {
  return Cookies.set(UserKey, id)
}

export function removeUserId () {
  return Cookies.remove(UserKey)
}
