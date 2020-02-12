<template>
  <el-menu-item v-if="sidebarLogo" :class="{'submenu-title-noDropdown':isCollapse}" index="0" class="logo-item">
    <!-- 缩小时显示的logo，可以自定义，这里直接使用图标库中的 -->
    <!-- <svg-icon v-if="isCollapse" icon-class="run" /> -->
    <!--正常状态下显示的，可以使用本地的logoImg-->
    <div v-if="!isCollapse" class="logo-con">
      {{ webName }}
    </div>
  </el-menu-item>
</template>

<script>
// import logoImg from '@/assets/logo/logo.png'
import { mapState } from 'vuex'
import Settings from '@/settings'
export default {
  name: 'Logo',
  props: {
    isCollapse: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      // logoImg: logoImg
      webName: Settings.webName,
      webVersion: Settings.webVersion
    }
  },
  computed: {
    ...mapState({
      sidebarLogo: state => state.settings.sidebarLogo
    })
  }
}
</script>

