<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <el-button :size="size" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button :disabled="dataListSelections.length <= 0" :size="size" type="danger" @click="deleteHandle()">批量删除</el-button>
      </template>
    </searchbar>
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle">
      <el-table-column type="selection" header-align="center" align="center" width="50"/>
      <el-table-column type="index" header-align="center" align="center" width="50"/>
      <el-table-column prop="name" header-align="center" align="center" label="图表名称"/>
      <el-table-column prop="code" header-align="center" align="center" label="编码"/>
      <el-table-column :show-overflow-tooltip="true" prop="code" header-align="center" align="center" label="数据"/>
      <el-table-column prop="code" header-align="center" align="center" label="Y轴文字"/>
      <el-table-column prop="code" header-align="center" align="center" label="X轴文字"/>
      <el-table-column fixed="right" header-align="center" align="center" width="120" label="操作">
        <template slot-scope="scope">
          <el-button :size="size" type="text" @click="addOrUpdateHandle(scope.row.userId)">修改</el-button>
          <el-divider direction="vertical"/>
          <el-dropdown :class="[size]">
            <span class="el-dropdown-link">
              更多<i class="el-icon-arrow-down el-icon--right"/>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>配置地址</el-dropdown-item>
              <el-dropdown-item>功能测试</el-dropdown-item>
              <el-dropdown-item>删除</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <!-- <el-button type="text" :size="size" @click="deleteHandle(scope.row.userId)">删除</el-button> -->
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
import AddOrUpdate from './chart-add-or-update'
import * as API from '@/api/report/chart'
export default {
  components: {
    AddOrUpdate,
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
          { name: '图表名称',
            field: 'name',
            type: 'text',
            dbfield: 'name', dboper: 'cn'
          },
          { name: '编码',
            field: 'code',
            type: 'text',
            dbfield: 'code', dboper: 'cn'
          }
        ]
      }
    }
  },
  methods: {
    handleCommand(command) {
      this.$message('click on item ' + command)
    }
  }
}
</script>
