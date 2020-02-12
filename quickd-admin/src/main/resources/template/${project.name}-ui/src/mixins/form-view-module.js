import { mapGetters } from 'vuex'

/**
 * 新增修改页面可定义如下方法：
 * 1、@function {init初始化前调用的方法} initInfoBefore
 * 2、@function {init初始化后调用的方法} initInfoAfter
 * 3、@function {格式化表单所需要提交的数据方法} formatSubmitData
 */

export default {
  data() {
    /* eslint-disable */
    return {
      visible: false,           // dialog是否可视
      formLoading: false,       // form表单loading状态
      dialogLoading:false,      // dialog的loading状态

      dataForm: {
        id:null
      },
      
      mixinViewModuleOptions:{
        getInfoAPI: '',           // 数据详情列表接口，API地址
        addAPI:'',                // 新增接口，API地址
        updateAPI:''              // 修改接口，API地址
      }
    }
    /* eslint-enable */
  },
  computed: {
    ...mapGetters([
      'size'
    ])
  },
  methods: {
    /**
     * 初始化新增编辑页面
     * @param { String || Number } id 传入的主键id值
     */
    init(id) {
      this.dataForm.id = id || undefined
      this.visible = true
      if (this.initInfoBefore) {
        this.initInfoBefore(id)
      }
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          if (this.mixinViewModuleOptions.getInfoAPI) {
            this.formLoading = true
            this.mixinViewModuleOptions.getInfoAPI(this.dataForm.id).then((res) => {
              this.formLoading = false
              if (res && res.code === 0) {
                this.dataForm = res.data
                if (this.initInfoAfter) {
                  this.initInfoAfter(id, res.data)
                }
              } else {
                this.$message.error(res.msg)
              }
            }).catch(error => {
              this.formLoading = false
              console.log(error)
            })
          }
        }
      })
    },

    /**
     * 表单提交
     */
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          var api = !this.dataForm.id ? this.mixinViewModuleOptions.addAPI : this.mixinViewModuleOptions.updateAPI
          if (api) {
            this.dialogLoading = true
            let postData = Object.assign({}, this.dataForm)
            if (this.formatSubmitData) {
              postData = this.formatSubmitData(postData)
            }
            api(postData).then((data) => {
              this.dialogLoading = false
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            }).catch(error => {
              this.dialogLoading = false
              console.log(error)
            })
          } else {
            this.$message.error('非常抱歉，您操作的接口不存在，请联系管理员！')
          }
        }
      })
    }
  }
}
