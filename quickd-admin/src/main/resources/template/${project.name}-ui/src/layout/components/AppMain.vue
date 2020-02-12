<template>
  <section class="app-main">
    <transition name="fade-transform" mode="out-in">
      <keep-alive>
        <iframe v-if="$route.meta.isIframe" :src="$route.meta.iframeUrl" width="100%" height="100%" frameborder="0" scrolling="yes" class="iframe-wrapper"/>
        <router-view v-else :key="key"/>
      </keep-alive>
    </transition>
  </section>
</template>

<script>
export default {
  name: 'AppMain',
  computed: {
    cachedViews() {
      return this.$store.state.tagsView.cachedViews
    },
    key() {
      return this.$route.fullPath
    }
  }
}
</script>

<style lang="scss" scoped>
  @import "~@/styles/variables.scss";
  .app-main {
    z-index: 88;
    /*84 = navbar + tags-view = 50 +34 */
    min-height: calc(100vh - 84px);
    width: 100%;
    height: 100%;
    position: relative;
    overflow: hidden;
    .iframe-wrapper{
      height:$content--fill-height-tabs;
    }
    .el-main-footer {
      background: none repeat scroll 0 0 white;
      border-top: 1px solid #e7eaec;
      overflow: hidden;
      padding: 10px 6px 0px 6px;
      height: 33px;
      font-size: 0.7rem !important;
      color: #7a8b9a;
      letter-spacing: 0.8px;
      font-family: Arial, sans-serif !important;
      position: fixed;
      bottom: 0;
      z-index: 99;
      width: 100%;
    }
  }

  .fixed-header+.app-main {
    padding-top: 50px;
  }

  .hasTagsView {
    .app-main {
      min-height: calc(100vh - 84px);
    }

    .fixed-header+.app-main {
      padding-top: 85px;
    }
  }
</style>

