<template>
  <div style="background:#f0f2f5;margin-top: -20px;height: 100%">
    <div class="page-http404">
      <div class="pic-404">
        <img class="pic-404_parent" :src="img_404" alt="404">
        <img class="pic-404_child left" :src="img_404_cloud" alt="404">
        <img class="pic-404_child mid" :src="img_404_cloud" alt="404">
        <img class="pic-404_child right" :src="img_404_cloud" alt="404">
      </div>
      <div class="exception">
        <div class="exception_headline">抱歉，您访问的页面不存在</div>
        <a href="/" class="exception_return-home">返回首页</a>
      </div>
    </div>
  </div>
</template>

<script>
    import img_404 from 'static/images/error-imgs/404.png';
    import img_404_cloud from 'static/images/error-imgs/404_cloud.png';
    export default {
        name:'404',
        data(){
            return{
                img_404,
                img_404_cloud,
            };
        },
    };
</script>


<style rel="stylesheet/scss" lang="scss" scoped>
  .page-http404{
    display: flex;
    align-items: center;
    position: relative;
    margin:20px auto 60px;
    padding: 0 auto;
    overflow:hidden;
    justify-content: center;
    align-items: center;
  }
  .pic-404{
    position: relative;
    float: left;
    width: 600px;
    padding:150px 0;
    overflow:hidden;
    &_parent{
      width:100%;
    }
    &_child{
      position: absolute;
      &.left{
        width:80px;
        top:17px;
        left: 220px;
        opacity: 0;
        animation-name: cloudLeft;
        animation-duration:2s;
        animation-timing-function:linear;
        animation-fill-mode:forwards;
        animation-delay:1s;
      }
      &.mid{
        width:46px;
        top:10px;
        left: 42px;
        opacity: 0;
        animation-name: cloudMid;
        animation-duration: 2s;
        animation-timing-function: linear;
        animation-fill-mode: forwards;
        animation-delay: 1.2s;
      }
      &.right {
        width: 62px;
        top: 100px;
        left: 500px;
        opacity: 0;
        animation-name: cloudRight;
        animation-duration: 2s;
        animation-timing-function: linear;
        animation-fill-mode: forwards;
        animation-delay: 1s;
      }
      @keyframes cloudLeft {
        0% {
          top: 17px;
          left: 220px;
          opacity: 0;
        }
        20% {
          top: 33px;
          left: 188px;
          opacity: 1;
        }
        80% {
          top: 81px;
          left: 92px;
          opacity: 1;
        }
        100% {
          top: 97px;
          left: 60px;
          opacity: 0;
        }
      }
      @keyframes cloudMid {
        0% {
          top: 10px;
          left: 420px;
          opacity: 0;
        }
        20% {
          top: 40px;
          left: 360px;
          opacity: 1;
        }
        70% {
          top: 130px;
          left: 180px;
          opacity: 1;
        }
        100% {
          top: 160px;
          left: 120px;
          opacity: 0;
        }
      }
      @keyframes cloudRight {
        0% {
          top: 100px;
          left: 500px;
          opacity: 0;
        }
        20% {
          top: 120px;
          left: 460px;
          opacity: 1;
        }
        80% {
          top: 180px;
          left: 340px;
          opacity: 1;
        }
        100% {
          top: 200px;
          left: 300px;
          opacity: 0;
        }
      }
    }
  }
  .exception {
    position: relative;
    float: left;
    width: 300px;
    padding: 150px 0;
    overflow: hidden;
    &_oops {
      font-size: 32px;
      font-weight: bold;
      line-height: 40px;
      color: #1482f0;
      opacity: 0;
      margin-bottom: 20px;
      animation-name: slideUp;
      animation-duration: 0.5s;
      animation-fill-mode: forwards;
    }
    &_headline {
      font-size: 20px;
      line-height: 24px;
      color: #434e59;
      opacity: 0;
      margin-bottom: 20px;
      animation-name: slideUp;
      animation-duration: 0.5s;
      animation-delay: 0.1s;
      animation-fill-mode: forwards;
    }
    &_info {
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
    &_return-home {
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
</style>
