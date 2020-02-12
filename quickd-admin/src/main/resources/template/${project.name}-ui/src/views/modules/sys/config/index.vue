<template>
  <div class="app-main-content">
    <el-tabs v-model="activeName"
             @tab-click="configTabHandle">
      <el-tab-pane label="阿里云oss配置"
                   name="cloudStorage">
        <el-card class="box-card">
          <el-form ref="cloudStorageForm"
                   :rules="cloudStorageFormRules"
                   :model="cloudStorageForm"
                   hide-required-asterisk='true'
                   label-width="120px">
            <el-form-item label="文件访问域名"
                          prop="urlPrefix">
              <el-input v-model="cloudStorageForm.urlPrefix"
                        :placeholder="`请输入文件访问域名`"/>
            </el-form-item>

            <el-form-item label="EndPoint"
                          v-if="cloudStorageForm.ossType==1"
                          prop="endpoint">
              <el-input v-model="cloudStorageForm.endpoint"
                        :placeholder="`请输入EndPoint`"/>
            </el-form-item>
            <el-form-item label="AccessKeyId"
                          prop="accessKeyId">
              <el-input v-model="cloudStorageForm.accessKeyId"
                        type='password'
                        :placeholder="`请输入AccessKeyId`"/>
            </el-form-item>
            <el-form-item label="AccessKeySecret"
                          prop="accessKeySecret">
              <el-input v-model="cloudStorageForm.accessKeySecret"
                        type='password'
                        :placeholder="`请输入AccessKeySecret`"/>
            </el-form-item>
            <el-form-item label="BucketName"
                          prop="bucketName">
              <el-input v-model="cloudStorageForm.bucketName"
                        :placeholder="`请输入桶名`"/>
            </el-form-item>
            <el-form-item>
              <el-button type="primary"
                         @click="saveConfigHandle(cloudStorageForm,'cloudStorageForm')">保存并启用
              </el-button>
              <el-button @click="resetFormHandle('cloudStorageForm')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-tab-pane>
      <el-tab-pane label="阿里短信配置"
                   name="mobileSms">
        <el-card class="box-card">
          <el-form ref="mobileForm"
                   :rules="mobileFormRules"
                   :model="mobileForm"
                   hide-required-asterisk='true'
                   label-width="120px">
            <el-form-item label="模板ID"
                          prop="templateId">
              <el-input v-model="mobileForm.templateId"
                        placeholder="请输入短信模板ID"/>
            </el-form-item>
            <el-form-item label="签名"
                          prop="sign">
              <el-input v-model="mobileForm.sign"
                        placeholder="请输入短信签名"/>
            </el-form-item>
            <el-form-item label="appId"
                          prop="appId">
              <el-input v-model="mobileForm.appId"
                        type='password'
                        placeholder="请输入短信应用appID"/>
            </el-form-item>
            <el-form-item label="appKey"
                          prop="appKey">
              <el-input v-model="mobileForm.appKey"
                        type='password'
                        placeholder="请输入短信应用appkey"/>
            </el-form-item>
            <el-form-item>
              <el-button type="primary"
                         @click="saveConfigHandle(mobileForm,'mobileForm')">保存并启用
              </el-button>
              <el-button @click="resetFormHandle('mobileForm')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-tab-pane>
      <el-tab-pane label="邮件配置"
                   name="email">
        <el-card class="box-card">
        <el-form :model="emailForm" :rules="emailFormRules" ref="emailForm"  hide-required-asterisk='true'
                 label-width="120px">
          <el-form-item prop="smtp" label="邮件配置">
            <el-input v-model="emailForm.smtp" placeholder="邮件配置"></el-input>
          </el-form-item>
          <el-form-item prop="port" label="邮箱端口号">
            <el-input v-model="emailForm.port" placeholder="端口号"></el-input>
          </el-form-item>
          <el-form-item prop="username" label="邮箱账号">
            <el-input v-model="emailForm.username" placeholder="邮箱账号"></el-input>
          </el-form-item>
          <el-form-item prop="password" label="邮箱密码">
            <el-input v-model="emailForm.password" placeholder="邮箱密码"></el-input>
          </el-form-item>
        </el-form>
        </el-card>
      </el-tab-pane>
      <el-tab-pane label="其他配置"
                   name="other">
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
    import {saveOrUpdateConfig, configInfo} from '@/api/sys/config'
    import dataDictionary from '@/mixins/data-dictionary'
    export default {
        name: 'sysConfig',
        mixins: [dataDictionary],
        data() {
            return {
                activeName: 'cloudStorage',
                configName: '云存储配置',
                config: {
                    configId: '',
                    configKey: '',
                    configValue: ''
                },
                cloudStorageForm: {
                    ossType: '0',
                    region: '',
                    domain: '',
                    endpoint: '',
                    accessKeyId: '',
                    accessKeySecret: '',
                    bucketName: ''
                },
                emailForm: {
                    smtp: '',
                    port: '',
                    username: '',
                    password: ''
                },
                cloudStorageFormRules: {
                    domain: [
                        {required: true, message: '请输入域名', trigger: 'blur'}
                    ],
                    region: [
                        {required: true, message: '请输入region', trigger: 'blur'}
                    ],
                    endpoint: [
                        {required: true, message: '请输入endpoint', trigger: 'blur'}
                    ],
                    accessKeyId: [
                        {required: true, message: '请输入accessKeyId', trigger: 'blur'}
                    ],
                    accessKeySecret: [
                        {required: true, message: '请输入accessKeySecret', trigger: 'blur'}
                    ],
                    bucketName: [
                        {required: true, message: '请输入桶名', trigger: 'blur'}
                    ]
                },
                mobileForm: {
                    mobileType: '1',
                    templateId: '',
                    sign: '',
                    appId: '',
                    appKey: ''
                },
                emailFormRules: {
                    smtp: [
                        { required: true, message: '请输入邮件配置', trigger: 'blur' }
                    ],
                    port: [
                        { required: true, message: '请输入邮箱端口号', trigger: 'blur' }
                    ],
                    username: [
                        { required: true, message: '请输入邮箱账号', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '请输入邮箱密码', trigger: 'blur' }
                    ]
                },
                mobileFormRules: {
                    mobileType: [
                        {required: true, message: '请选择短信平台', trigger: 'blur'}
                    ],
                    templateId: [
                        {required: true, message: '请输入短信模板ID', trigger: 'blur'}
                    ],
                    sign: [
                        {required: true, message: '请输入短信签名', trigger: 'blur'}
                    ],
                    appId: [
                        {required: true, message: '请输入短信应用appID', trigger: 'blur'}
                    ],
                    appKey: [
                        {required: true, message: '请输入短信应用appkey', trigger: 'blur'}
                    ]
                },
            }
        },
        computed: {
        },
        mounted() {
            this.configTabHandle('', '')
        },
        methods: {
            /**
             * 配置tab切换
             */
            configTabHandle(tab, event) {
                configInfo(this.activeName).then(res => {
                    if (res.data) {
                        this.config = res.data
                        switch (this.activeName) {
                            case 'cloudStorage':
                                this.cloudStorageForm = JSON.parse(res.data.configValue)
                                this.configName="云存储配置"
                                break;
                            case 'mobileSms':
                                this.mobileForm = JSON.parse(res.data.configValue)
                                this.configName="阿里短信配置"
                                break;
                            case 'email':
                                this.emailForm = JSON.parse(res.data.configValue)
                                this.configName="邮件配置"
                                break;
                        }
                    } else {
                        this.config.configId = null
                    }
                })
            },
            /**
             * 重置表单
             */
            resetFormHandle(formName) {
                this.$refs[formName].resetFields()
            },
            /**
             * 保存配置
             * data 配置数据
             * formName  表单名字
             */
            saveConfigHandle(data, formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.config.configKey = this.activeName
                        this.config.configName = this.configName
                        this.config.configValue = JSON.stringify(data)
                        saveOrUpdateConfig(this.config).then(res => {
                            this.$message({
                                message: '保存成功',
                                type: 'success'
                            })
                        })
                    } else {
                        return false
                    }
                })
            }
        }
    }
</script>

<style lang="scss" scoped>
  .box-card {
    width: 580px;
  }
</style>
