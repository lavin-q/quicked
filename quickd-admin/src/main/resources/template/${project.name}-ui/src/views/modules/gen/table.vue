<template>
  <div class="app-main-content" v-loading="formLoading">
    <el-row>
      <el-col :span="4">
        <el-input :placeholder="'表名搜索'"
                  class="filter-item" clearable v-model="tableQuery "/>
        <el-table @cell-click="rowClick" v-loading="dataListLoading"
                  :data="dataList.filter(data => !tableQuery || data.TABLE_NAME.toLowerCase().includes(tableQuery.toLowerCase()))"
                  :height="tableHeight" border
                  highlight-current-row
                  style="width: 100%;">
          <el-table-column align="center" prop="tableName" label="表名" >
            <template slot-scope="scope">
              {{scope.row.TABLE_NAME }}
            </template>
          </el-table-column>
        </el-table>
      </el-col>
      <el-col :span="20">
        <div style=" float: right;padding: 5px;">
          <el-button :disabled="!curTableName" @click="addOrUpdateColumnHandle()" size="medium" type="primary">保存配置</el-button>
          <el-button :disabled="!curTableName" @click="addOrUpdateHandle()" size="medium" type="success">代码生成</el-button>
        </div>
        <el-table
          :data="columnList"
          :height="tableHeight"
          :style="'width:100%;height:'+tableHeight"
          border
        >
          <el-table-column
            label="列名"
            prop="colName"/>
          <el-table-column
            width="150"
            label="说明">
            <template slot-scope="scope">
              <el-input v-model="scope.row.fieldLabel" size="small"/>
            </template>
          </el-table-column>

          <el-table-column
            label="不可空"
            width="50" >
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isNotNull"/>
            </template>
          </el-table-column>
          <el-table-column
            label="插入"
            width="50"
          >
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isInsert"/>
            </template>
          </el-table-column>
          <el-table-column
            label="编辑"

            width="50"
          >
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isEdit"/>
            </template>
          </el-table-column>
          <el-table-column
            label="列表"
            width="50"
          >
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isList"/>
            </template>
          </el-table-column>
          <el-table-column
            label="查询"
            width="50"
          >
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isQuery"/>
            </template>
          </el-table-column>
          <el-table-column
            label="查询方式"
            width="120"
          >
            <template slot-scope="scope">
              <el-select v-model="scope.row.queryType" clearable filterable placeholder="请输入" size="small">
                <el-option
                  v-for="item in queryTypeList"
                  :title="item.label"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  style="width:120px"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
            label="表单类型"
            width="120"
          >
            <template slot-scope="scope">
              <el-select v-model="scope.row.formType" clearable filterable placeholder="请输入" size="small">
                <el-option
                  v-for="item in formTypeList"
                  :title="item.label"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  style="width:100px"/>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column
            label="字典类型"
            width="120"
          >
            <template slot-scope="scope">
              <el-input v-model="scope.row.dictType" size="small"/>
            </template>
          </el-table-column>

          <el-table-column
            label="关联表"
            v-if="refShow"
            width="150"
          >
            <template slot-scope="scope">
              <el-select v-model="scope.row.refTable" width="180" @change="changeRefTable" clearable filterable
                         placeholder="请输入" size="small">
                <el-option
                  v-for="item in tableSelectList"
                  :title="item.label"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  style="width:120px"/>
              </el-select>
            </template>
          </el-table-column>

          <el-table-column
            label="关联字段"
            v-if="refShow"
            width="150"
          >
            <template slot-scope="scope">
              <el-select v-model="scope.row.refColumn" clearable filterable placeholder="请输入" size="small">
                <el-option
                  v-for="item in columnSelectList"
                  :title="item.label"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                  style="width:120px"/>
              </el-select>
            </template>
          </el-table-column>


          <el-table-column
            label="排序"
            width="60"
          >
            <template slot-scope="scope">
              <el-input v-model="scope.row.sort" size="small"/>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate"/>
  </div>

</template>

<script>
    import * as API from '@/api/gen/table'
    import * as Tool from '@/utils/tool'
    import AddOrUpdate from './table-add-or-update'

    export default {
        name: "Table",
        components: {
            AddOrUpdate
        },
        data() {
            return {
                // 新增编辑dialog
                addOrUpdateVisible: false,    // 新增／更新，弹窗visible状态
                curTableName: null,
                curTableComment: '',
                tableQuery: '',
                tableSelectList: [],
                columnSelectList: [],
                dataList: [],
                refShow: true,
                columnList: [],
                tableHeight: Tool.getClientHeight() - 160,
                dataListLoading: false,     // 表数据列表，loading状态
                columnListLoading: false,     // 列数据列表，loading状态
                formLoading: false,       // form表单loading状态
                javaTypeList: [
                    {'value': 'String', 'label': 'String'},
                    {'value': 'Long', 'label': 'Long'},
                    {'value': 'Integer', 'label': 'Integer'},
                    {'value': 'Double', 'label': 'Double'},
                    {'value': 'java.util.Date', 'label': 'java.util.Date'},
                    {'value': 'com.quickd.sys.entity.User', 'label': 'User'},
                    {'value': 'com.quickd.sys.entity.Dept', 'label': 'Dept'},
                ],
                queryTypeList: [
                    {'value': "eq", 'label': "="},
                    {'value': "ne", 'label': "!="},
                    {'value': "gt;", 'label': "&gt;"},
                    {'value': "ge", 'label': "&gt;="},
                    {'value': "lt", 'label': "&lt;"},
                    {'value': "le", 'label': "&lt;="},
                    {'value': "bt", 'label': "Between"},
                    {'value': "cn", 'label': "Like"},
                    {'value': "bw", 'label': "Left Like"},
                    {'value': "ew", 'label': "Right Like"}
                ],
                formTypeList: [
                    {'value': 'input', 'label': '增删改查（单表）'},
                    {'value': 'input', 'label': '单行文本'},
                    {'value': 'textarea', 'label': '多行文本'},
                    {'value': 'select', 'label': '下拉选项'},
                    {'value': 'radio', 'label': '单选按钮'},
                    {'value': 'checkbox', 'label': '复选框'},
                    {'value': 'dateselect', 'label': '日期选择'},
                    {'value': 'userselect', 'label': '人员选择'},
                    {'value': 'orgselect', 'label': '部门选择'},
                    {'value': 'treeselect', 'label': '树选择控件'},
                    {'value': 'fileselect', 'label': '文件上传选择'},
                    {'value': 'imageselect', 'label': '图片上传选择'}
                ],
            };
        },
        mounted() {
            this.getDataList()
        },
        methods: {

            // 新增 / 修改
            addOrUpdateHandle() {
                this.addOrUpdateVisible = true
                this.$nextTick(() => {
                    if (this.curTableName) {
                        this.$refs.addOrUpdate.dataForm.tableName = this.curTableName
                        this.$refs.addOrUpdate.dataForm.name = this.curTableComment
                        this.$refs.addOrUpdate.init()
                    } else {
                        this.$message.info("请选择表")
                    }

                })
            },
            getDataList() {
                const _this = this
                this.dataListLoading = true
                API.tableList().then(response => {
                    if (response && response.code === 0) {
                        _this.dataList = response.data
                    } else {
                        _this.dataList = []
                    }
                    this.dataList.forEach(item => {
                        this.tableSelectList.push({'value': item.TABLE_NAME, 'label': item.TABLE_NAME})
                    })
                    _this.dataListLoading = false
                }).catch(() => {
                    _this.dataListLoading = false
                })
            },
            rowClick(row, column, cell, event) {
                this.curTableName = row.TABLE_NAME
                this.curTableComment = row.TABLE_COMMENT
                this.getTableColumns(this.curTableName)
            },
            getTableColumns(tableName) {
                this.columnListLoading = true
                API.listTableColumn({"tableName": tableName}).then(response => {
                    if (response && response.code === 0) {
                        this.columnList = response.data
                    } else {
                        this.columnList = []
                    }

                    this.columnListLoading = false
                }).catch(() => {
                    this.columnListLoading = false
                })
            },
            addOrUpdateColumnHandle() {
                const _this = this
                const title = `确定要生成配置吗?`
                this.$confirm(title, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.formLoading = true
                    API.updateColumn(this.columnList).then(data => {
                        if (data && data.code === 0) {
                            this.$message({
                                message: '操作成功',
                                type: 'success',
                                duration: 1500,
                                onClose: () => {
                                    this.getTableColumns(this.curTableName)
                                }
                            })
                        } else {
                            this.$message.error(data.msg)
                        }
                        _this.formLoading = false
                    }).catch(() => {
                        _this.formLoading = false
                    })
                })
            },
            changeRefTable(tableName) {
                API.columnSelect({"tableName": tableName}).then(response => {
                    if (response && response.code === 0) {
                        this.columnSelectList = response.data
                    } else {
                        this.columnSelectList = []
                    }
                }).catch(() => {
                })

            }
        }
    };
</script>
