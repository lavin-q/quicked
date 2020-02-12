<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
    </searchbar>
    <!--表格渲染-->
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;">
      <el-table-column
        prop="beanName"
        header-align="center"
        align="center"
        label="bean名称">
      </el-table-column>
      <el-table-column
        prop="params"
        header-align="center"
        align="center"
        label="参数">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" size="small">成功</el-tag>
          <el-tag v-else @click.native="showErrorInfo(scope.row.id)" size="small" type="danger"
                  style="cursor: pointer;">失败
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="times"
        header-align="center"
        align="center"
        label="耗时(单位: 毫秒)">
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        width="180"
        label="执行时间">
      </el-table-column>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
  </div>
</template>

<script>
    import mixinViewModule from '@/mixins/view-module'
    import Searchbar from '@/components/Searchbar'
    import * as API from '@/api/sys/schedule'
    export default {
        data () {
            return {
                visible: false,
                mixinViewModuleOptions: {
                    getListAPI: API.getJobLogList
                },
                searchItems: {
                    normal: [
                        { name: '实体名称', field: 'beanName', type: 'text', dbfield: 'bean_name', dboper: 'cn' }
                    ]
                },
            }
        },
        components: {
            Searchbar
        },
        mixins: [mixinViewModule],
        methods: {
            // 失败信息
            showErrorInfo (id) {
                API.getJobLogInfo(id).then((data) => {
                    if (data && data.code === 0) {
                        this.$alert(data.log.error)
                    }
                })
            }
        }
    }
</script>
