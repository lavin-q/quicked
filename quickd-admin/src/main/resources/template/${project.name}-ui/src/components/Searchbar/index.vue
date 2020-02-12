<template>
  <div class="grid-searchbar clearfix">
    <el-form ref="searchbarForm" :model="searchbarForm" :inline="true" :size="size" @submit.native.prevent>
      <template v-for="(item,index) in searchItems.normal">
        <el-form-item :prop="item.field" :label="item.name+' '" :key="item.field+index">
          <el-input
            v-if="item.type=='text'"
            v-model="searchbarForm[item.field]"
            :placeholder="'请输入'+item.name"
            clearable
            @keyup.enter.native="searchHandle()"/>
          <el-input
            v-else-if="item.type=='number'"
            v-model="searchbarForm[item.field]"
            :placeholder="'请输入'+item.name"
            type="number"
            clearable
            @keyup.enter.native="searchHandle()"/>
          <el-select
            v-else-if="item.type=='select'"
            v-model="searchbarForm[item.field]"
            :placeholder="'请选择'+item.name"
            clearable
            @change="searchHandle()">
            <el-option v-for="op in item.options" :key="op.value" :label="op.label" :value="op.value"/>
          </el-select>
          <el-date-picker
            v-else-if="item.type=='date' || item.type=='week' || item.type=='month' || item.type=='year'"
            :type="item.type"
            :value-format="item.valueFormat"
            v-model="searchbarForm[item.field]"
            :placeholder="'请选择'+item.name"
            @change="searchHandle()"/>
          <el-date-picker
            v-else-if="item.type=='daterange' || item.type=='datetimerange'"
            :value-format="item.valueFormat"
            :default-time="['00:00:00', '23:59:59']"
            v-model="searchbarForm[item.field]"
            :placeholder="'请选择'+item.name"
            :type="item.type"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @change="searchHandle()"/>
          <el-radio-group
            v-else-if="item.type=='radio'"
            v-model="searchbarForm[item.field]"
            @change="searchHandle()">
            <el-radio-button v-for="op in item.options" :key="op.value" :label="op.value">{{ op.label }}</el-radio-button>
          </el-radio-group>
          <el-checkbox-group
            v-else-if="item.type=='checkbox'"
            v-model="searchbarForm[item.field]"
            @change="searchHandle()">
            <el-checkbox-button v-for="op in item.options" :key="op.value" :label="op.value">{{ op.label }}</el-checkbox-button>
          </el-checkbox-group>
        </el-form-item>
      </template>
      <template v-if="searchItems.more">
        <span v-for="(item,index) in searchItems.more" v-show="!showMoreFlag" :key="item.field+index">
          <el-form-item :prop="item.field" :label="item.name+' '" :key="item.field+index">
            <el-input
              v-if="item.type=='text'"
              v-model="searchbarForm[item.field]"
              :placeholder="'请输入'+item.name"
              clearable
              @keyup.enter.native="searchHandle()"/>
            <el-input
              v-else-if="item.type=='number'"
              v-model="searchbarForm[item.field]"
              :placeholder="'请输入'+item.name"
              type="number"
              clearable
              @keyup.enter.native="searchHandle()"/>
            <el-select
              v-else-if="item.type=='select'"
              v-model="searchbarForm[item.field]"
              :placeholder="'请选择'+item.name"
              clearable
              @change="searchHandle()">
              <el-option v-for="op in item.options" :key="op.value" :label="op.label" :value="op.value"/>
            </el-select>
            <el-date-picker
              v-else-if="item.type=='date' || item.type=='week' || item.type=='month' || item.type=='year'"
              :type="item.type"
              :value-format="item.valueFormat"
              v-model="searchbarForm[item.field]"
              :placeholder="'请选择'+item.name"
              @change="searchHandle()"/>
            <el-date-picker
              v-else-if="item.type=='daterange' || item.type=='datetimerange'"
              :value-format="item.valueFormat"
              :default-time="['00:00:00', '23:59:59']"
              v-model="searchbarForm[item.field]"
              :placeholder="'请选择'+item.name"
              :type="item.type"
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              @change="searchHandle()"/>
            <el-radio-group
              v-else-if="item.type=='radio'"
              v-model="searchbarForm[item.field]"
              @change="searchHandle()">
              <el-radio-button v-for="op in item.options" :key="op.value" :label="op.value">{{ op.label }}</el-radio-button>
            </el-radio-group>
            <el-checkbox-group
              v-else-if="item.type=='checkbox'"
              v-model="searchbarForm[item.field]"
              @change="searchHandle()">
              <el-checkbox-button v-for="op in item.options" :key="op.value" :label="op.value">{{ op.label }}</el-checkbox-button>
            </el-checkbox-group>
            <!-- 省市区 -->
            <el-cascader
              v-else-if="item.type=='region'"
              v-model="searchbarForm[item.field]"
              :options="regionOptions"
              :props="cascaderProps"
              filterable
              clearable
              @change="searchHandle()"
            />
          </el-form-item>
        </span>
        <el-button v-if="!showMoreFlag && rulesHigh.length>0" type="primary" plain style="margin-top:4px;" @click="dialogFormVisible = true">高级查询</el-button>
      </template>
      <slot name="custom-search-items"/>
      <div style="float:right;">
        <a v-if="searchItems.more && searchItems.more.length>0" class="show-more-btn" href="javascript:void(0)" @click="showMoreHandle">
          <span v-if="showMoreFlag">更多<span class="triangle-down"/></span>
          <span v-else>收起<span class="triangle-up"/></span>
        </a>
        <el-button :size="size" type="success" icon="el-icon-search" @click="searchHandle()">查询</el-button>
        <el-button v-if="showResetBtn" :size="size" icon="el-icon-delete" @click="clearSearchHandle">重置</el-button>
        <slot name="button"/>
      </div>
    </el-form>
    <el-dialog :visible.sync="dialogFormVisible" title="高级查询" width="60%">
      <query-builder :rules="rulesHigh" v-model="output" :labels="labelsHigh"/>
      <div slot="footer" class="dialog-footer">
        <el-button :size="size" @click="dialogFormVisible = false">取 消</el-button>
        <el-button :size="size" type="primary" @click="searchHighHandle()">搜 索</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import * as Tool from '@/utils/tool'
import { mapGetters } from 'vuex'
export default {
  name: 'Searchbar',
  components: { },
  props: {
    // 表单元素大小
    size: {
      type: String,
      default: 'small'
    },
    // 表单元素大小
    showResetBtn: {
      type: Boolean,
      default: true
    },
    searchItems: {
      type: Object,
      default() {
        return {
          'normal': [],			// 常规搜索
          'more': []				// 隐藏搜索
        }
      }
    },
    pagination: {						// table的分页数据，用于点击搜索是url带上分页数据
      type: Object,
      default() {
        return {
          total: 0,
          page: 1,
          limit: 20
        }
      }
    },
    saveGridSearchParamInUrl: {
      type: Boolean,
      default: true
    },
    rulesHigh: {// 高级查询所有条件
      type: Array,
      default() {
        return []
      }
    }
  },
  data() {
    return {
      showMoreFlag: true,
      searchbarForm: {},

      cascaderProps: {
        value: 'code',
        label: 'name',
        children: 'cell'
      },
      searchArr: [],		// 前端的查询条件，里面的field对应前端的字段
      rules: [],		// 后端的查询条件，里面的field对应后端的字段
      queryArr: [], // tagView参数query

      dialogFormVisible: false, // 高级查询弹框

      output: {}, // 高级查询返回对象
      labelsHigh: {// 高级查询label
        matchType: 'Match Type',
        matchTypes: [
          { 'id': 'all', 'label': 'All' },
          { 'id': 'any', 'label': 'Any' }
        ],
        addRule: '添加规则',
        removeRule: '&times;',
        addGroup: '添加组',
        removeGroup: '&times;',
        textInputPlaceholder: '请输入要查询内容'
      }
    }
  },
  computed: {
    ...mapGetters([
      'visitedViews'
    ])
  },
  created() {
    // this.init();
  },
  methods: {
    // 初始化属性
    init(query) {
      const _this = this
      this.searchItems.normal && this.searchItems.normal.forEach(item => {
        if (item.type === 'radio' || item.type === 'checkbox') {
          _this.$set(_this.searchbarForm, item.field, item.default || '')
        } else if (item.type === 'region') {
          _this.$set(_this.searchbarForm, item.field, item.default || [])
        } else {
          _this.$set(_this.searchbarForm, item.field, item.default || null)
        }
      })
      this.searchItems.more && this.searchItems.more.forEach(item => {
        if (item.type === 'radio' || item.type === 'checkbox') {
          _this.$set(_this.searchbarForm, item.field, item.default || '')
        } else if (item.type === 'region') {
          _this.$set(_this.searchbarForm, item.field, item.default || [])
        } else {
          _this.$set(_this.searchbarForm, item.field, item.default || null)
        }
      })

      if (Object.keys(query).length > 0) {
        let setArr = []
        if (this.searchItems.more) {
          setArr = [].concat(this.searchItems.normal).concat(this.searchItems.more)
        } else {
          setArr = [].concat(this.searchItems.normal)
        }
        Object.keys(query).forEach(key => {
          if (_this.searchbarForm[key] !== undefined) {
            if (setArr.length > 0) {
              const filterArr = setArr.filter(it => {
                return it.field === key
              })
              if (filterArr.length > 0) {		// 说明该属性是存在于搜索栏
                const filter = filterArr[0]
                if (filter.type === 'select' || filter.type === 'radio' || filter.type === 'checkbox') {
                  // 若是这些类型，则需要判断是否存在下拉框或者是否该值在options里面
                  const val = decodeURIComponent(query[key])
                  const selectedOption = filter.options.filter(it => {
                    return it.value === val
                  })
                  if (selectedOption.length > 0) {
                    _this.$set(_this.searchbarForm, key, decodeURIComponent(query[key]))
                  } else {
                    // 说明不在options里面
                    _this.$set(_this.searchbarForm, key, '')
                  }
                } else if (filter.type === 'daterange' || filter.type === 'datetimerange') {
                  const tempVal = decodeURIComponent(query[key])
                  const tempValArr = tempVal.split(',')
                  if (tempValArr.length === 2) {
                    _this.$set(_this.searchbarForm, key, [
                      Tool.formatDate(tempValArr[0], filter.valueFormat),
                      Tool.formatDate(tempValArr[1], filter.valueFormat)
                    ])
                  } else if (filter.type === 'region') {
                    const tempVal = decodeURIComponent(query[key])
                    let resVal = []
                    if (tempVal && /^(\d{6}),(\d{6}),(\d{6})$/g.test(tempVal)) {
                      resVal = tempVal.split(',')
                    }
                    _this.$set(_this.searchbarForm, key, resVal)
                  } else {
                    _this.$set(_this.searchbarForm, key, decodeURIComponent(query[key]))
                  }
                } else {
                // 说明设置的属性不存在于搜索栏
                  _this.$set(_this.searchbarForm, key, decodeURIComponent(query[key]))
                }
              }
            }

            const tempSearchItemsMore = _this.searchItems.more
            if (tempSearchItemsMore && tempSearchItemsMore.length > 0) {
              if (tempSearchItemsMore.filter(it => {
                return it.field === key
              }).length > 0) {
                _this.showMoreFlag = false // 设置展开
              }
            }
          }
        })
      }
    },
    // 获取值，isClearSearchHandle为true时表示为重置操作，需要在搜索时取消默认值的传递
    get() {
      const rules = []
      const searchArr = []
      const _this = this
      this.searchItems.normal && this.searchItems.normal.forEach(item => {
        let data = _this.searchbarForm[item.field]
        if (data === undefined) {
          data = item.default || null
        }
        let selectedOption
        if (item.type === 'select' && item.postdifferent) {
          const selectPostData = data || ''
          selectedOption = item.options.filter(it => {
            return it.value === selectPostData
          })
        } else if (item.type === 'daterange' || item.type === 'datetimerange') {
          data = (data && data[0]) ? data : null		// 用来解决表单重置之后时间间隔组件返回的数据是[undefined]
        } else if (item.type === 'region') {
          data = (data && data.length > 0) ? data.join(',') : null		// 省市区[330000,330700,330781],需要转成字符串"330000,330700,330781"
        }
        if (data) {
          if (typeof data === 'string') {
            data = data.trim()
            data = data.replace(/\s/g, '')
          }
          if (item.type === 'select' && item.postdifferent) {
            rules.push({ field: item.dbfield, op: selectedOption[0].dboper, data: selectedOption[0].postData })
            searchArr.push({ name: item.field, value: data })
            _this.queryArr.push({ field: item.field, op: selectedOption[0].dboper, data: selectedOption[0].postData })
          } else {
            rules.push({ field: item.dbfield, op: item.dboper, data: data })
            searchArr.push({ name: item.field, value: data })
            _this.queryArr.push({ field: item.field, op: item.dboper, data: data })
          }
        }
      })
      this.searchItems.more && this.searchItems.more.forEach(item => {
        let data = _this.searchbarForm[item.field]
        if (data === undefined) {
          data = item.default || null
        }
        let selectedOption
        if (item.type === 'select' && item.postdifferent) {
          const selectPostData = data || ''
          selectedOption = item.options.filter(it => {
            return it.value === selectPostData
          })
        } else if (item.type === 'daterange' || item.type === 'datetimerange') {
          data = (data && data[0]) ? data : null		// 用来解决表单重置之后时间间隔组件返回的数据是[undefined]
        } else if (item.type === 'region') {
          data = (data && data.length > 0) ? data.join(',') : null		// 省市区[330000,330700,330781],需要转成字符串"330000,330700,330781"
        }
        if (data) {
          if (typeof data === 'string') {
            data = data.trim()
            data = data.replace(/\s/g, '')
          }
          if (item.type === 'select' && item.postdifferent) {
            rules.push({ field: item.dbfield, op: selectedOption[0].dboper, data: selectedOption[0].postData })
            _this.queryArr.push({ field: item.field, op: selectedOption[0].dboper, data: selectedOption[0].postData })
            searchArr.push({ name: item.field, value: data })
          } else {
            rules.push({ field: item.dbfield, op: item.dboper, data: data })
            _this.queryArr.push({ field: item.field, op: item.dboper, data: data })
            searchArr.push({ name: item.field, value: data })
          }
        }
      })

      this.$set(this, 'searchArr', searchArr)			// 前端查询条件数据
      this.$set(this, 'rules', rules)					// 后端查询条件数据

      const searchObj = {
        'groupOp': 'AND',
        'rules': rules
      }

      return searchObj
    },

    // 设置url的hash的search变量
    getLocationStr(arr) {
      const str = window.location.hash
      const i = str.lastIndexOf('?')
      let newStr = null
      if (i >= 0) {
        newStr = str.substr(0, i)
      } else {
        newStr = str
      }
      if (arr.length > 0) {
        newStr = newStr + '?'
        arr.forEach(item => {
          newStr += item.name + '=' + encodeURIComponent(item.value) + '&'
        })
        newStr = newStr.substr(0, newStr.length - 1)
      }
      if (this.pagination) {			// 存放分页数据
        if (arr.length > 0) {
          newStr = newStr + '&currPage' + '=' + (parseInt(this.pagination.page) || 1)
          newStr = newStr + '&pageSize' + '=' + (parseInt(this.pagination.limit) || 20)
        } else {
          newStr = newStr + '?'
          newStr = newStr + 'currPage' + '=' + (parseInt(this.pagination.page) || 1)
          newStr = newStr + '&pageSize' + '=' + (parseInt(this.pagination.limit) || 20)
        }
      }
      return newStr
    },

    /**
       * 搜索操作，需要传值使外层的currentPage设置为1，默认为是需要重置分页显示为第一页
       *
       * notResetCurrentPage为true时表示不重置currentPage，用于外层分页方法调用
       */
    searchHandle(notResetCurrentPage) {
      const postData = this.get()
      if (!notResetCurrentPage) {		// 重置设置为将页面设置为第一页
        if (this.pagination) {
          this.pagination.page = 1
        }
      }

      const locationStr = this.getLocationStr(this.searchArr)
      var locationTemp = window.location
      if (this.saveGridSearchParamInUrl) {
        var url = locationTemp.origin + locationTemp.pathname + locationStr
        window.history.pushState('', '', url)
      }

      if (notResetCurrentPage) {
        this.$emit('search', { resetCurrentPage: false, searchData: postData })
      } else {
        this.$emit('search', { resetCurrentPage: true, searchData: postData })
      }

      const query = { currPage: this.pagination.page, pageSize: this.pagination.limit }// tabView传参
      this.queryArr.forEach(function(value, index) {
        query[value.field] = value.data
      })
      this.visitedViews.forEach(function(value, index) {
        if (locationStr.indexOf(value.path) >= 0) {
          value.query = query// tabView传参
        }
      })
    },

    // 清空搜索操作
    clearSearchHandle() {
      const _this = this
      if (this.$refs.searchbarForm) {
        this.$refs['searchbarForm'].resetFields()
      }

      this.searchItems.normal && this.searchItems.normal.forEach(item => {
        if (item.default) {
          _this.searchbarForm[item.field] = item.default
        }
      })
      this.searchItems.more && this.searchItems.more.forEach(item => {
        if (item.default) {
          _this.searchbarForm[item.field] = item.default
        }
      })

      this.$nextTick(() => {
        this.searchHandle(false, true)
      })
    },

    // 显示更多查询
    showMoreHandle() {
      this.showMoreFlag = !this.showMoreFlag
      this.$emit('resizeSearchbar')
    },
    // 高级搜索值
    updateQuery: function(value) {
      this.output = value
    },
    // 高级搜索
    searchHighHandle() {
      this.dialogFormVisible = false
      this.$emit('searchHighHandle', this.output)
    }
  }
}
</script>

<style scoped>
.grid-searchbar{
  box-sizing: border-box;
  padding-bottom:10px;
}
.show-more-btn{
  position: relative;
  font-size:12px;
  color:#2288d0;
  text-decoration: none;
  margin:0 8px 0 5px;
}
.el-form .el-form-item {
  margin-bottom: 5px;
}
.show-more-btn:hover{
  text-decoration:underline;
}
.triangle-down:after{
  content:'';
  position: relative;
  top:1px;
  display: inline-block;
  margin-left:5px;
  border: 4px solid transparent;
  border-top-color: #2288d0;
}
.triangle-up:after{
  content:'';
  position: relative;
  top:-3px;
  display: inline-block;
  margin-left:5px;
  margin-top:-5px;
  border: 4px solid transparent;
  border-bottom-color: #2288d0;
}
</style>
