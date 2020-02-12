<template>
  <div style="margin-top: -20px;height:100%;height:100vh;">
    <div class="page-http401">
      <div class="pic-401">
        <img class="pic-401__parent" :src="img_401" alt="401" height="428" width="313">
      </div>
      <div class="bullshit">
        <h1 class="bullshit__oops">Oops!</h1>
        <div class="bullshit__headline">{{ message }}</div>
        <div class="bullshit__info">请点击以下按钮返回主页或者返回上一页：</div>
        <a href="/" class="bullshit__return-home">返回首页</a>
        <a href="javascript:void(0)" @click.prevent="back" class="bullshit__return-back">返回上一页</a>
      </div>
    </div>
  </div>
</template>

<script>
import img_401 from 'static/images/error-imgs/401.gif'

export default {
  name: 'page401',
  data() {
    return {
      img_401
    }
  },
  computed: {
    message() {
      return '对不起，您没有权限去该页面......'
    }
  },
  methods:{
    back() {
      if (this.$route.query.noGoBack) {
        this.$router.push({ path: '/' })
      } else {
        this.$router.go(-1)
      }
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.page-http401 {
  position: relative;
  width: 100vw;
  margin:0 auto;
  overflow: hidden;
  .pic-401 {
    box-sizing: border-box;
    position: relative;
    float: left;
    width: 600px;
    width: 50vw;
    text-align: right;
    padding: 150px 50px 0 0;
    overflow: hidden;
    &__parent {
      // width: 100%;
      padding-right:25px;
    }
  }
  .bullshit {
    position: relative;
    float: left;
    width: 50vw;
    padding: 150px 0;
    overflow: hidden;
    &__oops {
      font-size: 60px;
      font-weight: bold;
      line-height: 60px;
      color: #1482f0;
      opacity: 0;
      margin-bottom: 20px;
      animation-name: slideUp;
      animation-duration: 0.5s;
      animation-fill-mode: forwards;
    }
    &__headline {
      font-size: 20px;
      line-height: 24px;
      color: #1482f0;
      opacity: 0;
      margin-bottom: 10px;
      animation-name: slideUp;
      animation-duration: 0.5s;
      animation-delay: 0.1s;
      animation-fill-mode: forwards;
    }
    &__info {
      font-size: 13px;
      line-height: 21px;
      color: grey;
      opacity: 0;
      margin-bottom: 30px;
      animation-name: slideUp;
      animation-duration: 0.5s;
      animation-delay: 0.2s;
      animation-fill-mode: forwards;
    }
    &__return-home,&__return-back {
      display: block;
      float: left;
      width: 110px;
      height: 36px;
      background: #1482f0;
      border-radius: 100px;
      text-align: center;
      color: #ffffff;
      opacity: 0;
      font-size: 14px;
      line-height: 36px;
      cursor: pointer;
      animation-name: slideUp;
      animation-duration: 0.5s;
      animation-delay: 0.3s;
      animation-fill-mode: forwards;
      text-decoration: none;
    }
    &__return-back {
      margin-left:10px;
    }
    @keyframes slideUp {
      0% {
        transform: translateY(60px);
        opacity: 0;
      }
      100% {
        transform: translateY(0);
        opacity: 1;
      }
    }
  }
}
</style>
