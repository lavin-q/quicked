<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <el-button size="small" type="primary" @click="addOrUpdateHandle()">新增</el-button>
      </template>
    </searchbar>
    <!--表格渲染-->
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;">
      <el-table-column prop="name" label="名称"/>
      <el-table-column label="所属部门">
        <template slot-scope="scope">
          <div>{{ scope.row.deptName }}</div>
        </template>
      </el-table-column>
      <el-table-column prop="sort" label="排序">
        <template slot-scope="scope">
          {{ scope.row.sort }}
        </template>
      </el-table-column>

      <el-table-column prop="enabled" header-align="center" align="center" label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.enabled === 0 || scope.row.enabled === '0'" :size="size" type="danger">禁用</el-tag>
          <el-tag v-else :size="size">正常</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="创建日期">
      </el-table-column>
      <el-table-column fixed="right" header-align="center" align="center" width="100" label="操作">
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
import dataDictionary from '@/mixins/data-dictionary'
import Searchbar from '@/components/Searchbar'
import AddOrUpdate from './job-add-or-update'
import * as API from '@/api/sys/job'

export default {
  components: {
    AddOrUpdate,
    Searchbar
  },
  mixins: [mixinViewModule, dataDictionary],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.list,
        delAPI: API.del
      },

      searchItems: {
        normal: [
          { name: '岗位名称', field: 'name', type: 'text', dbfield: 'name', dboper: 'cn' }
        ]
      },
    }
  },
  mounted() {
  },
  methods: {

  }
}
</script>
