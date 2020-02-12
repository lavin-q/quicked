<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <!-- <el-button v-if="hasPermission('sys:user:save')" :size="size" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="hasPermission('sys:user:delete')" :disabled="dataListSelections.length <= 0" :size="size" type="danger" @click="deleteHandle()">批量删除</el-button> -->
        <el-button :size="size" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button :disabled="dataListSelections.length <= 0" :size="size" type="danger" @click="deleteHandle()">批量删除</el-button>
      </template>
    </searchbar>
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle">
      <el-table-column type="selection" header-align="center" align="center" width="50"/>
      <el-table-column prop="username" header-align="center" align="center" label="用户名"/>
      <el-table-column prop="realName" header-align="center" align="center" label="名称"/>
      <el-table-column prop="status" header-align="center" align="center" label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 0 || scope.row.status === '0'" :size="size" type="danger">禁用</el-tag>
          <el-tag v-else :size="size">正常</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="mgrType_dictText" label="超级管理员"/>
      <el-table-column prop="createTime" header-align="center" align="center" width="180" label="创建时间"/>
      <el-table-column fixed="right" header-align="center" align="center" width="150" label="操作">
        <template slot-scope="scope">
          <el-button :size="size" type="text" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
          <el-button :size="size" type="text" @click="deleteHandle(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import AddOrUpdate from './user-add-or-update'
import * as API from '@/api/sys/user'
export default {
  components: {
    AddOrUpdate,
    Searchbar
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.getUserList,
        delAPI: API.deleteUser
      },
      searchItems: {
        normal: [
          { name: '用户名',
            field: 'username',
            type: 'text',
            dbfield: 'username', dboper: 'cn'
          }
        ]
      }
    }
  },
  methods: {
  }
}
</script>
