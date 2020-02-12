<template>
  <div class="app-main-content">
    <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
      <template slot="button">
        <el-button size="small" type="primary" @click="addOrUpdateHandle()">新增</el-button>
      </template>
    </searchbar>
    <!--表格渲染-->
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight" border style="width: 100%;">
      <el-table-column prop="titile" label="标题" />
      <el-table-column prop="msgCategory" label="消息类型">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.msgCategory ===1" size="small" type="danger">通知公告</el-tag>
          <el-tag v-else size="small" type="success">系统消息</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="sender" label="发布人" />
      <el-table-column prop="priority_dictText" label="优先级"/>
      <el-table-column prop="msgType_dictText" label="通告对象"/>
      <el-table-column prop="sendStatus_dictText" label="发布状态"/>
      <el-table-column prop="sendTime" label="发布时间" />
      <el-table-column fixed="right" header-align="center" align="center" width="150" label="操作">
        <template slot-scope="scope">
          <el-button :size="size" type="text" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
          <el-divider direction="vertical"/>
          <el-dropdown :class="[size]">
            <span class="el-dropdown-link">
              更多<i class="el-icon-arrow-down el-icon--right"/>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item v-if="scope.row.sendStatus==='0'" @click.native="publishHandle(scope.row.id)">发布</el-dropdown-item>
              <el-dropdown-item v-if="scope.row.sendStatus==='1'" @click.native="cancelHandle(scope.row.id)">撤销</el-dropdown-item>
              <el-dropdown-item v-if="scope.row.sendStatus==='2'" @click.native="deleteHandle(scope.row.id)">删除</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <!-- <el-button type="text" :size="size" @click="deleteHandle(scope.row.userId)">删除</el-button> -->
        </template>
      </el-table-column>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-popover
        title="下载模板"
        placement="top-start"
        trigger="hover">
        <el-button type="success" size="small" @click="downloadImportTemplateHandle">下载导入模板</el-button>
        <template slot="reference">
          <el-upload :action="importUrl" :on-success="importSuccessHandle" class="upload-button" accept=".xls,.xlsx" name="file" multiple>
            <el-button :loading="importButtonLoading" size="small" type="primary">导入数据</el-button>
          </el-upload>
        </template>
      </el-popover>
      <el-button :loading="exportButtonLoading" type="success" size="small" @click="exportExcelHandle">导出数据</el-button>
      <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
    </div>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import dataDictionary from '@/mixins/data-dictionary'
import Searchbar from '@/components/Searchbar'
import AddOrUpdate from './notice-add-or-update'
import * as API from '@/api/sys/notice'

export default {
  components: {
    AddOrUpdate,
    Searchbar
  },
  mixins: [mixinViewModule, dataDictionary],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.list,
        delAPI: API.del,
        exportAPI: API.download,
        downloadImportTemplateAPI: ''
      },
      searchItems: {
        normal: [
          { name: '标题', field: 'titile', type: 'text', dbfield: 'titile', dboper: 'cn' }
        ]
      },
      importUrl: ''
    }
  },
  mounted() {
    const token = this.$store.getters.token
    this.importUrl = process.env.BASE_API + `/sys/notice/importExcel?token=${token}`
  },
  methods: {
    // 发布
    publishHandle(id) {
      if (!id) {
        this.$message.error('对不起，该信息不能发布！')
        return
      }
      this.$confirm(`确定进行发布操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        API.publish({ id }).then(data => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDataList()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },

    // 撤销
    cancelHandle(id) {
      if (!id) {
        this.$message.error('对不起，该信息不能撤销！')
        return
      }
      this.$confirm(`确定进行撤销操作?`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        API.cancel({ id }).then(data => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.getDataList()
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      })
    },

    // 导出
    exportExcelHandle() {
      let filters = filters = this.$refs.searchbar.get()
      const param = Object.assign({ filters: filters })
      this.exportByApiHandle(param, '.xls', '系统通告')
    }
  }
}
</script>
