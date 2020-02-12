<!--
	Desc: 	字典管理的编辑界面
	Author: caochaofeng
	Date: 	2019-04-10 17:20:53
-->

<template>
  <el-dialog
    :title="!dataForm.id ? '新增字典' : '修改字典'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form ref="dataForm" :model="dataForm" :size="size" label-width="100px" @keyup.enter.native="dataFormSubmit()">
      <el-form-item :rules="$rulesFilter({required:true})" label="字典编号" prop="dictCode">
        <el-input v-model="dataForm.dictCode" placeholder="字典编号"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" label="字典名称" prop="dictName">
        <el-input v-model="dataForm.dictName" placeholder="字典名称"/>
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input v-model="dataForm.description" placeholder="描述"/>
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
import * as API from '@/api/sys/dict'

export default {
  mixins: [mixinFormViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getInfoAPI: API.info, // 数据详情列表接口，API地址

        addAPI: API.add, // 新增接口，API地址
        updateAPI: API.update // 修改接口，API地址
      },
      dataForm: {
        id: undefined,
        dictCode: '',
        dictName: '',
        description: ''
      }
    }
  },
  methods: {

  }
}
</script>
