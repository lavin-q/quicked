import * as globalData from '@/utils/globalData'
// import HashMap from '@/utils/hashmap'
import * as API from '@/api/dataDictionary'
import { mapGetters } from 'vuex'

/**
 * Desc: 	数据字典
 * Author: gsj
 * Date:2019-08-10
 */

export default {
  computed: {
    ...mapGetters([
      'globalDictMap'
    ])
  },
  methods: {
    /**
     * 多个字典查询时使用逗号拼接
     * @param {字典名称，多个字典用逗号拼接} names
     * @param {返回数据格式化方法} formatter
     * @param {回调函数} callback
     */
    initDictMap(names, formatter, callback) {
      const arr = names.split(',')
      for (let i = 0; i < arr.length; i++) {
        this._initDict(arr[i], formatter)
      }
    },
    // 初始化单个数据字典查询
    _initDict(name, formatter, callback) {
      const res = this.globalDictMap.get(name) || globalData[name] || null
      if (!res) {
        return new Promise((resolve, reject) => {
          API.getDict(name).then(res => {
            if (res && res.code === 0) {
              let formatRes = res.data
              if (formatter) {
                formatRes = formatter(res.data)
              }
              this.globalDictMap.put(name, formatRes)
              if (callback) {
                callback(formatRes)
              }
            } else {
              this.globalDictMap.put(name, [])
              if (callback) {
                callback([])
              }
              this.$message.error(res.msg)
            }
            resolve(res)
          }).catch(err => {
            reject(err)
          })
        })
      }
    },

    // 获取数据字典值
    getDict(name) {
      const res = this.globalDictMap.get(name) || globalData[name] || null
      if (res) {
        return res
      } else {
        return []
      }
    },

    // 刷新数据字典，用于异步获取的数据
    refreshDict(name, formatter, callback) {
      this.globalDictMap.remove(name)
      this.initDict(name, formatter, callback)
    }
  }
}
