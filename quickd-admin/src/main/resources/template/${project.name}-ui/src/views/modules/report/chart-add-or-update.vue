<!--
	Desc: 	图表配置的编辑界面
-->

<template>
  <el-dialog
    :title="!dataForm.id ? '新增图表配置' : '修改图表配置'"
    :close-on-click-modal="false"
    :append-to-body="true"
    :visible.sync="visible"
    :fullscreen="true"
    width="80%"
    top="8vh">
    <el-form v-loading="formLoading" ref="dataForm" :model="dataForm" :size="size" label-width="100px" @keyup.enter.native="dataFormSubmit()">
      <el-row :gutter="20">
        <el-col :xs="24" :sm="12" :md="8" :lg="6">
          <el-form-item :rules="$rulesFilter({required:true})" label="图表名称" prop="name">
            <el-input v-model="dataForm.name" placeholder="图表名称"/>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="8" :lg="6">
          <el-form-item :rules="$rulesFilter({required:true})" label="编码" prop="code">
            <el-input v-model="dataForm.code" placeholder="编码"/>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="8" :lg="6">
          <el-form-item label="展示模板" prop="templateType">
            <el-select v-model="dataForm.templateType" placeholder="请选择展示模板" clearable>
              <el-option v-for="(item,index) in getDict('templateTypes')" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"/>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="8" :lg="6">
          <el-form-item :rules="$rulesFilter({required:true})" label="X轴字段" prop="x">
            <el-input v-model="dataForm.x" placeholder="X轴字段"/>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="16" :lg="12">
          <el-form-item :rules="$rulesFilter({required:true})" label="Y轴字段" prop="y">
            <el-select v-model="dataForm.y" multiple allow-create filterable default-first-option placeholder="Y轴字段"/>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="8" :lg="6">
          <el-form-item label="数据类型" prop="dataType">
            <el-select v-model="dataForm.dataType" placeholder="请选择数据类型" clearable>
              <el-option v-for="(item,index) in getDict('dataSourceTypes')" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"/>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="16" :lg="6">
          <el-form-item label="图表类型" prop="chartType">
            <el-select v-model="dataForm.chartType" placeholder="请选择图表类型" clearable multiple>
              <el-option v-for="(item,index) in getDict('chartTypes')" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"/>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24">
          <el-form-item label="描述" prop="description">
            <el-input v-model="dataForm.description" placeholder="描述"/>
          </el-form-item>
        </el-col>
        <el-col v-if="dataForm.dataType==='SQL'" :xs="24" :sm="24" :md="24" :lg="24">
          <el-form-item :rules="$rulesFilter({required:true})" label="查询SQL" prop="sql">
            <code-edit v-model="dataForm.sql" height="200"/>
          </el-form-item>
        </el-col>
        <el-col v-else :xs="24" :sm="24" :md="24" :lg="24">
          <el-form-item :rules="$rulesFilter({required:true})" label="数据JSON" prop="json">
            <code-edit v-model="dataForm.json" height="200"/>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <el-tabs>
      <el-tab-pane label="列表字段">
        <div class="button-row">
          <el-button :size="size" type="primary" icon="el-icon-plus" @click="add">新增</el-button>
          <el-button v-show="dataListSelections.length > 0" :size="size" type="primary" icon="el-icon-minus" @click="del">删除</el-button>
        </div>
        <el-table v-loading="dataListLoading" :data="dataList" border style="width: 100%;" @selection-change="dataListSelectionChangeHandle">
          <el-table-column type="selection" header-align="center" align="center" width="50"/>
          <el-table-column type="index" header-align="center" align="center" width="50"/>
          <el-table-column prop="name" header-align="center" align="center" label="字段名">
            <template slot-scope="scope">
              <el-input v-model="scope.row.name" :size="size" placeholder="字段名"/>
            </template>
          </el-table-column>
          <el-table-column prop="text" header-align="center" align="center" label="字段文本">
            <template slot-scope="scope">
              <el-input v-model="scope.row.text" :size="size" placeholder="字段文本"/>
            </template>
          </el-table-column>
          <el-table-column prop="order" header-align="center" align="center" label="排序">
            <template slot-scope="scope">
              <el-input v-model="scope.row.text" :size="size" type="number" placeholder="排序"/>
            </template>
          </el-table-column>
          <el-table-column prop="fieldType" header-align="center" align="center" label="字段类型">
            <template slot-scope="scope">
              <el-select v-model="scope.row.fieldType" :size="size" placeholder="请选择" clearable>
                <el-option v-for="(item,index) in getDict('fieldTypes')" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column prop="isShow" header-align="center" align="center" label="是否显示">
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isShow" :size="size" />
            </template>
          </el-table-column>
          <el-table-column prop="isCalculate" header-align="center" align="center" label="计算总计">
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isCalculate" :size="size" />
            </template>
          </el-table-column>
          <el-table-column prop="isQuery" header-align="center" align="center" label="是否查询">
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isQuery" :size="size" />
            </template>
          </el-table-column>
          <el-table-column prop="queryMode" header-align="center" align="center" label="查询模式">
            <template slot-scope="scope">
              <el-select v-model="scope.row.searchType" :size="size" placeholder="请选择" clearable >
                <el-option v-for="(item,index) in getDict('queryModes')" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column prop="code" header-align="center" align="center" label="字典Code">
            <template slot-scope="scope">
              <el-input v-model="scope.row.code" :size="size" placeholder="字典Code" />
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
    </el-tabs>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import mixinFormViewModule from '@/mixins/form-view-module'
import dataDictionary from '@/mixins/data-dictionary'
import CodeEdit from '@/components/CodeEdit'
import * as API from '@/api/sys/dict'

export default {
  components: {
    CodeEdit
  },
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
        name: '',
        code: '',
        x: '',
        y: '',
        templateType: '',
        dataType: 'SQL',
        chartType: '',
        description: '',
        sql: '',
        json: ''
      },

      dataList: [ // 数据列表
        {
          name: '',
          text: '',
          order: 1,
          fieldType: '',
          isShow: true,
          isCalculate: false,
          isQuery: false,
          code: ''
        }
      ],
      dataListLoading: false, // 数据列表，loading状态
      dataListSelections: [] // 数据列表，多选项
    }
  },
  created() {
    this.initDictMap('templateTypes') // 用于获取展示模板风格
  },
  methods: {
    // 多选
    dataListSelectionChangeHandle(val) {
      this.dataListSelections = val
    },

    init(id) {
      this.dataForm.id = id || undefined
      this.visible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
        if (this.dataForm.id) {
          if (this.mixinViewModuleOptions.getInfoAPI) {
            this.formLoading = true
            this.mixinViewModuleOptions.getInfoAPI(this.dataForm.id).then((res) => {
              this.formLoading = false
              if (res && res.code === 0) {
                this.dataForm = res.data
                // this.dataList = res.data
              } else {
                this.$message.error(res.msg)
              }
            }).catch(error => {
              this.formLoading = false
              console.log(error)
            })
          }
        }
      })
    },

    add() {
      this.dataList.push({
        name: '',
        text: '',
        order: 1,
        fieldType: '',
        isShow: true,
        isCalculate: false,
        isQuery: false,
        code: ''
      })
    },

    del() {
      console.log(this.dataListSelections)
    }
  }
}
</script>
