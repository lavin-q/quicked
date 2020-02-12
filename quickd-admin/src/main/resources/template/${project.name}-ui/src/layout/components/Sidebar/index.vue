<template>
  <el-scrollbar :class="`left-sidebar--${$store.state.app.sidebarLayoutSkin}`" wrap-class="scrollbar-wrapper" class="left-sidebar">
    <el-menu
      :show-timeout="200"
      :default-active="$route.path"
      :collapse="isCollapse"
      :unique-opened="$store.state.settings.uniqueOpened"
      mode="vertical"
    >
      <Logo v-if="!isCollapse" :is-collapse="isCollapse"/>
      <template v-for="route in permission_routers">
        <sidebar-item v-if="!route.hidden" :key="route.path" :item="route" :base-path="route.path"/>
      </template>
    </el-menu>
  </el-scrollbar>
</template>

<script>
import { mapGetters } from 'vuex'
import SidebarItem from './SidebarItem'
import Logo from './Logo'
export default {
  components: { SidebarItem, Logo },
  computed: {
    ...mapGetters([
      'permission_routers',
      'sidebar'
    ]),
    isCollapse() {
      return !this.sidebar.opened
    }
  }
}
</script>
