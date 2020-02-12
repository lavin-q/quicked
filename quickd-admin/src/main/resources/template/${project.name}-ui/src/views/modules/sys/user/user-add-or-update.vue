<template>
  <el-dialog
    v-loading="dialogLoading"
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form v-loading="formLoading" ref="dataForm" :model="dataForm" :size="size" label-width="180px" @keyup.enter.native="dataFormSubmit()">
      <el-form-item :rules="$rulesFilter({required:true})" label="用户账号" prop="username">
        <el-input v-model="dataForm.username" placeholder="用户账号"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" label="用户名称" prop="realName">
        <el-input v-model="dataForm.realName" placeholder="名称"/>
      </el-form-item>
      <el-form-item :label="'密码'" :class="{ 'is-required': !dataForm.id }" :rules="$rulesFilter({required:true})" prop="password">
        <el-input v-model="dataForm.password" type="password" placeholder="密码"/>
      </el-form-item>
      <el-form-item :class="{ 'is-required': !dataForm.id }" :rules="$rulesFilter({required:true,validator:validateComfirmPassword})" label="确认密码" prop="comfirmPassword" >
        <el-input v-model="dataForm.comfirmPassword" type="password" placeholder="确认密码"/>
      </el-form-item>
      <el-form-item :label="'所属部门'" :rules="$rulesFilter({required:true})" prop="deptName" class="dept-list">
        <el-popover ref="deptListPopover" v-model="deptListVisible" placement="bottom-start" trigger="click">
          <el-tree
            ref="deptListTree"
            :data="deptList"
            :props="{ label: 'deptName', children: 'children' }"
            :highlight-current="true"
            :expand-on-click-node="false"
            node-key="id"
            accordion
            @current-change="deptListTreeCurrentChangeHandle"/>
        </el-popover>
        <el-input
          v-popover:deptListPopover
          v-model="dataForm.deptName"
          :readonly="true"
          :placeholder="'所属部门'"/>
      </el-form-item>
      <el-form-item label="角色" size="mini" prop="roleIdList">
        <el-checkbox-group v-model="dataForm.roleIdList">
          <el-checkbox v-for="role in roleList" :key="role.id" :label="role.id">{{ role.roleName }}</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="状态" size="mini" prop="status">
        <el-switch v-model="dataForm.status" active-value="1" inactive-value="0" active-text="正常" inactive-text="禁用"/>
      </el-form-item>
      <el-form-item label="是否是超级管理员" size="mini" prop="mgrType">
        <el-radio-group v-model="dataForm.mgrType">
          <el-radio label="0">非管理员</el-radio>
          <el-radio label="1">系统管理员</el-radio>
          <el-radio label="2">二级管理员</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import mixinFormViewModule from '@/mixins/form-view-module'
import * as API from '@/api/sys/user'
import * as $httpRole from '@/api/sys/role'
import * as $httpDept from '@/api/sys/dept'

export default {
  mixins: [mixinFormViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getInfoAPI: API.getUserInfo, // 数据详情列表接口，API地址

        addAPI: API.addUser, // 新增接口，API地址
        updateAPI: API.updUser // 修改接口，API地址
      },

      dataForm: {
        id: 0,
        username: '',
        password: '',
        comfirmPassword: '',
        realName: '',
        // mobile: '',
        roleIdList: [],
        deptId: '0',
        deptName: '',
        status: '1',
        mgrType: '',
        orgCode: ''
      },

      roleList: [], // 角色列表
      deptList: [], // 部门树
      deptListVisible: false

    }
  },
  methods: {
    validateComfirmPassword(rule, value, callback) {
      if (!this.dataForm.id && !/\S/.test(value)) {
        callback(new Error('确认密码不能为空'))
      } else if (this.dataForm.password !== value) {
        callback(new Error('确认密码与密码输入不一致'))
      } else {
        callback()
      }
    },

    initInfoBefore(id) {
      this.getDeptList() // 获取部门数据
      $httpRole.getRoleList().then(response => {
        this.roleList = response && response.code === 0 ? response.data.list : []
      })
    },

    initInfoAfter(id, data) {
      this.dataForm.deptId = data.deptId
      this.dataForm.deptName = data.deptName
    },

    // 上级部门树, 选中
    deptListTreeCurrentChangeHandle(data) {
      this.dataForm.deptId = data.id
      this.dataForm.deptName = data.deptName
      this.dataForm.orgCode = data.orgCode
      this.deptListVisible = false
    },
    // 获取部门列表
    getDeptList() {
      return $httpDept.treeList().then((res) => {
        if (res.code !== 0) {
          return this.$message.error(res.msg)
        }
        this.deptList = res.data
      }).catch(() => {
      })
    },

    // 格式化表单提交的数据
    formatSubmitData(data) {
      const postData = data
      delete postData.comfirmPassword
      return postData
    }

  }
}
</script>
