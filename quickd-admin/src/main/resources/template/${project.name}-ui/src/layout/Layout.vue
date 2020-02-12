<template>
  <div :class="classObj" class="app-wrapper">
    <!-- 遮罩层 -->
    <div v-if="device==='mobile'&&sidebar.opened" class="mask-drawer-bg" @click="handleClickOutside" />
    <!-- 侧边栏 -->
    <sidebar class="sidebar-container" />
    <!-- 主体区域 -->
    <div :class="{hasTagsView:needTagsView}" class="main-container">
      <div :class="{'fixed-header':fixedHeader}">
        <navbar />
        <tags-view v-if="needTagsView" />
      </div>
      <!-- 主体内容 -->
      <app-main v-if="!$store.state.app.contentIsNeedRefresh" />
      <!-- 页面配置项 -->
      <right-panel>
        <settings />
      </right-panel>
    </div>
  </div>
</template>

<script>
import RightPanel from '@/components/RightPanel'
import { AppMain, Navbar, Settings, Sidebar, TagsView } from './components'
import ResizeMixin from './mixin/ResizeHandler'
import { mapState } from 'vuex'

export default {
  name: 'Layout',
  provide() {
    return {
      // 刷新
      refresh() {
        this.$store.state.app.contentIsNeedRefresh = true
        this.$nextTick(() => {
          this.$store.state.app.contentIsNeedRefresh = false
        })
      }
    }
  },
  components: {
    AppMain,
    Navbar,
    Settings,
    Sidebar,
    TagsView,
    RightPanel
  },
  mixins: [ResizeMixin],
  computed: {
    ...mapState({
      sidebar: state => state.app.sidebar,
      device: state => state.app.device,
      needTagsView: state => state.settings.tagsView,
      fixedHeader: state => state.settings.fixedHeader
    }),
    classObj() {
      return {
        hideSidebar: !this.sidebar.opened,
        openSidebar: this.sidebar.opened,
        withoutAnimation: this.sidebar.withoutAnimation,
        mobile: this.device === 'mobile'
      }
    }
  },
  methods: {
    handleClickOutside() {
      this.$store.dispatch('closeSideBar', { withoutAnimation: false })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import "~@/styles/mixin.scss";
  @import "~@/styles/variables.scss";

  .app-wrapper {
    @include clearfix;
    position: relative;
    height: 100%;
    width: 100%;

    &.mobile.openSidebar {
      position: fixed;
      top: 0;
    }

    // 遮罩层
    .mask-drawer-bg {
      background: #000;
      opacity: 0.3;
      width: 100%;
      top: 0;
      height: 100%;
      position: absolute;
      z-index: 999;
    }

    // 侧边栏
    .sidebar-container {
      transition: width 0.28s;
      width: $sidebar--width;
      height: 100%;
      position: fixed;
      font-size: 0px;
      top: 0;
      bottom: 0;
      left: 0;
      z-index: 1001;
      overflow: hidden;
    }
    // 主体区域
    .main-container {
      min-height: 100%;
      transition: margin-left .28s;
      margin-left: $sidebar--width;
      position: relative;

      .fixed-header {
        position: fixed;
        top: 0;
        right: 0;
        background: #ffffff;
        z-index: 99;
        width: calc(100% - #{$sidebar--width});
        transition: width 0.28s;
      }
    }
  }

  .hideSidebar .fixed-header {
    width: calc(100% - #{$sidebar--width-fold})
  }

  .mobile .fixed-header {
    width: 100%;
  }
</style>
