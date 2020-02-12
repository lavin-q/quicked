<template>
  <el-dialog
    v-loading="dialogLoading"
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form v-loading="formLoading" ref="dataForm" :model="dataForm" :size="size" label-width="80px"
             @keyup.enter.native="dataFormSubmit()">
      <el-form-item :rules="$rulesFilter({required:true})" label="角色名称" prop="roleName">
        <el-input v-model="dataForm.roleName" placeholder="角色名称"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" label="角色编码" prop="roleCode">
        <el-input v-model="dataForm.roleCode" placeholder="角色编码"/>
      </el-form-item>
      <el-form-item label="备注" prop="remarks">
        <el-input v-model="dataForm.remarks" type="textarea" placeholder="备注"/>
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
    import * as API from '@/api/sys/role'

    export default {
        mixins: [mixinFormViewModule],
        data() {
            return {
                mixinViewModuleOptions: {
                    getInfoAPI: API.getRoleInfo, // 数据详情列表接口，API地址

                    addAPI: API.addRole, // 新增接口，API地址
                    updateAPI: API.updRole // 修改接口，API地址
                },
                dataForm: {
                    id: 0,
                    roleName: '',
                    roleCode: '',
                    remarks: ''
                }
            }
        },
        methods: {}
    }
</script>
