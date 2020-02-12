<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <el-button size="small" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="hasPermission('sys:menu:delete')" :disabled="dataListSelections.length <= 0" :size="size" type="danger" @click="deleteHandle()">批量删除</el-button>
      </template>
    </searchbar>
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle">
      <el-table-column type="selection" header-align="center" align="center" width="50"/>
      <table-tree-column prop="name" label="菜单名称" header-align="center" width="150"/>
      <el-table-column header-align="center" align="center" label="图标">
        <template slot-scope="scope">
          <svg-icon v-if="scope.row.icon" :icon-class="scope.row.icon" style="font-size: 20px;"/>
        </template>
      </el-table-column>
      <el-table-column prop="type" header-align="center" align="center" label="类型">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.type === 0" size="small">一级菜单</el-tag>
          <el-tag v-else-if="scope.row.type === 1" size="small" type="success">二级菜单</el-tag>
          <el-tag v-else-if="scope.row.type === 2" size="small" type="info">按钮</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="sort" header-align="center" align="center" label="排序号"/>
      <el-table-column :show-overflow-tooltip="true" prop="url" header-align="center" align="center" label="菜单URL"/>
      <el-table-column :show-overflow-tooltip="true" prop="permissions" header-align="center" align="center" width="150" label="授权标识"/>
      <el-table-column fixed="right" header-align="center" align="center" width="150" label="操作">
        <template slot-scope="scope">
          <el-button v-if="hasPermission('sys:menu:update')" type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改 </el-button>
          <el-button v-if="hasPermission('sys:menu:delete')" type="text" size="small" @click="deleteHandle(scope.row.id)">删除 </el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import TableTreeColumn from '@/components/table-tree-column'
import AddOrUpdate from './menu-add-or-update'
import * as API from '@/api/sys/menu'

export default {
  components: {
    AddOrUpdate,
    Searchbar,
    TableTreeColumn
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.getMenuList,
        delAPI: API.deleteMenu
      },
      searchItems: {
        normal: [
          { name: '菜单名称',
            field: 'name',
            type: 'text',
            dbfield: 'name', dboper: 'cn'
          }
        ]
      }
    }
  },
  methods: {
    // 获取数据列表
    getDataList() {
      const _this = this
      const params = {}
      this.dataListLoading = true
      API.getMenuList(params).then(response => {
        if (response && response.code === 0) {
          this.dataList = response.data
        } else {
          this.dataList = []
        }
        _this.dataListLoading = false
      }).catch(error => {
        console.log(error)
        _this.dataListLoading = false
      })
    }
  }
}
</script>
