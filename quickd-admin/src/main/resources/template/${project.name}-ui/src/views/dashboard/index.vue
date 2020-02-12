<template>
  <div class="app-main-content dashboard-container">
    <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="6" :lg="6">
        <div class="panel-simple">
          <div class="panel-header">
            <div class="panel-heading-inner">
            <svg-icon icon-class="notice" style="color:#FBB12D;"/>系统公告</div>
          </div>
          <div class="panel-body" style="height:225px;">
            {{ noticeInfo || '暂无新公告' }}
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6">
        <div class="panel-simple">
          <div class="panel-header">
            <div class="panel-heading-inner">
            <svg-icon icon-class="help"/>帮助手册</div>
            <div class="panel-heading-right">更多<svg-icon icon-class="double-allow-right"/></div>
          </div>
          <div class="panel-body" style="height:225px;">
            <ul class="ul-list clearfix">
              <li v-for="(item,index) in helpHandbookData" :key="index">
                <a :href="item.linkTo?item.linkTo:'javascript:void(0)'" target="_blank">
                  {{ index }}、{{ item.title }}
                </a>
              </li>
            </ul>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <el-row :gutter="20">
          <el-col v-for="(item, key, index) in dashboardTotalData" :xs="6" :sm="6" :md="6" :lg="6" :key="index" class="card-panel">
            <router-link v-if="item.linkTo" :to="item.linkTo" :class="['total-a',item.class]">
              <span>{{ item.name }}</span>
              <span class="total-count">{{ item.value }}</span>
            </router-link>
            <a v-else :class="['total-a',item.class]" href="javascript:void(0)">
              <span>{{ item.name }}</span>
              <span class="total-count">{{ item.value }}</span>
            </a>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <div class="panel-simple">
          <div class="panel-header">
            <div class="panel-heading-inner">
            <svg-icon icon-class="data-statistics"/>模块1</div>
          </div>
          <div class="panel-body" style="height:225px;">
            模块1内容
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <div class="panel-simple">
          <div class="panel-header">
            <div class="panel-heading-inner">
            <svg-icon icon-class="expire-clock" style="color:#F75C3F;"/>模块2</div>
          </div>
          <div class="panel-body" style="min-height:225px;">
            模块2内容
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>

export default {
  name: 'Dashboard',
  data() {
    return {
      noticeInfo: '版本更新',
      helpHandbookData: [
        { title: '操作手册', linkTo: null },
        { title: '帮助', linkTo: null, class: 'purple' },
        { title: '常见问题', linkTo: null, class: 'green' }
      ],
      dashboardTotalData: {
        // class:'purple','green','yellow','blue','orange','red'
        '数据块1': { name: '数据块1', value: 0, linkTo: '', class: 'purple' },
        '数据块2': { name: '数据块2', value: 0, linkTo: '', class: 'green' },
        '数据块3': { name: '数据块3', value: 0, linkTo: '', class: 'yellow' },
        '数据块4': { name: '数据块4', value: 0, linkTo: '', class: 'orange' },
        '数据块5': { name: '数据块5', value: 0, linkTo: '', class: 'red' }
      }
    }
  },
  created() {
    // 系统公告
    // API.noticeInfo().then(res => {
    //   if (res.code == 0 && res.data && res.data.details) {
    //     this.noticeInfo = res.data.details
    //   }
    // })
  },
  methods: {
  }
}
</script>

<style lang="scss" scoped>
.dashboard-container{
  background-color: #f0f2f5;
}
.ul-list {
    padding: 0;
    margin: 0;
    >li{
      position: relative;
      line-height: 35px;
      box-sizing: border-box;
      border-bottom: 1px solid rgba(0, 0, 0, 0.07);
      cursor: pointer;
      padding-left: 8px;

      &:hover{
        color: #4975bd;

        &::before {
          display: block;
          position: absolute;
          content: '';
          left: 0;
          top: 0;
          bottom: 0;
          width: 2px;
          background-color: #69baf4;
        }
      }
      >a{
        color: #4975bd;
      }
    }
}
.card-panel {
    position: relative;
    box-sizing: border-box;
    color: #fff;
    font-family: 'Microsoft YaHei';
    font-size: 15px;
    margin-bottom:20px;
    > a{
      display: block;
      box-sizing: border-box;
      height: 125px;
      color: #fff;
      border-radius: 3px;
      padding: 10px;
      text-decoration: none;
      > .total-count {
        text-align: left;
        font-size: 30px;
        line-height: 30px;
        word-wrap: break-word;
      }
    }
    > .total-a {
      padding-top: 8px;

      > span {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        line-height: 20px;
      }
    }
}
</style>
