<!--
	Desc: 	部门管理的编辑界面
	Author: caochaofeng
	Date: 	2019-04-10 15:43:22
-->

<template>
  <el-dialog
    :title="!dataForm.id ? '新增部门' : '修改部门'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form
      ref="dataForm"
      :model="dataForm"
      label-width="180px"
      @keyup.enter.native="dataFormSubmit()">

      <el-form-item :rules="$rulesFilter({required:true})" label="部门名称" prop="name">
        <el-input v-model="dataForm.name" placeholder="部门名称"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" :label="'上级部门'" prop="parentName" class="dept-list">
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
        <el-input v-popover:deptListPopover v-model="dataForm.parentName" :readonly="true" :placeholder="'上级部门'">
          <i
            v-if=" dataForm.parentId !== '0'"
            slot="suffix"
            class="el-icon-circle-close el-input__icon"
            @click.stop="deptListTreeSetDefaultHandle()"/>
        </el-input>
      </el-form-item>
      <el-form-item label="排序" prop="deptOrder">
        <el-input-number v-model="dataForm.deptOrder" :min="0"/>
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
import * as API from '@/api/sys/dept'

export default {
  mixins: [mixinFormViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getInfoAPI: API.info, // 数据详情列表接口，API地址
        addAPI: API.add, // 新增接口，API地址
        updateAPI: API.update // 修改接口，API地址
      },
      deptList: [],
      deptListVisible: false,
      dataForm: {
        id: '',
        name: '',
        parentId: '',
        parentName: '',
        deptOrder: 0
      }
    }
  },
  methods: {
    init(id) {
      this.dataForm.id = id || undefined
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        this.getDeptList().then(() => {
          if (this.dataForm.id) {
            this.getInfo()
          } else if (this.$store.state.user.superAdmin === 1) {
            this.deptListTreeSetDefaultHandle()
          }
        })
      })
    },

    // 获取部门列表
    getDeptList() {
      return API.treeList().then((res) => {
        if (res && res.code === 0) {
          this.deptList = res.data
        } else {
          this.deptList = []
          this.$message.error('部门数据获取失败：' + res.msg)
        }
      }).catch(() => {})
    },

    // 获取信息
    getInfo() {
      API.info(this.dataForm.id).then((res) => {
        if (res.code !== 0) {
          return this.$message.error(res.msg)
        }
        this.dataForm = {
          ...this.dataForm,
          ...res.data
        }
        if (this.dataForm.parentId === '0') {
          return this.deptListTreeSetDefaultHandle()
        }
        this.$refs.deptListTree.setCurrentKey(this.dataForm.parentId)
      }).catch(() => {})
    },
    // 上级部门树, 设置默认值
    deptListTreeSetDefaultHandle() {
      this.dataForm.parentId = '0'
      this.dataForm.parentName = '一级部门'
    },
    // 上级部门树, 选中
    deptListTreeCurrentChangeHandle(data) {
      console.log(data)
      this.dataForm.parentId = data.id
      this.dataForm.deptName = data.deptName
      this.deptListVisible = false
    },
    // 表单提交
    dataFormSubmit() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          var tick = !this.dataForm.id ? API.add(this.dataForm) : API.update(this.dataForm)
          tick.then((data) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.visible = false
                  this.$emit('refreshDataList')
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        }
      })
    }
  }
}
</script>
<style lang="scss">
  .mod-sys__dept {
    .dept-list {
      .el-input__inner,
      .el-input__suffix {
        cursor: pointer;
      }
    }
  }
</style>
