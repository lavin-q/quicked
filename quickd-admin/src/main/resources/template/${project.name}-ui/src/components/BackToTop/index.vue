<template>
  <transition name="slide-up">
    <div v-show="visibleFlag" class="back-to-top" @click="backToTopHandle">
      <svg-icon icon-class="back-to-top" class-name="svg-icon"/>
    </div>
  </transition>
</template>

<script>
export default {
  name: 'BackToTop',
  props: {
    visibilityHeight: { // 滚动到多高显示回到顶部按钮，默认是200px
      type: Number,
      default: 50
    }
  },
  data() {
    return {
      visibleFlag: false,
      timer: null
    }
  },
  mounted() {
    this.$parent.$refs.scrollWapper.addEventListener('scroll', this.scrollHandle)
  },
  beforeDestroy() {
    if (this.$parent.$refs.scrollWappe) {
      this.$parent.$refs.scrollWapper.removeEventListener('scroll', this.scrollHandle)
    }
    if (this.timer) {
      clearInterval(this.timer)
    }
  },
  methods: {
    scrollHandle() {
      // this.visibleFlag = window.pageYOffset > this.visibilityHeight
      this.visibleFlag = this.$parent.$refs.scrollWapper.scrollTop > this.visibilityHeight
    },

    backToTopHandle() {
      const _this = this
      clearInterval(this.timer)
      this.timer = setInterval(function() {
        // const curHeight = document.documentElement.scrollTop || document.body.scrollTop; // 得到当前高度
        const curHeight = _this.$parent.$refs.scrollWapper.scrollTop// 得到当前高度
        var now = curHeight
        var speed = (0 - now) / 7 // 随着高度减速
        if (curHeight === 0) { // 当前高度为零,停止这次计时器
          clearInterval(_this.timer)
        }
        // document.documentElement.scrollTop = curHeight + speed; // 直接给高度赋值
        _this.$parent.$refs.scrollWapper.scrollTop = curHeight + speed // 直接给高度赋值
        // document.body.scrollTop = curHeight + speed; // 谷歌
      }, 30)
    }
  }
}
</script>

<style scoped>
.back-to-top{
    display: inline-block;
    z-index: 99;
    right: 15px;
    bottom: 20px;
    position: fixed;
    color: #ccc;
    cursor:pointer;
}
.back-to-top:hover{
    color: #2FACF1;
}
.svg-icon{
    font-size:40px;
}
.slide-up-leave-active,.slide-up-enter-active{
    transition:  all 1s ease;
}
.slide-up-leave-to,.slide-up-enter{
    opacity:0;
}
</style>
