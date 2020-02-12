<!--
	Desc: 	岗位管理的编辑界面
	Author: caochaofeng
	Date: 	2019-04-10 17:20:53
-->

<template>
  <el-dialog
    :title="!dataForm.id ? '新增岗位' : '编辑岗位'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form ref="dataForm" :model="dataForm" :size="size" label-width="100px" @keyup.enter.native="dataFormSubmit()">
      <el-form-item label="名称"  :rules="$rulesFilter({required:true})"  prop="name">
        <el-input v-model="dataForm.name"  style="width: 370px;"/>
      </el-form-item>
      <el-form-item label="排序" :rules="$rulesFilter({required:true})"  prop="sort">
        <el-input-number v-model.number="dataForm.sort" :min="0" :max="999" controls-position="right" style="width: 370px;"/>
      </el-form-item>
      <el-form-item  label="状态" prop="enabled">
        <CrudRadio :dataList="getDict('yn')" v-model="dataForm.enabled"/>
      </el-form-item>
      <el-form-item label="所属部门">
        <treeselect v-model="deptId" :options="deptList" style="width: 370px" placeholder="选择部门" />
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
    import * as API from '@/api/sys/job'
    import CrudRadio from '@/components/avue/crud-radio'
    import Treeselect from '@riophae/vue-treeselect'
    import '@riophae/vue-treeselect/dist/vue-treeselect.css'
    import * as $httpDept from '@/api/sys/dept'
    export default {
        components: {  CrudRadio,Treeselect },
        mixins: [mixinFormViewModule],
        data() {
            return {
                mixinViewModuleOptions: {
                    getInfoAPI: API.info, // 数据详情列表接口，API地址

                    addAPI: API.add, // 新增接口，API地址
                    updateAPI: API.update // 修改接口，API地址
                },
                deptList: [],
                deptId: null,
                dataForm: {
                    id: undefined,
                    dictCode: '',
                    dictName: '',
                    description: ''
                }
            }
        },
        methods: {
            initInfoBefore() {
                 $httpDept.treeList().then((res) => {
                    if (res.code !== 0) {
                        return this.$message.error(res.msg)
                    }
                    this.deptList = res.data
                }).catch(() => {
                })
            }

        }
    }
</script>
