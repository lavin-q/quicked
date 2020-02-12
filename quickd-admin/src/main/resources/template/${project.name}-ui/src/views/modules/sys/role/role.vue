<template>
  <div class="app-main-content">
    <el-row :gutter="15">
      <!--角色管理-->
      <el-col :xs="24" :sm="24" :md="16" :lg="16" :xl="17">
        <el-card class="box-card" shadow="never">
          <div slot="header" class="clearfix">
            <span class="role-span">角色列表</span>
            <div style="float: right">
              <el-radio-group v-model="operType" size="mini">
                <el-radio-button label="菜单分配"/>
                <el-radio-button label="权限分配"/>
              </el-radio-group>
            </div>
          </div>
          <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
            <template slot="button">
              <!-- <el-button v-if="hasPermission('sys:role:save')" :size="size" type="primary" @click="addDialogHandle()">新增</el-button> -->
              <el-button :size="size" type="primary" @click="addOrUpdateHandle()">新增</el-button>
              <!-- <el-button v-if="hasPermission('sys:role:delete')" :disabled="dataListSelections.length <= 0" :size="size" type="danger" @click="deleteHandle()">批量删除</el-button> -->
            </template>
          </searchbar>
          <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight-80" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle" @current-change="handleSelectedChange">
            <!-- <el-table-column type="selection" header-align="center" align="center" width="50"/> -->
            <el-table-column prop="id" header-align="center" align="center" width="80" label="ID"/>
            <el-table-column prop="roleName" header-align="center" align="center" label="角色名称"/>
            <el-table-column prop="roleCode" header-align="center" align="center" label="角色编码"/>
            <el-table-column prop="remark" header-align="center" align="center" label="备注"/>
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
        </el-card>
      </el-col>
      <!-- 授权 -->
      <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="7">
        <el-alert :closable="false" :title="'选中角色：'+(currentItem?currentItem.roleName:'')" type="default" show-icon effect="light"/>
        <div v-show="!currentItem">
          <el-card class="box-card" shadow="never">
            <div slot="header" class="clearfix">
              <el-tooltip class="item" effect="dark" content="请先选择左侧角色" placement="top">
                <span class="role-span">请先选择左侧角色</span>
              </el-tooltip>
            </div>
          </el-card>
        </div>
        <div v-show="currentItem!=null">
          <el-card v-show="operType === '菜单分配'" class="box-card" shadow="never">
            <div slot="header" class="clearfix">
              <el-tooltip class="item" effect="dark" content="选择指定角色分配菜单" placement="top">
                <span class="role-span">菜单分配</span>
              </el-tooltip>
              <el-button
                :disabled="currentId===null"
                :loading="menuLoading"
                icon="el-icon-check"
                size="mini"
                style="float: right; padding: 6px 9px"
                type="primary"
                @click="saveMenu">保存</el-button>
            </div>
            <el-tree
              ref="menu"
              :data="menus"
              :props="defaultProps"
              :default-checked-keys="menuIds"
              accordion
              show-checkbox
              node-key="id"/>
          </el-card>
          <el-card v-show="operType === '权限分配'" class="box-card" shadow="never">
            <div slot="header" class="clearfix">
              <el-tooltip class="item" effect="dark" content="选择指定角色分配权限" placement="top">
                <span class="role-span">权限分配</span>
              </el-tooltip>
              <el-button
                :disabled="currentId===null"
                :loading="permissionLoading"
                icon="el-icon-check"
                size="mini"
                style="float: right; padding: 6px 9px"
                type="primary"
                @click="savePermission">保存</el-button>
            </div>
            <el-tree
              ref="permission"
              :data="permissions"
              :props="defaultProps"
              :default-checked-keys="permissionIds"
              show-checkbox
              accordion
              node-key="id"/>
          </el-card>
        </div>
      </el-col>
    </el-row>

    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import AddOrUpdate from './role-add-or-update'
import * as API from '@/api/sys/role'
import * as $httpMenu from '@/api/sys/menu'
export default {
  components: {
    AddOrUpdate,
    Searchbar
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.getRoleList,
        delAPI: API.deleteRole
      },
      searchItems: {
        normal: [
          { name: '角色名称',
            field: 'roleName',
            type: 'text',
            dbfield: 'role_name', dboper: 'cn'
          }
        ]
      },
      operType: '菜单分配',
      defaultProps: {
        children: 'children',
        label: 'name'
      },
      currentItem: null,
      currentId: null,

      menuLoading: false, menus: [], menuIds: [],
      permissionLoading: false, permissions: [], permissionIds: []

    }
  },
  created() {
    this.getMenus()
    this.getPermissions()
  },
  methods: {
    // 获取菜单树形数据
    getMenus() {
      $httpMenu.getMenuList().then(res => {
        if (res && res.code === 0) {
          this.menus = res.data
        } else {
          this.menus = []
          this.$message.error(res.msg)
        }
      }).catch((error) => {
        this.menus = []
        console.log('菜单数据获取失败', error)
      })
    },
    // 获取权限树形数据
    getPermissions() {
      $httpMenu.getPermissionList().then(res => {
        if (res && res.code === 0) {
          this.permissions = res.data
        } else {
          this.permissions = []
          this.$message.error(res.msg)
        }
      }).catch((error) => {
        this.permissions = []
        console.log('权限数据获取失败', error)
      })
    },

    handleSelectedChange(val) {
      if (val) {
        // 清空权限与菜单的选中
        this.$refs.permission.setCheckedKeys([])
        this.$refs.menu.setCheckedKeys([])
        // 保存当前的角色id
        this.currentId = val.id
        this.currentItem = val
        // 初始化
        this.menuIds = []
        this.permissionIds = []

        if (this.operType === '菜单分配') {
          API.queryRolePermission({ roleId: val.id }).then(res => {
            if (res && res.code === 0) {
                this.menuIds  = res.data || []
            } else {
              this.menuIds = []
              this.$message.error(res.msg)
            }
          }).catch((error) => {
            this.menuIds = []
            console.log(error)
          })
        }
      }
    },

    // 保存菜单分配
    saveMenu() {
      this.menuLoading = true
      const role = { roleId: this.currentId, menuIds: "" }
      // 得到半选的父节点数据，保存起来
      this.$refs.menu.getHalfCheckedNodes().forEach(function(data, index) {
        role.menuIds+=(data.id+",")
      })
      // 得到已选中的 key 值
      this.$refs.menu.getCheckedKeys().forEach(function(data, index) {
          role.menuIds+=(data+",")
      })
      role.menuIds=  role.menuIds.substring(0,role.menuIds.length-1)
      API.saveRoleMenus(role).then(res => {
        if (res && res.code === 0) {
          this.$message({
            message: '保存成功',
            type: 'success',
            duration: 2500
          })
          this.menuLoading = false
          this.update()
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.menuLoading = false
        console.log(err.response.data.message)
      })
    },

    // 保存权限分配
    savePermission() {
      this.permissionLoading = true
      const role = { id: this.currentId, permissions: [] }
      this.$refs.permission.getCheckedKeys().forEach(function(data, index) {
        const permission = { id: data }
        role.permissions.push(permission)
      })
      API.saveRolePermissions(role).then(res => {
        if (res && res.code === 0) {
          this.$message({
            message: '保存成功',
            type: 'success',
            duration: 2500
          })
          this.permissionLoading = false
          this.update()
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.permissionLoading = false
        console.log(err.response.data.message)
      })
    },

    update() {
      // 无刷新更新表格数据
      API.getRoleInfo(this.currentId).then(res => {
        for (let i = 0; i < this.dataList.length; i++) {
          if (res.id === this.dataList[i].id) {
            this.dataList[i] = res
            break
          }
        }
      })
    }
  }
}
</script>
