<template>
  <div class="app-main-content">
    <el-row :gutter="15">
      <!--部门列表-->
      <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
        <el-card class="box-card" shadow="never">
          <div slot="header" class="clearfix">
            <span class="role-span">部门列表</span>
            <div style="float: right">
              <!-- <el-button v-if="hasPermission('sys:dept:add')" :size="size" type="primary" @click="addOrUpdateHandle()">新增</el-button> -->
              <el-button type="primary" icon="el-icon-plus" size="mini" style="padding: 6px 9px" @click="addOrUpdateHandle()">新增</el-button>
            </div>
          </div>
          <el-input :size="size" v-model="deptName" clearable placeholder="输入部门名称搜索" prefix-icon="el-icon-search" style="width: 100%;" class="filter-item" @input="toFilterDept"/>
          <el-tree ref="deptTree" :data="depts" :expand-on-click-node="false" :filter-node-method="filterDeptTreeNode" default-expand-all @current-change="deptListTreeCurrentChangeHandle" @node-click="handleNodeClick">
            <span slot-scope="{ node, data }" class="custom-tree-node">
              <span>{{ data.deptName }}</span>
              <span>
                <el-button type="text" size="mini" @click="() => addOrUpdateHandle(data.id)">修改</el-button>
                <el-button type="text" size="mini" @click="() => delDept(data.id, data)">删除</el-button>
              </span>
            </span>
          </el-tree>
        </el-card>
      </el-col>
      <!-- 授权 -->
      <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
        <el-alert :closable="false" :title="'选中部门：'+(selectedDept?selectedDept.deptName:'')" type="default" show-icon effect="light"/>
        <el-card class="box-card" shadow="never">
          <div slot="header" class="clearfix">
            <el-tooltip class="item" effect="dark" content="选择指定部门查看详情" placement="top">
              <span class="role-span">用户信息</span>
            </el-tooltip>
            <el-button
              :disabled="selectedDept===null"
              icon="el-icon-plus"
              size="mini"
              style="float: right; padding: 6px 9px"
              type="primary"
              @click="addOrUpdatePersonHandle()">用户录入</el-button>
          </div>
          <div v-show="selectedDept">
            <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
              <template slot="button">
                <el-button :disabled="dataListSelections.length <= 0" :size="size" type="danger" @click="deleteHandle()">批量删除</el-button>
              </template>
            </searchbar>
            <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight-120" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle">
              <el-table-column type="selection" header-align="center" align="center" width="50"/>
              <el-table-column prop="username" label="用户账号" header-align="center" align="center"/>
              <el-table-column prop="realName" label="用户名称" header-align="center" align="center"/>
              <el-table-column :label="'操作'" fixed="right" header-align="center" align="center" width="150">
                <template slot-scope="scope">
                  <el-button :size="size" type="text" @click="addOrUpdatePersonHandle(scope.row.id)">修改</el-button>
                  <el-button :size="size" type="text" @click="deleteHandle(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
          </div>
          <div v-show="!selectedDept">请先选择左侧部门</div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDeptDatas"/>
    <user-add-or-update v-if="personAddOrUpdateVisible" ref="personAddOrUpdate" @refreshDataList="getDeptDatas"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import * as API from '@/api/sys/dept'
import AddOrUpdate from './dept-add-or-update'
import UserAddOrUpdate from '../user/user-add-or-update'
export default {
  components: {
    Searchbar,
    AddOrUpdate,
    UserAddOrUpdate
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        activatedIsNeed: false,
        getListAPI: API.getDeptUserList,
        delAPI: API.delDeptUserList
      },

      delLoading: false,
      deptName: '', depts: [], deptId: null,
      selectedDept: null,

      searchItems: {
        normal: [
          { name: '用户名称',
            field: 'userName',
            type: 'text',
            dbfield: 'user_name', dboper: 'cn'
          }
        ]
      },
      personAddOrUpdateVisible: false
    }
  },
  activated() {
    this.getDeptDatas()
  },
  methods: {
    // 获取部门数据
    getDeptDatas() {
      const params = { }
      if (this.deptName) { params['name'] = this.deptName }
      API.treeList(params).then(res => {
        if (res && res.code === 0) {
          this.depts = res.data
        } else {
          this.depts = []
          this.$message.error('部门数据获取失败：' + res.msg)
        }
      })
    },

    // 删除部门
    delDept(id, data) {
      var ids = id ? [id] : this.dataListSelections.map(item => {
        return item.id
      })
      const title = data.children.length > 0 ? '删除该部门，则该部门下的子部门将不存在，您确定删除？' : `确定删除该部门?`
      this.$confirm(title, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.mixinViewModuleOptions.delAPI(ids).then(data => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDeptDatas()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },

    // 过滤部门树输入框
    toFilterDept() {
      this.$refs.deptTree.filter(this.deptName)
    },

    // 部门树过滤方法
    filterDeptTreeNode(value, data) {
      if (!value) return true
      return data.title.indexOf(value) !== -1
    },

    // 部门树点击事件
    deptListTreeCurrentChangeHandle(data) {
      // console.log('current-change')
      this.selectedDept = data
      // 初始化人员配置列表数据
      this.init(data.parentId)
    },

    // 部门树点击事件
    handleNodeClick(data) {
      // console.log('handleNodeClick')
    },

    init(parentId) {
      this.defaultQueryConditions = [{ 'field': 'parentId', 'op': 'cn', 'data': parentId }]
      this.getDataList()
      this.setTableHeight()
    },

    // 添加人员信息
    addOrUpdatePersonHandle(id) {
      this.personAddOrUpdateVisible = true
      this.$nextTick(() => {
        this.$refs.personAddOrUpdate.dataForm.id = id
        this.$refs.personAddOrUpdate.init(id)
      })
    }
  }
}
</script>
<style scoped>
  .custom-tree-node {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
  }
</style>
