<!--
	Desc: 	表管理的编辑界面
	Author: caochaofeng
	Date: 	2019-04-10 17:20:53
-->

<template>
  <el-dialog
    :title="'生成策略'"
    :close-on-click-modal="false"
    :append-to-body="true"
    width="60%"
    top="8vh"
    :visible.sync="visible">
    <el-form ref="dataForm" :model="dataForm" :size="size" label-width="120px" @keyup.enter.native="dataFormSubmit()">
      <el-form-item
        label="我要生成:">
        <el-checkbox-group v-model="moduleList">
          <el-checkbox label="backend">后端代码</el-checkbox>
          <el-checkbox label="View">前端VUE代码</el-checkbox>
          <el-checkbox label="uniapp">uniapp（包含小程序，android,IOS）</el-checkbox>
          <el-checkbox label="android">android原生代码</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item
        label="配置菜单:">
        <el-row>
          <el-col :span="8">
              <CrudSelect :dataList="topMenuList" v-model="dataForm.parentId" clearable filterable/>
          </el-col>
          <el-col :span="8">
            <el-input v-model="dataForm.name"/>
          </el-col>
          <el-col :span="8">
            <el-popover
              ref="iconListPopover"
              placement="bottom-start"
              trigger="click"
              popper-class="mod-menu__icon-popover">
              <div class="mod-menu__icon-list">
                <el-button
                  v-for="(item, index) in iconList"
                  :key="index"
                  :class="{ 'is-active': item === dataForm.icon }"
                  @click="iconActiveHandle(item)">
                  <svg-icon :icon-class="item"/>
                </el-button>
              </div>
            </el-popover>
            <el-input v-popover:iconListPopover v-model="dataForm.icon" :readonly="true" placeholder="菜单图标名称" class="icon-list__input"/>
          </el-col>
          <el-col :span="2" class="icon-list__tips">
            <el-tooltip placement="top" effect="light">
              <div slot="content">全站推荐使用SVG Sprite, 详细请参考:<a href="https://www.iconfont.cn" target="_blank">iconfont</a>描述</div>
              <i class="el-icon-warning"/>
            </el-tooltip>
          </el-col>
        </el-row>
      </el-form-item>
      <el-form-item :rules="[{required: true,message: '请输入生成代码路径'}]" label="生成代码路径"
                    prop="genPath">
        <el-input v-model="dataForm.genPath"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
    import * as API from '@/api/gen/table'
    import * as menuApi from '@/api/menu'
    import CrudSelect from '@/components/avue/crud-select'
    import CrudRadio from '@/components/avue/crud-radio'
    import Icon from '@/icons'
    export default {
        components: {CrudSelect, CrudRadio},
        data() {
            return {
                visible: false,
                tableContainerHeight: 0,
                moduleList: ["backend","View","uniapp","android"],
                topMenuList: [],
                iconList: [],
                dataForm: {
                    templateName: undefined,
                    parentId: undefined,
                    name: undefined,
                    icon: 'dashboard',
                    genPath: 'E:\\quickdGen/'
                }
            }
        },
        created() {
            this.iconList = Icon.getNameList()
        },
        methods: {
            init() {
                this.visible = true
                // 获取顶级菜单
                menuApi.listTopMenu().then(res => {
                    if (res.code == 0 && res.data) {
                        this.topMenuList = res.data
                    }
                })
            },
            // 图标选中
            iconActiveHandle(iconName) {
                this.dataForm.icon = iconName
            },
            // 表单提交
            dataFormSubmit() {
                this.$refs['dataForm'].validate((valid) => {
                    if (valid) {
                        this.dataForm.templateName = this.moduleList.join(",")
                        API.genCode(this.dataForm).then((data) => {
                            if (data && data.code === 0) {
                                this.$message({
                                    message: '生成项目成功',
                                    type: 'success',
                                    duration: 1500
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
