<template>
  <div class="login-container">
    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" auto-complete="on" label-position="left">
      <div class="title-container">
        <h3 class="title">
          <span class="login-logo-cont"><img src="static/images/login/login-logo.png" alt=""></span>
          <p>{{ webName }} </p>
        </h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          v-model="loginForm.username"
          :placeholder="'请输入用户名'"
          name="username"
          type="text"
          auto-complete="on"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          v-model="loginForm.password"
          :type="passwordType"
          :placeholder="'请输入用户密码'"
          name="password"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
        </span>
      </el-form-item>
      <el-form-item  prop="captcha" class="code-wape">
        <span class="svg-container">
          <svg-icon icon-class="validCode" />
        </span>
        <el-input
          v-model="loginForm.captcha"
          :placeholder="'请输入验证码'"
          name="captcha"
          auto-complete="off"
          style="width: 50%;"
          @keyup.enter.native="handleLogin"
        />
        <div class="login-code">
          <graphic-code :content-width="115" @success="generateCode"/>
        </div>
      </el-form-item>
      <el-button :loading="loading" type="primary" class="login-btn" style="" @click.native.prevent="handleLogin">
        {{ '登陆' }}
      </el-button>

    </el-form>

  </div>
</template>

<script>
    import GraphicCode from '@/components/GraphicCode'
    const Base64 = require('js-base64').Base64
    export default {
        name: 'Login',
        components: {
            GraphicCode
        },
        data () {
            const validateUsername = (rule, value, callback) => {
                if (!value) {
                    callback(new Error('用户名不能为空'))
                } else {
                    callback()
                }
            }
            const validCaptcha = (rule, value, callback)=> {
                if (this.loginForm.captcha.toLowerCase() !== this.verifiedCode) {
                    return callback(new Error('您输入的验证码不正确!'))
                } else {
                    return callback()
                }
            }
            const validatePassword = (rule, value, callback) => {
                if (value.length < 6) {
                    callback(new Error('密码必须大于6位字符'))
                } else {
                    callback()
                }
            }
            return {
                loginForm: {
                    username: 'admin',
                    password: '123456'
                },
                loginRules: {
                    username: [{ required: true, trigger: 'blur', validator: validateUsername }],
                    password: [{ required: true, trigger: 'blur', validator: validatePassword }],
                    captcha: [{ required: true, trigger: 'blur', validator: validCaptcha }]
                },
                verifiedCode: '',
                passwordType: 'password',
                loading: false,
                showDialog: false,
                redirect: undefined
            }
        },
        watch: {
            $route: {
                handler: function (route) {
                    this.redirect = route.query && route.query.redirect
                },
                immediate: true
            }
        },
        created () {
            // window.addEventListener('hashchange', this.afterQRScan)
        },
        destroyed () {
            // window.removeEventListener('hashchange', this.afterQRScan)
        },
        mounted: function() {
            this.checkBrowser() // 检测浏览器
        },
        methods: {
            checkBrowser() {
                var ua = navigator.userAgent.toLocaleLowerCase()
                if (ua.match(/chrome/) == null && ua.match(/firefox/) == null) {
                    // 既不是chrome内核，也不是火狐浏览器
                    this.$alert(
                        `系统检测到您的浏览器可能不兼容本系统，建议您下载以下浏览器：<br /><br /><a href="${
                            this.baseURL
                        }/welcome/tools/49.0.2623.112_chrome_installer.exe" target="_blank">Chrome下载</a>&nbsp;或者&nbsp;<a href="${
                            this.baseURL
                        }/welcome/tools/360cse_9.5.0.138.exe" target="_blank">360极速浏览器下载</a>`,
                        '温馨提示',
                        {
                            dangerouslyUseHTMLString: true
                        }
                    )
                }
            },
            showPwd () {
                if (this.passwordType === 'password') {
                    this.passwordType = ''
                } else {
                    this.passwordType = 'password'
                }
            },

            generateCode(value) {
                this.verifiedCode = value.toLowerCase()
            },
            handleLogin () {

                this.$refs.loginForm.validate(valid => {
                    if (valid) {
                        this.loading = true
                        const postData = {}
                        postData.username = Base64.encode(
                            Base64.encode(Base64.encode(this.loginForm.username))
                        )
                        postData.password = Base64.encode(
                            Base64.encode(Base64.encode(this.loginForm.password))
                        )
                        delete postData.captcha
                        this.$store.dispatch('loginByUsername', postData).then(res => {
                            this.loading = false
                            if (res.code === 0) {
                                const redirectTo = this.$route.query.redirect || '/'
                                this.$router.push({ path: redirectTo })
                            } else {
                                this.$message({
                                    showClose: true,
                                    message: '登录失败：' + res.msg,
                                    type: 'error'
                                })
                            }
                        }).catch(() => {
                            this.loading = false
                        })
                    } else {
                        console.log('error submit!!')
                        return false
                    }
                })
            }
        }
    }
</script>

<style rel="stylesheet/scss" lang="scss">
  $bg:#1369db;
  $light_gray:#eee;
  $cursor: #fff;

  @supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
    .login-container .el-input input{
      color: $cursor;
      &::first-line {
        color: $light_gray;
      }
    }
  }

  /* reset element-ui css */
  .login-container {
    .el-input {
      display: inline-block;
      height: 47px;
      width: 85%;
      input {
        background: transparent;
        border: 0px;
        -webkit-appearance: none;
        border-radius: 0px;
        padding: 12px 5px 12px 15px;
        color: $light_gray;
        height: 47px;
        caret-color: $cursor;
        &:-webkit-autofill {
          -webkit-box-shadow: 0 0 0px 1000px $bg inset !important;
          -webkit-text-fill-color: $cursor !important;
        }
      }
    }
    .login-code {
      width: 33%;
      display: inline-block;
      height: 38px;
      padding: 8px;
      float: right;
      img{
        cursor: pointer;
        vertical-align:middle
      }
    }
    .el-form-item {
      border: 1px solid rgba(255, 255, 255, 0.1);
      background: rgba(250, 250, 250, 0.1);
      border-radius: 5px;
      color: #454545;
    }
  }
</style>

<style rel="stylesheet/scss" lang="scss" scoped>
  $bg:#1369db;
  $dark_gray:#889aa4;
  $light_gray:#eee;

  .login-container {
    min-height: 100%;
    width: 100%;
    /*background-color: $bg;*/
    background: linear-gradient(45deg, #0543b0 30%, #237eef 100%);
    overflow: hidden;
    .login-form {
      position: relative;
      width: 520px;
      max-width: 100%;
      padding: 50px 35px 0;
      margin: 0 auto;
      overflow: hidden;
    }
    .tips {
      font-size: 14px;
      color: #fff;
      margin-bottom: 10px;
      span {
        &:first-of-type {
          margin-right: 16px;
        }
      }
    }
    .svg-container {
      padding: 6px 5px 6px 15px;
      color: #eaeaea;
      vertical-align: middle;
      width: 30px;
      display: inline-block;
    }
    .title-container {
      position: relative;
      .title {
        font-size: 26px;
        color: $light_gray;
        margin: 0px auto 40px auto;
        text-align: center;
        font-weight: bold;
      }
      .set-language {
        color: #fff;
        position: absolute;
        top: 3px;
        font-size:18px;
        right: 0px;
        cursor: pointer;
      }
    }
    .show-pwd {
      position: absolute;
      right: 10px;
      top: 7px;
      font-size: 16px;
      color: #eaeaea;
      cursor: pointer;
      user-select: none;
    }
    .thirdparty-button {
      position: absolute;
      right: 0;
      bottom: 6px;
    }
  }
</style>
<style rel="stylesheet/scss" lang="scss">
  $bcolor: #132a45;
  .login-logo-cont, .login-logo-cont img{
    display: inline-block;
    width:150px;
  }
  .title p{
    font-size: 16px;
    margin:0;
    font-weight: normal;
    color:#f1f1f1;
  }
  .login-btn{
    width:100%;
    line-height: 30px;
    margin-bottom:30px;
    background: $bcolor;
    border:1px solid $bcolor
  }
  .login-btn:hover{
    background: #1e3551;
    border:1px solid #1e3551
  }
</style>
