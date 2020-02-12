'use strict'
import * as Tool from '@/utils/tool'
import { mapGetters } from 'vuex'

export default {
  data() {
    /* eslint-disable */
    return {
      isFixedTableHeight:false,     // 是否固定表格高度，默认false，指需要根据页面高度调整的
      tableHeight: Tool.getClientHeight() - 220,  // 默认初始值

      // 设置属性
      mixinViewModuleOptions: {
        activatedIsNeed: true,    // 此页面是否在激活（进入）时，调用查询数据列表接口？
        retrieveQueryConditionsFromUrl:true,  // 是否从url中设置搜索栏的查询条件
        getListAPI: '',           // 数据列表接口，API地址
        getDataListIsPage: true,  // 数据列表接口，是否需要分页？

        getInfoAPI:'',            // 详情接口，API地址
        delAPI: '',               // 删除接口，API地址
        exportAPI: ''             // 导出接口，API地址
      },

      // 数据列表
      defaultQueryConditions:[],  // 默认设置的查询条件
      dataList: [],               // 数据列表
      dataListLoading: false,     // 数据列表，loading状态
      dataListSelections: [],     // 数据列表，多选项

      // 分页参数
      pagination: {
        page: 1,
        limit: 15,
        total: 0
      },

      // 新增编辑dialog
      addOrUpdateVisible: false,    // 新增／更新，弹窗visible状态

      // 详情dialog
      infoVisible: false,

      // 导入导出按钮loading状态
      importButtonLoading:false,    // 导入按钮loading状态
      exportButtonLoading:false,    // 导出按钮loading状态
    }
    /* eslint-enable */
  },
  computed: {
    ...mapGetters([
      'size'
    ])
  },
  activated() {
    if (!this.isFixedTableHeight) {
      this.setTableHeight()
      window.addEventListener('resize', this.setTableHeight)
    }
    const query = this.$route.query
    if (this.mixinViewModuleOptions.getDataListIsPage) {
      this.pagination.page = query.currPage ? parseInt(query.currPage) : 1
      this.pagination.limit = query.pageSize ? parseInt(query.pageSize) : 20
      this.pagination.total = this.pagination.page * this.pagination.limit
    }
    if (this.mixinViewModuleOptions.activatedIsNeed) {
      if (this.mixinViewModuleOptions.retrieveQueryConditionsFromUrl) {
        // 初始化
        this._initViewModule(query)
      } else {
        // 初始化
        this._initViewModule({})
      }
    }
  },
  destroyed() {
    if (!this.isFixedTableHeight) {
      window.removeEventListener('resize', this.setTableHeight)
    }
  },
  methods: {
    /**
     * 初始化搜索栏，并进行数据列表查询
     * @param {Object} queryOptions 搜索栏的默认查询条件
     */
    _initViewModule(queryOptions) {
      if (this.$refs.searchbar) {
        this.$refs.searchbar.init(queryOptions || {})
      }
      this.getDataList()
    },

    // 改变搜索框的高度
    resizeSearchbar() {
      this.setTableHeight()
    },

    // 设置table的高度
    setTableHeight() {
      this.$nextTick(() => {
        const contentPadding = 30 // 30是app-main-content的上下10px的padding
        let searchbarHeight = 0
        let paginationbarHeight = 0
        let tabsHeight = 0
        let footerHeight = 0
        if (this.$refs.searchbar) {
          searchbarHeight = this.$refs.searchbar.$el.offsetHeight
        }
        if (this.$refs.paginationbar) {
          paginationbarHeight = this.$refs.paginationbar.offsetHeight
        }
        if (this.$store.state.settings.tagsView) {
          tabsHeight = 34
        }
        this.tableHeight = Tool.getClientHeight() - 50 - tabsHeight - contentPadding - footerHeight - searchbarHeight - paginationbarHeight
      })
    },

    // 获取数据列表
    getDataList(data, callback) {
      const _this = this
      let filters
      if (data) {
        if (data.resetCurrentPage) {
          this.pagination.page = 1
        }
        if (data.searchData) {
          filters = data.searchData
        }
      } else {
        if (this.$refs.searchbar) {
          filters = this.$refs.searchbar.get()
        } else {
          filters = { groupOp: 'AND', rules: [] }
        }
      }

      if (this.defaultQueryConditions.length > 0) {
        filters.rules = filters.rules.concat(this.defaultQueryConditions)
      }
      this.dataListLoading = true

      const pagination = Object.assign({}, this.pagination)
      delete pagination.total
      if (!this.mixinViewModuleOptions.getDataListIsPage) {
        delete pagination.page
        delete pagination.limit
      }

      const params = Object.assign({ filters: filters }, pagination)
      this.mixinViewModuleOptions.getListAPI(params).then(response => {
        if (response && response.code === 0) {
          _this.pagination.total = response.data.totalCount
          _this.dataList = response.data.list
        } else {
          _this.dataList = []
          _this.pagination.total = 0
        }
        if (callback) {
          callback(response)
        }
        _this.dataListLoading = false
      }).catch(() => {
        _this.dataListLoading = false
      })
    },

    // 多选
    dataListSelectionChangeHandle(val) {
      this.dataListSelections = val
    },

    // 分页跳转
    handleCurrentChange: function(val) {
      this.pagination.page = val
      this.$refs.searchbar.searchHandle(true)
    },

    // 分页条数修改
    handleSizeChange: function(val) {
      this.pagination.limit = val
      this.$refs.searchbar.searchHandle(true)
    },

    // 删除
    deleteHandle(id) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      this.$confirm(`确定进行删除操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.mixinViewModuleOptions.delAPI(ids).then(data => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDataList()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },

    // 查看图片
    previewPic(url) {
      Tool.previewPic.call(this, url)
    },

    // 新增 / 修改
    addOrUpdateHandle(id) {
      this.addOrUpdateVisible = true
      this.$nextTick(() => {
        this.$refs.addOrUpdate.dataForm.id = id
        this.$refs.addOrUpdate.init(id)
      })
    },

    // 新增 / 修改
    infoHandle(id) {
      this.infoVisible = true
      this.$nextTick(() => {
        this.$refs.info.init(id)
      })
    },

    /**
     * 后台接口导出
     * @param { Object } param 导出接口参数
     * @param { String } type 导出文件类型
     * @param { String } title 导出文件名称
     */
    exportByApiHandle(param, type, title) {
      const _this = this
      this.$confirm(`确定进行导出吗?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.exportButtonLoading = true
        _this.mixinViewModuleOptions.exportAPI(param).then(res => {
          this.exportButtonLoading = false
          if (!res) {
            return
          }
          const a = document.createElement('a')
          const blob = new Blob([res])
          const url = window.URL.createObjectURL(blob)

          a.style.display = 'none'
          a.href = url
          a.download = (title || '导出文件') + '-' + Tool.formatDate(new Date(), 'yyyy-MM-dd-HH-mm') + (type || '.xls')
          a.click()
          window.URL.revokeObjectURL(url)
        }).catch(err => {
          this.exportButtonLoading = false
          console.log(err)
        })
      })
    },

    /**
     * 文件上传（el-upload组件导入回调方法）
     * @param { Object } data 文件上传后返回的结果数据
     */
    importSuccessHandle(data) {
      var _this = this
      this.importButtonLoading = true
      if (data.code === 0) {
        _this.$message({
          message: '导入成功',
          type: 'success'
        })
        this.getDataList()
      } else {
        _this.$message({
          message: '导入失败',
          type: 'warning'
        })
      }
      this.importButtonLoading = false
    },

    /**
     * 下载导入模板方法
     * @param { String } type 导出文件类型
     * @param { String } title 导出文件名称
     */
    downloadImportTemplateHandle(type, title) {
      if (this.mixinViewModuleOptions.downloadImportTemplateAPI) {
        this.mixinViewModuleOptions.downloadImportTemplateAPI().then(res => {
          if (!res) {
            return
          }
          const a = document.createElement('a')
          const blob = new Blob([res])
          const url = window.URL.createObjectURL(blob)

          a.style.display = 'none'
          a.href = url
          a.download = (title || '文件模板') + '-' + Tool.formatDate(new Date(), 'yyyy-MM-dd-HH-mm') + (type || '.xls')
          a.click()
          window.URL.revokeObjectURL(url)

        }).catch(err => {
          console.log(err)
        })
      } else {
        this.$message.error('很抱歉，导入模板接口不存在，不能下载导入模板！')
      }
    }

  }
}
