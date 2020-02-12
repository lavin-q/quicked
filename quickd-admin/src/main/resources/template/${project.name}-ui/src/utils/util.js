import * as validate from './validate'
/**
   * 表单序列化
   * @param data
   * @returns {string}
   */
export function serialize(data) {
  const list = []
  Object.keys(data).forEach(ele => {
    list.push(`${ele}=${data[ele]}`)
  })
  return list.join('&')
}
/**
   *
   * @param obj
   * @returns {string|*}
   */
export function getObjType(obj) {
  const toString = Object.prototype.toString
  const map = {
    '[object Boolean]': 'boolean',
    '[object Number]': 'number',
    '[object String]': 'string',
    '[object Function]': 'function',
    '[object Array]': 'array',
    '[object Date]': 'date',
    '[object RegExp]': 'regExp',
    '[object Undefined]': 'undefined',
    '[object Null]': 'null',
    '[object Object]': 'object'
  }
  if (obj instanceof Element) {
    return 'element'
  }
  return map[toString.call(obj)]
}
/**
   * 对象深拷贝
   */
export function deepClone(data) {
  const type = this.getObjType(data)
  let obj
  if (type === 'array') {
    obj = []
  } else if (type === 'object') {
    obj = {}
  } else {
    // 不再具有下一层次
    return data
  }
  if (type === 'array') {
    for (let i = 0, len = data.length; i < len; i++) {
      obj.push(this.deepClone(data[i]))
    }
  } else if (type === 'object') {
    for (const key in data) {
      obj[key] = this.deepClone(data[key])
    }
  }
  return obj
}
/**
   * 判断路由是否相等
   * @param obj1
   * @param obj2
   * @returns {boolean|*}
   */
export function diff(obj1, obj2) {
  delete obj1.close
  const o1 = obj1 instanceof Object
  const o2 = obj2 instanceof Object
  if (!o1 || !o2) { /*  判断不是对象  */
    return obj1 === obj2
  }

  if (Object.keys(obj1).length !== Object.keys(obj2).length) {
    return false
    // Object.keys() 返回一个由对象的自身可枚举属性(key值)组成的数组,例如：数组返回下表：let arr = ["a", "b", "c"];console.log(Object.keys(arr))->0,1,2;
  }

  for (const attr in obj1) {
    const t1 = obj1[attr] instanceof Object
    const t2 = obj2[attr] instanceof Object
    if (t1 && t2) {
      return this.diff(obj1[attr], obj2[attr])
    } else if (obj1[attr] !== obj2[attr]) {
      return false
    }
  }
  return true
}
/**
   * 设置灰度模式
   * @param status
   */
export function toggleGrayMode(status) {
  if (status) {
    document.body.className = document.body.className + ' grayMode'
  } else {
    document.body.className = document.body.className.replace(' grayMode', '')
  }
}
/**
   * 设置主题
   * @param name
   */
export function setTheme(name) {
  document.body.className = name
}

/**
   * 加密处理
   * @param params
   * @returns {any}
   */
export function encryption(params) {
  let { data, type, param, key } = params
  const result = JSON.parse(JSON.stringify(data))
  if (type === 'Base64') {
    param.forEach(ele => {
      result[ele] = btoa(result[ele])
    })
  } else {
    param.forEach(ele => {
      const data = result[ele]
      key = CryptoJS.enc.Latin1.parse(key)
      const iv = key
      // 加密
      const encrypted = CryptoJS.AES.encrypt(
        data,
        key, {
          iv: iv,
          mode: CryptoJS.mode.CBC,
          padding: CryptoJS.pad.ZeroPadding
        })
      result[ele] = encrypted.toString()
    })
  }
  return result
}

/**
   * 浏览器判断是否全屏
   */
export function fullscreenToggel() {
  if (this.fullscreenEnable()) {
    this.exitFullScreen()
  } else {
    this.reqFullScreen()
  }
}
/**
   * esc监听全屏
   * @param callback
   */
export function listenfullscreen(callback) {
  function listen() {
    callback()
  }

  document.addEventListener('fullscreenchange', function() {
    listen()
  })
  document.addEventListener('mozfullscreenchange', function() {
    listen()
  })
  document.addEventListener('webkitfullscreenchange', function() {
    listen()
  })
  document.addEventListener('msfullscreenchange', function() {
    listen()
  })
}
/**
   * 浏览器判断是否全屏
   */
export function fullscreenEnable() {
  return document.isFullScreen || document.mozIsFullScreen || document.webkitIsFullScreen
}

/**
   * 浏览器全屏
   */
export function reqFullScreen() {
  if (document.documentElement.requestFullScreen) {
    document.documentElement.requestFullScreen()
  } else if (document.documentElement.webkitRequestFullScreen) {
    document.documentElement.webkitRequestFullScreen()
  } else if (document.documentElement.mozRequestFullScreen) {
    document.documentElement.mozRequestFullScreen()
  }
}
/**
   * 浏览器退出全屏
   */
export function exitFullScreen() {
  if (document.documentElement.requestFullScreen) {
    document.exitFullScreen()
  } else if (document.documentElement.webkitRequestFullScreen) {
    document.webkitCancelFullScreen()
  } else if (document.documentElement.mozRequestFullScreen) {
    document.mozCancelFullScreen()
  }
}
/**
   * 递归寻找子类的父类
   * @param menu
   * @param id
   * @returns {*|undefined}
   */

export function findParent(menu, id) {
  for (let i = 0; i < menu.length; i++) {
    if (menu[i].children.length !== 0) {
      for (let j = 0; j < menu[i].children.length; j++) {
        if (menu[i].children[j].id === id) {
          return menu[i]
        } else {
          if (menu[i].children[j].children.length !== 0) {
            return this.findParent(menu[i].children[j].children, id)
          }
        }
      }
    }
  }
}

/**
   * 动态插入css
   * @param url
   */
export function loadStyle(url) {
  const link = document.createElement('link')
  link.type = 'text/css'
  link.rel = 'stylesheet'
  link.href = url
  const head = document.getElementsByTagName('head')[0]
  head.appendChild(link)
}
/**
   * 判断路由是否相等
   * @param a
   * @param b
   * @returns {boolean}
   */
export function isObjectValueEqual(a, b) {
  let result = true
  Object.keys(a).forEach(ele => {
    const type = typeof (a[ele])
    if (type === 'string' && a[ele] !== b[ele]) result = false
    else if (type === 'object' && JSON.stringify(a[ele]) !== JSON.stringify(b[ele])) result = false
  })
  return result
}
/**
   * 根据字典的value显示label
   * @param dic
   * @param value
   * @returns {string|*}
   */
export function findByValue(dic, value) {
  let result = ''
  if (validate.checkNull(dic)) return value
  if (typeof (value) === 'string' || typeof (value) === 'number' || typeof (value) === 'boolean') {
    let index = 0
    index = this.findArray(dic, value)
    if (index !== -1) {
      result = dic[index].label
    } else {
      result = value
    }
  } else if (value instanceof Array) {
    result = []
    let index = 0
    value.forEach(ele => {
      index = this.findArray(dic, ele)
      if (index !== -1) {
        result.push(dic[index].label)
      } else {
        result.push(value)
      }
    })
    result = result.toString()
  }
  return result
}
/**
   * 根据字典的value查找对应的index
   * @param dic
   * @param value
   * @returns {number}
   */
export function findArray(dic, value) {
  for (let i = 0; i < dic.length; i++) {
    if (dic[i].value === value) {
      return i
    }
  }
  return -1
}
/**
   * 生成随机len位数字
   * @param len
   * @param date
   * @returns {string}
   */
export function randomLenNum(len, date) {
  let random = ''
  random = Math.ceil(Math.random() * 100000000000000).toString().substr(0, len || 4)
  if (date) random = random + Date.now()
  return random
}

/**
   * 表单条件json转换
   * @param formItems
   * @returns {string|null}
   */
export function parseJsonItemForm(formItems) {
  let i = 0
  const json_list = []
  if (validate.checkNull(formItems)) {
    return null
  }
  formItems.forEach(item => {
    let filterItem = {}
    if (item instanceof String) {
      filterItem = {
        format: '',
        fieldName: item,
        attrType: 'String',
        fieldNode: '',
        operate: 'like',
        weight: 0,
        value: formItems[item],
        endValue: ''
      }
    } else {
      filterItem = Object.assign({
        format: '',
        fieldName: '',
        attrType: 'String',
        fieldNode: '',
        operate: 'like',
        weight: 0,
        value: '',
        endValue: ''
      }, item)
    }

    if (validate.checkNotNull(filterItem.value)) {
      json_list[i++] = filterItem
    }
  })
  return JSON.stringify(json_list)
}
/**
   * tree数据解析
   * @param dataList
   * @returns {[]}
   */
export function parseTreeData(dataList) {
  let treeData = [], getChild = function(id) {
      return dataList.filter((item) => {
        return item.parentId == id
      })
    }, parseData = function(item) {
      const childs = getChild(item.id)
      if (!validate.checkNull(childs)) {
        item.children = childs
        childs.forEach(temp => {
          parseData(temp)
        })
      }
    }
  dataList.forEach(item => {
    if (item.id === 1 || validate.checkNull(item.parentId) || item.parentId === 0) {
      parseData(item)
      treeData.push(item)
    }
  })
  return treeData
}
export function parseTime(time) {
  if (time) {
    var date = new Date(time)
    var year = date.getFullYear()
    /* 在日期格式中，月份是从0开始的，因此要加0
     * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
     * */
    var month = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1
    var day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()
    var hours = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
    var minutes = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
    var seconds = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds()
    // 拼接
    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds
  } else {
    return ''
  }
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
export function objToStr(val) {
  return validate.checkNotNull(val) ? val.toString() : ''
}

