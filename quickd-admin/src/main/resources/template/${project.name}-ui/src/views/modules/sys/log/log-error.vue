<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <el-button size="small" type="primary" @click="exportHandle()">导出</el-button>
      </template>
    </searchbar>
    <!--表格渲染-->
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;">
      <el-table-column prop="requestUri" label="请求URI" />
      <el-table-column prop="requestMethod" label="请求方式" />
      <el-table-column :show-overflow-tooltip="true" prop="requestParams" width="150" label="请求参数" />
      <el-table-column :show-overflow-tooltip="true" prop="userAgent" width="150" label="用户代理" />
      <el-table-column prop="ip" label="操作IP" />
      <!-- <el-table-column prop="errorInfo" label="异常信息" /> -->
      <el-table-column prop="createDate" label="创建时间" />
      <el-table-column header-align="center" align="center" label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="infoHandle(scope.row.errorInfo)">异常详情</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import * as API from '@/api/sys/logerror'
export default {
  components: {
    Searchbar
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.list,
        delAPI: API.del
      },
      searchItems: {
        normal: [
          { name: '异常时间', field: 'createDate', type: 'daterange', dbfield: 'create_date', dboper: 'bt', valueFormat: 'yyyy-MM-dd'
          }
        ]
      }
    }
  },
  methods: {
    // 异常信息
    infoHandle(info) {
      this.$alert(info, '异常详情', {
        customClass: 'mod-sys__log-error-view-info'
      })
    }
  }
}
</script>

<style lang="scss">
  .mod-sys__log-error {
    &-view-info {
      width: 80%;
    }
  }
</style>
