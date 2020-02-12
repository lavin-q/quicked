function getWindowClientHeight() {
  let winHeight = 0
  if (window.innerHeight) winHeight = window.innerHeight
  else if (document.body && document.body.clientHeight) {
    winHeight = document.body.clientHeight
  }
  return winHeight
}

export function getClientHeight() {
  return getWindowClientHeight()
}

/**
 * 获取uuid
 */
export function getUUID() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
    return (c === 'x' ? (Math.random() * 16) | 0 : 'r&0x3' | '0x8').toString(
      16
    )
  })
}

/**
 * 是否有权限
 * @param {*} key
 */
export function isAuth(key) {
  return (
    JSON.parse(sessionStorage.getItem('permissions') || '[]').indexOf(key) !==
      -1 || false
  )
}

/**
 * 格式化时间
 * @param {*} 时间
 * @param {*} 格式
 */
export function formatDate(time, cFormat) {
  if (arguments.length === 0) {
    return null
  }
  if (!time) {
    return ''
  }
  let fmt = cFormat || 'yyyy-MM-dd HH:mm:ss'

  let date
  if (typeof time === 'object') {
    date = time
  } else if (typeof time === 'string') {
    date = new Date(time)
  } else {
    date = new Date(parseInt(time))
  }

  var o = {
    'M+': date.getMonth() + 1, // 月份
    'd+': date.getDate(), // 日
    'h+': date.getHours() % 12 === 0 ? 12 : date.getHours() % 12, // 小时
    'H+': date.getHours(), // 小时
    'm+': date.getMinutes(), // 分
    's+': date.getSeconds(), // 秒
    'q+': Math.floor((date.getMonth() + 3) / 3), // 季度
    S: date.getMilliseconds() // 毫秒
  }
  var week = {
    '0': '\u65e5',
    '1': '\u4e00',
    '2': '\u4e8c',
    '3': '\u4e09',
    '4': '\u56db',
    '5': '\u4e94',
    '6': '\u516d'
  }
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(
      RegExp.$1,
      (date.getFullYear() + '').substr(4 - RegExp.$1.length)
    )
  }
  if (/(E+)/.test(fmt)) {
    fmt = fmt.replace(
      RegExp.$1,
      (RegExp.$1.length > 1
        ? RegExp.$1.length > 2
          ? '\u661f\u671f'
          : '\u5468'
        : '') + week[date.getDay() + '']
    )
  }
  for (var k in o) {
    if (new RegExp('(' + k + ')').test(fmt)) {
      fmt = fmt.replace(
        RegExp.$1,
        RegExp.$1.length === 1 ? o[k] : ('00' + o[k]).substr(('' + o[k]).length)
      )
    }
  }
  return fmt
}

export function isExternal(path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

// 替换邮箱字符
export function regEmail(email) {
  if (String(email).indexOf('@') > 0) {
    const str = email.split('@')
    let _s = ''
    if (str[0].length > 3) {
      for (var i = 0; i < str[0].length - 3; i++) {
        _s += '*'
      }
    }
    var new_email = str[0].substr(0, 3) + _s + '@' + str[1]
  }
  return new_email
}

// 替换手机字符
export function regMobile(mobile) {
  if (mobile.length > 7) {
    var new_mobile = mobile.substr(0, 3) + '****' + mobile.substr(7)
  }
  return new_mobile
}

/**
 * This is just a simple version of deep copy
 * Has a lot of edge cases bug
 * If you want to use a perfect deep copy, use lodash's _.cloneDeep
 * @param {Object} source
 * @returns {Object}
 */
export function deepClone(source) {
  if (!source && typeof source !== 'object') {
    throw new Error('error arguments', 'deepClone')
  }
  const targetObj = source.constructor === Array ? [] : {}
  Object.keys(source).forEach(keys => {
    if (source[keys] && typeof source[keys] === 'object') {
      targetObj[keys] = deepClone(source[keys])
    } else {
      targetObj[keys] = source[keys]
    }
  })
  return targetObj
}

/**
 * @param {Array} arr
 * @returns {Array}
 */
export function uniqueArr(arr) {
  return Array.from(new Set(arr))
}

/**
 * @returns {string}
 */
export function createUniqueString() {
  const timestamp = +new Date() + ''
  const randomNum = parseInt((1 + Math.random()) * 65536) + ''
  return (+(randomNum + timestamp)).toString(32)
}

/**
 * Check if an element has a class
 * @param {HTMLElement} elm
 * @param {string} cls
 * @returns {boolean}
 */
export function hasClass(ele, cls) {
  return !!ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'))
}

/**
 * Add class to element
 * @param {HTMLElement} elm
 * @param {string} cls
 */
export function addClass(ele, cls) {
  if (!hasClass(ele, cls)) ele.className += ' ' + cls
}

/**
 * Remove class from element
 * @param {HTMLElement} elm
 * @param {string} cls
 */
export function removeClass(ele, cls) {
  if (hasClass(ele, cls)) {
    const reg = new RegExp('(\\s|^)' + cls + '(\\s|$)')
    ele.className = ele.className.replace(reg, ' ')
  }
}

/**
 * @param {HTMLElement} element
 * @param {string} className
 */
export function toggleClass(element, className) {
  if (!element || !className) {
    return
  }
  let classString = element.className
  const nameIndex = classString.indexOf(className)
  if (nameIndex === -1) {
    classString += '' + className
  } else {
    classString =
      classString.substr(0, nameIndex) +
      classString.substr(nameIndex + className.length)
  }
  element.className = classString
}

/**
* 获取url中对应变量的值
*/
export function getURLParameter(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [null, ''])[1].replace(/\+/g, '%20')) || null
}

/**
 * 替换uri中的key参数的值,key为参数名,value为新值（用于处理window.location.search中的搜索字段）
 * @param {*uri} 传入的需要替换的字符串,若uri中不存在key值，则返回原来的uri
 * @param {*key} 参数名
 * @param {*value} 参数值
 */
export function updateQueryStringParameter(uri, key, value) {
  var re = new RegExp('([?&])' + key + '=.*?(&|$)', 'i')
  if (uri.match(re)) {
    return uri.replace(re, '$1' + key + '=' + value + '$2')
  } else {
    return uri
  }
}

/**
 * 设置uri中的key参数的值,key为参数名,value为新值，若uri中不存在，则重新设置参数变量（用于处理window.location.search中的搜索字段）
 * @param {*uri} 传入的需要替换的字符串
 * @param {*key} 参数名
 * @param {*value} 参数值
 */
export function setQueryStringParameter(uri, key, value) {
  var re = new RegExp('([?&])' + key + '=.*?(&|$)', 'i')
  var separator = uri.indexOf('?') !== -1 ? '&' : '?'
  if (uri.match(re)) {
    return uri.replace(re, '$1' + key + '=' + value + '$2')
  } else {
    return uri + separator + key + '=' + value
  }
}

/**
 * 替换url中指定传入参数的值,key为参数名,value为新值，
 * @param {*key} 参数名
 * @param {*value} 参数值
 */
export function replaceUrlParameter(key, value) {
  const oUrl = window.location.href.toString()
  const nUrl = setQueryStringParameter(oUrl, key, value)
  window.history.replaceState(null, null, nUrl)
  window.location.reload()
}

export function setLocalstorageExp(key, value) {
  const curTime = new Date().getTime()
  localStorage.setItem(key, JSON.stringify({ data: value, time: curTime }))
}

export function getLocalStorageItemExp(key, exp) {
  const data = localStorage.getItem(key)
  if (!data) return false
  const dataObj = JSON.parse(data)
  exp = exp * 60 * 60 * 1000
  if (new Date().getTime() - dataObj.time > exp) {
    localStorage.removeItem(key)
    return false
  } else {
    const dataObjDatatoJson = JSON.parse(dataObj.data)
    return dataObjDatatoJson
  }
}

// ajax错误处理
export const catchError = function(error) {
  const _this = this
  if (error.response) {
    switch (error.response.status) {
      case 400:
        _this.$message({
          message: error.response.data.msg || '请求参数异常',
          type: 'error'
        })
        break
      case 401:
        //   sessionStorage.removeItem('user');
        _this.$message({
          message: error.response.data.msg || '密码错误或账号不存在！',
          type: 'warning',
          onClose: function() {
            location.reload()
          }
        })
        break
      case 403:
        _this.$message({
          message: error.response.data.msg || '无访问权限，请联系企业管理员',
          type: 'warning'
        })
        break
      default:
        _this.$message({
          message: error.response.data.msg || '服务端异常，请联系技术支持',
          type: 'error'
        })
    }
  }
  return Promise.reject(error)
}

/**
 * 树形数据转换
 * @param {*} data
 * @param {*} id
 * @param {*} parentId
 */
export function treeDataTranslate(data, id = 'id', parentId = 'parentId') {
  var res = []
  var temp = {}
  for (var i = 0; i < data.length; i++) {
    temp[data[i][id]] = data[i]
  }
  for (var k = 0; k < data.length; k++) {
    if (temp[data[k][parentId]] && data[k][id] !== data[k][parentId]) {
      if (!temp[data[k][parentId]]['children']) {
        temp[data[k][parentId]]['children'] = []
      }
      if (!temp[data[k][parentId]]['_level']) {
        temp[data[k][parentId]]['_level'] = 1
      }
      data[k]['_level'] = temp[data[k][parentId]]._level + 1
      temp[data[k][parentId]]['children'].push(data[k])
    } else {
      res.push(data[k])
    }
  }
  return res
}

/**
 * 初始化证件数据（用于基本信息保存时提交初始化的证件信息）
 * @param {*} config 证件信息配置对象
 */
export function getInitDataOfCertificates(config) {
  const localConfig = Object.assign({}, config)
  const res = []
  Object.keys(localConfig).forEach(key => {
    const licItem = {
      licCatCd: key,
      subItems: []
    }
    localConfig[key].header.forEach(function(item) {
      licItem[item.field] = null
    })
    Object.keys(localConfig[key].list).forEach(ikey => {
      // 证件图片信息
      licItem.subItems.push({
        rsrcCd: ikey,
        url: null, // 原图地址
        thumbnailUrl: null, // 缩略图地址
        waterMarkUrl: null // 水印图片地址
      })
    })
    res.push(licItem)
  })
  return res
}

/**
 * 延迟执行函数
 * @param {string} type
 * @returns {Date}
 */
export function debounce(func, wait, immediate) {
  let timeout, args, context, timestamp, result

  const later = function() {
    // 据上一次触发时间间隔
    const last = +new Date() - timestamp

    // 上次被包装函数被调用时间间隔last小于设定时间间隔wait
    if (last < wait && last > 0) {
      timeout = setTimeout(later, wait - last)
    } else {
      timeout = null
      // 如果设定为immediate===true，因为开始边界已经调用过了此处无需调用
      if (!immediate) {
        result = func.apply(context, args)
        if (!timeout) context = args = null
      }
    }
  }

  return function(...args) {
    context = this
    timestamp = +new Date()
    const callNow = immediate && !timeout
    // 如果延时不存在，重新设定延时
    if (!timeout) timeout = setTimeout(later, wait)
    if (callNow) {
      result = func.apply(context, args)
      context = args = null
    }

    return result
  }
}

/**
 * 查看图片
 * @param {图片地址} url
 */
export function previewPic(url) {
  const divNode = document.createElement('div')
  const urls = url.split(',')
  let imageNode = null
  const _target = event.target
  const imgNodeList = []
  divNode.style.display = 'none'

  urls.filter((link, index) => {
    imageNode = document.createElement('img')
    imageNode.setAttribute('_index', index)
    imageNode.setAttribute('src', link)
    imageNode.setAttribute('alt', '图片')

    divNode.appendChild(imageNode)
    imgNodeList.push(imageNode)
  })

  document.body.appendChild(divNode)
  const viewer = new this.$viewer(divNode, {
    hidden() {
      viewer.destroy()
      divNode.remove()
    }
  })

  if (_target.nodeType === 1 && _target.nodeName.toUpperCase() === 'IMG') {
    imgNodeList[_target.dataset.index].click()
  } else {
    imageNode.click()
  }
}
