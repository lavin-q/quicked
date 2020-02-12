<template>
  <div class="app-main-content">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input size="small" v-model="dataForm.key" placeholder="用户名／用户操作" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button size="small" @click="getDataList()">查询</el-button>
      </el-form-item>
    </el-form>
    <el-table :height="tableHeight"
      :data="dataList"
      border
      v-loading="dataListLoading"
      style="width: 100%">
      <el-table-column
        prop="id"
        header-align="center"
        align="center"
        width="80"
        label="ID">
      </el-table-column>
      <el-table-column
        prop="username"
        header-align="center"
        align="center"
        label="用户名">
      </el-table-column>
      <el-table-column
        prop="operation"
        header-align="center"
        align="center"
        label="用户操作">
      </el-table-column>
      <el-table-column
        prop="method"
        header-align="center"
        align="center"
        width="150"
        :show-overflow-tooltip="true"
        label="请求方法">
      </el-table-column>
      <el-table-column
        prop="params"
        header-align="center"
        align="center"
        width="150"
        :show-overflow-tooltip="true"
        label="请求参数">
      </el-table-column>
      <el-table-column
        prop="time"
        header-align="center"
        align="center"
        label="执行时长(毫秒)">
      </el-table-column>
      <el-table-column
        prop="ip"
        header-align="center"
        align="center"
        width="150"
        label="IP地址">
      </el-table-column>
      <el-table-column
        prop="createDate"
        header-align="center"
        align="center"
        width="180"
        label="创建时间">
      </el-table-column>
    </el-table>
    <div class="toolbar">
      <el-pagination background layout="sizes, prev, pager, next, total"
        @current-change="currentChangeHandle"
        @size-change="sizeChangeHandle"
        :current-page="pageIndex"
        :page-sizes="[20, 30, 50, 100, 200]"
        :page-size="pageSize"
        :total="totalPage"
        style="float:right;">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import * as $http from '@/api/sys/log'
  import * as Tool from '@/utils/tool'

  export default {
    data () {
      return {
        tableHeight:Tool.getClientHeight()-200,
        dataForm: {
          key: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 20,
        totalPage: 0,
        dataListLoading: false,
        selectionDataList: []
      }
    },
    created () {
      const that = this;
      window.addEventListener('resize', function () {
          that.tableHeight = Tool.getClientHeight() - 200;
      });

      this.$nextTick(function(){
          this.getDataList();
      });
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        let _this = this,
            postData = Object.assign({},this.dataForm,{
              'page': this.pageIndex,
              'limit': this.pageSize
            })

        $http.getLogList(postData).then(response => {
          if (response && response.code === 0) {
            _this.dataList = response.data.list
            _this.totalPage = response.data.totalCount
          } else {
            _this.dataList = []
            _this.totalPage = 0
          }
          _this.dataListLoading = false
        }).catch(error => {
            console.log(error);
            _this.dataListLoading = false
        });
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      }
    }
  }
</script>
