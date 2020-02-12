<template>
  <div class="app-main-content" style="overflow: scroll;">
    <el-form ref="dataForm" :model="dataForm" label-width="120px" @keyup.enter.native="dataFormSubmit()">
      <el-row :gutter="24">
        <el-col :span="12">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>项目配置：</span>
            </div>

            <el-form-item
              :rules="[{required: true,message: '项目分组'}]"
              label="项目分组"
              prop="groupName">
              <el-input v-model="dataForm.groupName"/>
            </el-form-item>

            <el-form-item
              :rules="[{required: true,message: '项目中文名称'}]"
              label="项目中文名称"
              prop="sysName">
              <el-input v-model="dataForm.sysName"/>
            </el-form-item>

            <el-form-item
              :rules="[{required: true,message: '项目英文名称'}]"
              label="项目英文名称"
              prop="project">
              <el-input v-model="dataForm.project"/>
            </el-form-item>
            <el-form-item
              :rules="[{required: true,message: '项目作者'}]"
              label="项目作者"
              prop="author">
              <el-input v-model="dataForm.author"/>
            </el-form-item>
            <el-form-item
              :rules="[{required: true,message: 'copyright'}]"
              label="copyright"
              prop="copyright">
              <el-input v-model="dataForm.copyright"/>
            </el-form-item>

            <el-form-item :rules="[{required: true,message: '请输入生成代码路径'}]" label="生成代码路径"
                          prop="genPath">
              <el-input v-model="dataForm.genPath"></el-input>
            </el-form-item>
            <el-form-item
              label="集成组件:">
              <el-checkbox-group v-model="componentList">
                <el-checkbox label="redis"></el-checkbox>
                <el-checkbox label="mongo"></el-checkbox>
                <el-checkbox label="activiti"></el-checkbox>
                <el-checkbox label="quartz"></el-checkbox>
<!--                <el-checkbox label="mq"></el-checkbox>-->
                <el-checkbox label="oss"></el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>mysql数据库连接信息：</span>
            </div>
            <el-form-item
              :rules="[{required: true,message: '数据库地址不能为空'}]"
              label="数据库地址"
              prop="dbUrl">
              <el-input v-model="dataForm.dbUrl"/>
            </el-form-item>
            <el-form-item
              :rules="[{required: true,message: '数据库端口不能为空'}]"
              label="数据库端口"
              prop="dbPort">
              <el-input v-model="dataForm.dbPort"/>
            </el-form-item>
            <el-form-item
              :rules="[{required: true,message: '数据库用户名不能为空'}]"
              label="数据库用户名"
              prop="dbUsername">
              <el-input v-model="dataForm.dbUsername"/>
            </el-form-item>
            <el-form-item
              :rules="[{required: true,message: '数据库密码不能为空'}]"
              label="数据库密码"
              prop="dbPassword">
              <el-input v-model="dataForm.dbPassword"/>
            </el-form-item>

            <el-form-item
              :rules="[{required: true,message: '数据库名不能为空'}]"
              label="数据库名"
              prop="dbName">
              <el-input v-model="dataForm.dbName"/>
            </el-form-item>
            <el-form-item
              label-width="180px"
              label="初始化数据库和表">
              <el-switch
                v-model="dataForm.isInitDb"
                active-text="是"
                inactive-text="否">
              </el-switch>
            </el-form-item>
          </el-card>
        </el-col>
      </el-row>

    </el-form>
    <p style="text-align:center">
      <el-button type="primary" style="width: 200px;" @click="dataFormSubmit()">生成项目</el-button>
    </p>
  </div>
</template>
<script>
    import * as API from '@/api/gen/project'

    export default {
        data() {
            return {
                visible: false,
                componentList: ["redis"],
                dataForm: {
                    id: 0,
                    project: 'quickd',
                    groupName: 'com.quickd',
                    copyright: 'www.iquickd.com',
                    author: 'quickd',
                    dbUrl: '127.0.0.1',
                    dbPort: '3306',
                    dbName: 'quickd',
                    dbUsername: 'root',
                    dbPassword: '123456',
                    components: '',
                    isInitDb: true,
                    sysName: '企业级快速开发平台',
                    genPath: '/data/project',
                }
            }
        },
        methods: {
            // 表单提交
            dataFormSubmit() {
                this.$refs['dataForm'].validate((valid) => {
                    if (valid) {
                        this.dataForm.components = this.componentList.join(",")
                        API.genCode(this.dataForm).then((data) => {
                            if (!data) {
                                return;
                            }
                            let url = window.URL.createObjectURL(new Blob([data]));
                            let link = document.createElement('a');
                            link.style.display = 'none';
                            link.href = url;
                            link.setAttribute('download',  `quickd.zip`);
                            document.body.appendChild(link);
                            link.click();
                        })
                    }
                })
            }
        }
    }
</script>
