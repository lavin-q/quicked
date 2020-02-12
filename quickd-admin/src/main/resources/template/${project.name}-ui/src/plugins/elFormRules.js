import * as $validateFn from '@/utils/validate'

const elFormRulesFilter = {}

// 注意:  定义type 规则时 不用做非空验证
elFormRulesFilter.install = Vue => {
  // 验证手机号
  const valMobile = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isMobile(value)) {
        callback(new Error('您输入的手机号不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 验证用户名
  const valUserName = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isUserName(value)) {
        callback(new Error('您输入的用户名不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 验证企业营业执照注册号
  const valUscCd = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isUscCd(value)) {
        callback(new Error('您输入的证件号码不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 验证身份证号
  const valID = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isID(value)) {
        callback(new Error('您输入的身份证号不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 验证车牌号 License Plate Number
  const valLPN = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isLPN(value)) {
        callback(new Error('您输入的车牌号不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 验证车架号
  const valVIN = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isVIN(value)) {
        callback(new Error('您输入的车架号不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 道路运输证号
  const valOpraLicNo = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!$validateFn.isOpraLicNo(value)) {
        callback(new Error('您输入的道路运输证号不正确'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  // 验证是否是整数
  const valIsInteger = (rule, value, callback) => {
    if (value != null && value !== '') {
      if (!(/^\d+$/g.test(value))) {
        callback(new Error('只能输入整数'))
      } else {
        callback()
      }
    } else {
      callback()
    }
  }

  /**
     * 参数 item
     * required true  必填项
     * maxLength  字符串的最大长度
     * min 和 max 必须同时给 min < max  type=number
     * type 手机号 mobile
     * 邮箱   email
     * 网址   url
     */
  Vue.prototype.$rulesFilter = function(item) {
    const rules = []
    if (item.required) {
      if (item.trigger) {
        rules.push({ required: true, message: '该输入项为必填项!', trigger: item.trigger })
      } else {
        rules.push({ required: true, message: '该输入项为必填项!', trigger: 'change' })
      }
    }
    if (item.maxLength) {
      rules.push({ min: 1, max: item.maxLength, message: '最多输入' + item.maxLength + '个字符!', trigger: 'change' })
    }
    if (item.min && item.max) {
      rules.push({ min: item.min, max: item.max, message: '字符长度在' + item.min + '至' + item.max + '之间!', trigger: 'change' })
    }
    if (item.isInteger) {
      if (item.trigger) {
        rules.push({ validator: valIsInteger, trigger: item.trigger })
      } else {
        rules.push({ validator: valIsInteger, trigger: 'change' })
      }
    }
    if (item.validator) {
      if (item.trigger) {
        rules.push({ validator: item.validator, trigger: item.trigger })
      } else {
        rules.push({ validator: item.validator, trigger: 'change' })
      }
    }

    if (item.type) {
      const type = item.type
      switch (type) {
        case 'email': // 邮箱
          if (item.trigger) {
            rules.push({ type: 'email', message: '请输入正确的邮箱地址', trigger: item.trigger })
          } else {
            rules.push({ type: 'email', message: '请输入正确的邮箱地址', trigger: 'change' })
          }
          break
        case 'date': // 日期
          rules.push({ type: 'date', message: '请选择日期', trigger: 'change' })
          break
        case 'array': // checkbox,至少选择一个
          rules.push({ type: 'array', message: '请至少选择一个', trigger: 'change' })
          break
        case 'mobile': // 手机号
          if (item.trigger) {
            rules.push({ validator: valMobile, trigger: item.trigger })
          } else {
            rules.push({ validator: valMobile, trigger: 'change' })
          }
          break
        case 'userName': // 用户名
          if (item.trigger) {
            rules.push({ validator: valUserName, trigger: item.trigger })
          } else {
            rules.push({ validator: valUserName, trigger: 'change' })
          }
          break
        case 'uscCd': // 统一社会信用代码uscCd
          if (item.trigger) {
            rules.push({ validator: valUscCd, trigger: item.trigger })
          } else {
            rules.push({ validator: valUscCd, trigger: 'change' })
          }
          break
        case 'ID': // 身份证
          if (item.trigger) {
            rules.push({ validator: valID, trigger: item.trigger })
          } else {
            rules.push({ validator: valID, trigger: 'change' })
          }
          break
        case 'LPN': // 车牌号
          if (item.trigger) {
            rules.push({ validator: valLPN, trigger: item.trigger })
          } else {
            rules.push({ validator: valLPN, trigger: 'change' })
          }
          break
        case 'VIN': // 车架号
          if (item.trigger) {
            rules.push({ validator: valVIN, trigger: item.trigger })
          } else {
            rules.push({ validator: valVIN, trigger: 'change' })
          }
          break
        case 'opraLicNo': // 道路运输证号 Road Transport Certificate
          if (item.trigger) {
            rules.push({ validator: valOpraLicNo, trigger: item.trigger })
          } else {
            rules.push({ validator: valOpraLicNo, trigger: 'change' })
          }
          break
        default:
          break
      }
    }
    return rules
  }
}

export default elFormRulesFilter
