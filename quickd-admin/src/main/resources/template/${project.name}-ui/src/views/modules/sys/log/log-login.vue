<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar"/>
    <!--表格渲染-->
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;">
      <el-table-column prop="createBy" label="用户名" />
      <el-table-column prop="operation" label="用户操作">
        <template slot-scope="scope">
          {{ scope.row.operation === 0 ? '用户登录' :'用户退出' }}
        </template>
      </el-table-column>
      <el-table-column prop="status" label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 0" size="small" type="danger">失败</el-tag>
          <el-tag v-else-if="scope.row.status === 1" size="small" type="success">成功</el-tag>
          <el-tag v-else size="small" type="warning">账号已锁定</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="ip" label="操作IP"/>
      <el-table-column :show-overflow-tooltip="true" prop="userAgent" width="150" label="用户代理"/>
      <el-table-column prop="createTime" label="创建时间"/>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import * as API from '@/api/sys/loglogin'

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
          { name: '用户名', field: 'createBy', type: 'text', dbfield: 'create_by', dboper: 'cn' },
          { name: '状态', field: 'status', type: 'select',
            options: [
              { label: '失败', value: '0' },
              { label: '成功', value: '1' },
              { label: '账号已锁定', value: '2' }
            ],
            dbfield: 'status', dboper: 'eq', default: ''
          },
          { name: '创建时间', field: 'createTime', type: 'daterange', dbfield: 'create_time', dboper: 'bt', valueFormat: 'yyyy-MM-dd'
          }
        ]
      }
    }
  },
  methods: {

  }
}
</script>
