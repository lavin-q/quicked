<!--
	Desc: 	通知管理的编辑界面
	Author: caochaofeng
	Date: 	2019-04-10 17:20:53
-->

<template>
  <el-dialog
    v-loading="dialogLoading"
    :title="!dataForm.id ? '新增通知' : '修改通知'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="80%"
    top="8vh">
    <el-form
      v-loading="formLoading"
      ref="dataForm"
      :model="dataForm"
      :size="size"
      label-width="120px"
      @submit.native.prevent>
      <el-form-item :rules="$rulesFilter({required:true})" label="标题" prop="titile">
        <el-input v-model="dataForm.titile" placeholder="标题"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" label="消息类型" prop="msgCategory">
        <crud-radio :dataList="getDict('notice_msgCategory')" v-model="dataForm.msgCategory"/>
      </el-form-item>
      <el-form-item label="内容" prop="msgContent">
        <div ref="editor" style="text-align:left;margin: 5px"/>
      </el-form-item>
      <el-form-item label="开始时间" prop="startTime">
        <el-date-picker v-model="dataForm.startTime" type="date" value-format="yyyy-MM-dd" placeholder="选择开始时间" clearable/>
      </el-form-item>
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker v-model="dataForm.endTime" type="date" value-format="yyyy-MM-dd" placeholder="选择结束时间" clearable/>
      </el-form-item>
      <el-form-item label="优先级" prop="priority">
        <CrudSelect :dic="getDict('notice_priority')" v-model="dataForm.priority"/>
      </el-form-item>
      <el-form-item :rules="$rulesFilter({required:true})" label="通告对象类型" prop="msgType">
        <CrudSelect :dataList="getDict('notice_msgType')" v-model="dataForm.msgType"/>
      </el-form-item>
      <el-form-item v-if="dataForm.msgType === 'USER' " label="指定用户" prop="userIds">
        <el-select v-model="dataForm.userIds" multiple placeholder="请选择指定用户" @click.native="selectUserIds">
          <el-option
            v-for="item in selectedUserList"
            :key="item.value"
            :label="item.label"
            :value="item.value"/>
        </el-select>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
    <!-- 弹窗, 新增 / 修改 -->
    <select-user-list-modal v-if="userListModalVisible" ref="userListModal" @choseUser="choseUser"/>
  </el-dialog>
</template>

<script>
import mixinFormViewModule from '@/mixins/form-view-module'
import dataDictionary from '@/mixins/data-dictionary'
import CrudSelect from '@/components/avue/crud-select'
import CrudRadio from '@/components/avue/crud-radio'
import E from 'wangeditor'
import { getToken } from '@/utils/auth'
import * as Tool from '@/utils/tool'
import * as API from '@/api/sys/notice'
import * as API_USER from '@/api/sys/user'
import { uploadImages } from '@/api/common'
import SelectUserListModal from '../user/select-user-list-modal'

export default {
  components: { CrudSelect, CrudRadio, SelectUserListModal },
  mixins: [mixinFormViewModule, dataDictionary],
  data() {
    return {
      mixinViewModuleOptions: {
        getInfoAPI: API.info, // 数据详情列表接口，API地址
        addAPI: API.add, // 新增接口，API地址
        updateAPI: API.update // 修改接口，API地址
      },
      dataForm: {
        id: 0,
        titile: '',
        msgCategory: '',
        msgContent: '',
        startTime: '',
        endTime: '',
        priority: '', // 优先级
        msgType: '', // 通告对象类型
        userIds: '', // 指定用户
        sendTime: Tool.formatDate(new Date(), 'yyyy-MM-dd HH-mm-ss')
      },
      headers: {
        'token': getToken()
      },
      uploadImages: uploadImages,
      editor: null,
      selectedUserList: [],
      userListModalVisible: false
    }
  },
  methods: {
    initInfoBefore() {
      this.$nextTick(() => {
        if (!this.editor) {
          this.initEditor()
        }
        this.selectedUserList = []
        this.userIds = []
      })
    },

    initInfoAfter(id, data) {
      if (this.editor) {
        this.editor.txt.html(data.msgContent)
        if (data.userIds.length > 0) {
          this.getUser(data.userIds)
          // TODO
          this.dataForm.userIds = eval(this.dataForm.userIds)
        }
      }
    },

    // 用户用户信息
    // TODO 待修改
    getUser(userIds) {
      const _this = this
      this.selectedUserList = []
      const ids = eval(userIds)
      if (ids.length > 0) {
        ids.forEach(item => {
          API_USER.getUserInfo(item).then(res => {
            if (res && res.code === 0) {
            // 待修改
              _this.selectedUserList.push({ label: res.data.realName, value: res.data.id })
            // res.data.forEach(item => {
            //   _this.selectedUserList.push({ label: item.realName, value: item.id })
            // })
            }
          }).catch((error) => {
            console.log(error)
          })
        })
      }
    },
    // 初始化编辑器
    initEditor() {
      const _this = this
      this.editor = new E(this.$refs.editor)
      this.editor.customConfig.uploadImgShowBase64 = true // 使用 base64 保存图片
      // 不可修改
      this.editor.customConfig.uploadImgHeaders = this.headers
      // 自定义文件名，不可修改，修改后会上传失败
      this.editor.customConfig.uploadFileName = 'file'
      this.editor.customConfig.uploadImgServer = this.uploadImages // 上传图片到服务器
      this.editor.customConfig.onchange = (html) => {
        _this.dataForm.msgContent = html
      }
      this.editor.create()
    },
    // 新增、修改通知，提交格式
    formatSubmitData(postData) {
      const temp = postData
      if (temp.msgType === 'ALL') {
        temp.userIds = []
      }
      return temp
    },
    // 选择指定用户
    selectUserIds() {
      this.userListModalVisible = true
      this.$nextTick(() => {
        this.$refs.userListModal.selected(this.dataForm.userIds)
      })
    },

    // 选择完毕用户列表
    choseUser(userList) {
      this.selectedUserList = []
      this.userIds = []
      for (var i = 0; i < userList.length; i++) {
        const item = userList[i]
        this.selectedUserList.push({ label: item.realName, value: item.id })
        this.dataForm.userIds.push(item.id)
      }
    }
  }
}
</script>
