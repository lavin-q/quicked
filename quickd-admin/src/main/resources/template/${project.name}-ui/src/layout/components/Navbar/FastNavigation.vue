<template>
  <el-menu class="header-navbar__menu mr-auto" mode="horizontal">
    <el-menu-item index="1" title="首页">
      <router-link class="router-link" to="/dashboard">
        <svg-icon icon-class="dashboard" class-name="header-navbar__icon-menu"/>
      </router-link>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  data() {
    return {
    }
  },
  mounted() {

  },
  methods: {

  }
}
</script>
<style lang="scss" scoped>

</style>
