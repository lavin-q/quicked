<!--
	Desc: 	字典管理的编辑界面
	Author: caochaofeng
	Date: 	2019-04-10 17:20:53
-->

<template>
  <el-dialog
    v-loading="dialogLoading"
    :title="!dataForm.id ? '新增字典配置' : '修改字典配置'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form v-loading="formLoading" ref="dataForm" :model="dataForm" :size="size" label-width="100px" @keyup.enter.native="dataFormSubmit()">
      <el-form-item :rules="$rulesFilter({required:true})" label="名称" prop="itemText">
        <el-input v-model="dataForm.itemText" placeholder="名称"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" label="数据值" prop="itemValue">
        <el-input v-model="dataForm.itemValue" placeholder="数据值"/>
      </el-form-item>
      <el-form-item label="描述" prop="description">
        <el-input v-model="dataForm.description" placeholder="描述"/>
      </el-form-item>
      <el-form-item label="排序" prop="sortOrder">
        <el-input-number v-model="dataForm.sortOrder" :min="0" :max="999" controls-position="right"/> 值越小越靠前
      </el-form-item>
      <el-form-item label="是否启用" prop="status">
        <el-switch v-model="dataForm.status" :active-value="1" :inactive-value="0" active-text="是" inactive-text="否"/>
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
        getInfoAPI: API.infoOfDictItem, // 数据详情列表接口，API地址
        addAPI: API.addOfDictItem, // 新增接口，API地址
        updateAPI: API.updateOfDictItem // 修改接口，API地址
      },
      dataForm: {
        id: undefined,
        dictId: '',
        itemText: '',
        itemValue: '',
        description: '',
        sortOrder: '',
        status: 1
      }
    }
  },
  methods: {

  }
}
</script>
