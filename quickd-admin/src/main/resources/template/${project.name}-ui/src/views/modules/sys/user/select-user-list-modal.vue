<template>
  <el-dialog
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    title="选择用户"
    width="80%"
    top="8vh">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar"/>
    <el-table v-loading="dataListLoading" ref="multipleTable" :data="dataList" :height="300" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle">
      <el-table-column type="selection" header-align="center" align="center" width="50"/>
      <el-table-column prop="username" header-align="center" align="center" label="用户名"/>
      <el-table-column prop="realName" header-align="center" align="center" label="名称"/>
      <el-table-column prop="status" header-align="center" align="center" label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 0" :size="size" type="danger">禁用</el-tag>
          <el-tag v-else :size="size">正常</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="status" header-align="center" align="center" label="超级管理员">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.superAdmin === 0" :size="size" type="info">否</el-tag>
          <el-tag v-else :size="size" type="warning">是</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="createTime" header-align="center" align="center" width="180" label="创建时间"/>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
    <span slot="footer" class="dialog-footer">
      <el-button @click="handleCancel()">取消</el-button>
      <el-button type="primary" @click="submitSelectedUser()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import * as API from '@/api/sys/user'
export default {
  components: {
    Searchbar
  },
  mixins: [mixinViewModule],
  data() {
    return {
      isFixedTableHeight: true,
      mixinViewModuleOptions: {
        // activatedIsNeed: false,
        getListAPI: API.getUserList
      },
      searchItems: {
        normal: [
          { name: '用户名',
            field: 'username',
            type: 'text',
            dbfield: 'username', dboper: 'cn'
          }
        ]
      },
      visible: true
    }
  },
  created() {
    this._initViewModule()
  },
  methods: {
    _initViewModule(queryOptions, callback) {
      if (this.$refs.searchbar) {
        this.$refs.searchbar.init(queryOptions || {})
      }
      this.getDataList(null, callback)
    },
    // 设置选中
    selected(userIds) {
      const _this = this
      this.visible = true
      this._initViewModule(null, function() {
        const selectedRows = []
        _this.dataList.forEach(item => {
          if (userIds.includes(item.id)) {
            selectedRows.push(item)
          }
        })
        _this.$nextTick(() => {
          setTimeout(() => {
            _this.selectedTableRow(selectedRows)
          }, 200)
        })
      })
    },
    // 选中行
    selectedTableRow(rows) {
      const _this = this
      rows.forEach(item => {
        _this.$refs.multipleTable.toggleRowSelection(item, true)
      })
    },
    // 确定按钮
    submitSelectedUser() {
      this.$emit('choseUser', this.dataListSelections)
      this.handleCancel()
    },
    // 取消按钮
    handleCancel() {
      this.$refs.multipleTable.clearSelection()
      this.visible = false
    }

  }
}
</script>
