<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    width="60%"
    top="8vh">
    <el-form :model="dataForm" ref="dataForm" :size="size" @keyup.enter.native="dataFormSubmit()"
             label-width="100px">
      <el-form-item label="bean名称" :rules="$rulesFilter({required:true, trigger: 'blur'})" prop="beanName">
        <el-input v-model="dataForm.beanName" placeholder="spring bean名称, 如: testTask"></el-input>
      </el-form-item>
<!--      <el-form-item label="方法名称" :rules="$rulesFilter({required:true, trigger: 'blur'})" prop="methodName">-->
<!--        <el-input v-model="dataForm.methodName" placeholder="方法名称"></el-input>-->
<!--      </el-form-item>-->
      <el-form-item label="参数" :rules="$rulesFilter({required:true, trigger: 'blur'})" prop="params">
        <el-input v-model="dataForm.params" placeholder="参数"></el-input>
      </el-form-item>
      <el-form-item label="cron表达式" prop="cronExpression">
        <el-row>
          <el-col :span="22">
            <el-input v-model="dataForm.cronExpression" placeholder="如: 0 0 12 * * ?"></el-input>
          </el-col>
          <el-col :span="2" class="icon-list__tips">
            <el-tooltip placement="top" effect="light">
              <div slot="content"><a href="http://cron.qqe2.com/" target="_blank">在线Cron表达式生成器</a>
              </div>
              <i class="el-icon-warning"/>
            </el-tooltip>
          </el-col>
        </el-row>
      </el-form-item>
      <el-form-item label="备注" prop="remark">
        <el-input v-model="dataForm.remark" placeholder="备注"></el-input>
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
    import * as API from '@/api/sys/schedule'

    export default {
        mixins: [mixinFormViewModule],
        data() {
            return {
                visible: false,
                dataForm: {
                    id: 0,
                    beanName: '',
                    methodName: '',
                    params: '',
                    cronExpression: '',
                    remark: '',
                    status: 0
                },
                mixinViewModuleOptions: {
                    getInfoAPI: API.getJobLogInfo, // 数据详情列表接口，API地址
                    addAPI: API.addJob, // 新增接口，API地址
                    updateAPI: API.updJob // 修改接口，API地址
                }
            }
        }
    }
</script>
