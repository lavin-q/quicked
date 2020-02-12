<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <el-button size="small" type="primary" v-if="hasPermission('sys:job:save')" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="hasPermission('sys:job:delete')" size="small" type="danger" @click="deleteHandle()"
                   :disabled="dataListSelections.length <= 0">批量删除
        </el-button>
        <el-button v-if="hasPermission('sys:job:pause')" size="small" type="warning" @click="pauseHandle()"
                   :disabled="dataListSelections.length <= 0">批量暂停
        </el-button>
        <el-button v-if="hasPermission('sys:job:resume')" size="small" type="primary" @click="resumeHandle()"
                   :disabled="dataListSelections.length <= 0">批量恢复
        </el-button>
        <el-button v-if="hasPermission('sys:job:run')" size="small" type="success" @click="runHandle()"
                   :disabled="dataListSelections.length <= 0">批量立即执行
        </el-button>
        <el-button v-if="hasPermission('sys:job:info')" size="small" type="success" @click="logHandle()">日志列表</el-button>
      </template>
    </searchbar>
    <el-table v-loading="dataListLoading"     @selection-change="dataListSelectionChangeHandle" :data="dataList" :height="tableHeight" border style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"

        width="50">
      </el-table-column>
      <el-table-column
        prop="beanName"
        header-align="center"
        align="center"
        label="bean名称">
      </el-table-column>
<!--      <el-table-column-->
<!--        prop="methodName"-->
<!--        header-align="center"-->
<!--        align="center"-->
<!--        label="方法名称">-->
<!--      </el-table-column>-->
      <el-table-column
        prop="params"
        header-align="center"
        align="center"
        label="参数">
      </el-table-column>
      <el-table-column
        prop="cronExpression"
        header-align="center"
        align="center"
        label="cron表达式">
      </el-table-column>
      <el-table-column
        show-overflow-tooltip
        prop="remark"
        header-align="center"
        align="center"
        label="备注">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" size="small">正常</el-tag>
          <el-tag v-else size="small" type="danger">暂停</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button v-if="hasPermission('sys:job:update')" type="text" size="small"
                     @click="addOrUpdateHandle(scope.row.id)">修改
          </el-button>
          <el-button v-if="hasPermission('sys:job:delete')" type="text" size="small"
                     @click="deleteHandle(scope.row.id)">删除
          </el-button>
          <el-button v-if="hasPermission('sys:job:pause')" type="text" size="small" @click="pauseHandle(scope.row.id)">
            暂停
          </el-button>
          <el-button v-if="hasPermission('sys:job:resume')" type="text" size="small"
                     @click="resumeHandle(scope.row.id)">恢复
          </el-button>
          <el-button v-if="hasPermission('sys:job:run')" type="text" size="small" @click="runHandle(scope.row.id)">
            立即执行
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
    import AddOrUpdate from './schedule-add-or-update'
    import mixinViewModule from '@/mixins/view-module'
    import Searchbar from '@/components/Searchbar'
    import * as API from '@/api/sys/schedule'
    export default {
        data () {
            return {
                mixinViewModuleOptions: {
                    getListAPI: API.getJobList,
                    delAPI: API.deleteJob
                },
                searchItems: {
                    normal: [
                        { name: '实体名称', field: 'beanName', type: 'text', dbfield: 'bean_name', dboper: 'cn' }
                    ]
                },
                logVisible: false
            }
        },
        components: {
            AddOrUpdate,
            Searchbar
        },
        mixins: [mixinViewModule],

        methods: {
            // 暂停
            pauseHandle (id) {
                let ids = id ? [id] : this.dataListSelections.map(item => {
                    return item.id
                })
                this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '暂停' : '批量暂停'}]操作?`, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    API.pauseJob(ids).then((data) => {
                        if (data && data.code === 0) {
                            this.$message({
                                message: data.msg,
                                type: 'success',
                                duration: 1500,
                                onClose: () => {
                                    this.getDataList()
                                }
                            })
                        }
                    })
                }).catch(() => {
                })
            },
            // 恢复
            resumeHandle (id) {
                let ids = id ? [id] : this.dataListSelections.map(item => {
                    return item.id
                })
                this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '恢复' : '批量恢复'}]操作?`, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    API.resumeJob(ids).then((data) => {
                        if (data && data.code === 0) {
                            this.$message({
                                message: data.msg,
                                type: 'success',
                                duration: 1500,
                                onClose: () => {
                                    this.getDataList()
                                }
                            })
                        }
                    })
                }).catch(() => {
                })
            },
            // 立即执行
            runHandle (id) {
                let ids = id ? [id] : this.dataListSelections.map(item => {
                    return item.id
                })
                this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '立即执行' : '批量立即执行'}]操作?`, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    API.runJob(ids).then((data) => {
                        if (data && data.code === 0) {
                            this.$message({
                                message: data.msg,
                                type: 'success',
                                duration: 1500,
                                onClose: () => {
                                    this.getDataList()
                                }
                            })
                        }else {

                        }
                    })
                }).catch(() => {
                })
            },
            // 日志列表
            logHandle () {
                this.$router.push({ path: '/log/schedulelog' })
            }
        }
    }
</script>
