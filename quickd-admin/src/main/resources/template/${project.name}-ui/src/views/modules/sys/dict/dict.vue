<template>
  <div class="app-main-content">
    <el-row :gutter="15">
      <!--字典管理-->
      <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
        <el-card class="box-card" shadow="never">
          <div slot="header" class="clearfix">
            <span class="role-span">字典列表</span>
            <div style="float: right">
              <el-button type="primary" icon="el-icon-plus" size="mini" style="padding: 6px 9px" @click="addOrUpdateHandle()">新增</el-button>
            </div>
          </div>
          <searchbar ref="searchbar" :search-items="searchItems" :pagination="pagination" class="grid-search-bar" @search="getDataList" @resizeSearchbar="resizeSearchbar">
            <!-- <template slot="button">
              <el-button :size="size" type="primary" @click="addOrUpdateHandle()">新增</el-button>
            </template> -->
          </searchbar>
          <!--表格渲染-->
          <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight-80" border style="width: 100%;" @current-change="handleSelectedChange">
            <el-table-column prop="dictName" label="字典名称" />
            <el-table-column prop="dictCode" label="字典编号" />
            <el-table-column prop="description" label="描述" />
            <el-table-column fixed="right" header-align="center" align="center" width="100" label="操作">
              <template slot-scope="scope">
                <el-button :size="size" type="text" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
                <el-button :size="size" type="text" @click="deleteHandle(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div ref="paginationbar" class="pagination-wrapper">
            <el-pagination :page-sizes="[20, 30, 50, 100, 200]" :page-size="pagination.limit" :current-page.sync="pagination.page" :total="pagination.total" style="float:right;" layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange"/>
          </div>
        </el-card>
      </el-col>
      <!-- 授权 -->
      <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
        <el-alert :closable="false" :title="'选中字典：'+(currentItem?currentItem.dictName:'')" type="default" show-icon effect="light"/>
        <el-card class="box-card" shadow="never">
          <div slot="header" class="clearfix">
            <el-tooltip class="item" effect="dark" content="选择指定字典查看详情" placement="top">
              <span class="role-span">字典配置</span>
            </el-tooltip>
            <el-button :disabled="currentId===null" icon="el-icon-plus" size="mini" style="float: right; padding: 6px 9px" type="primary" @click="addOrUpdateDictItemHandle">新增</el-button>
          </div>
          <div v-show="!currentItem">
            <div class="my-code">点击左侧字典查看详情</div>
          </div>
          <div v-show="currentItem">
            <dict-item ref="dictItem"/>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import AddOrUpdate from './dict-add-or-update'
import * as API from '@/api/sys/dict'
import dictItem from '../dictDetail/dict-item'

export default {
  components: {
    AddOrUpdate,
    Searchbar,
    dictItem
  },
  mixins: [mixinViewModule],
  data() {
    return {
      mixinViewModuleOptions: {
        getListAPI: API.list,
        delAPI: API.del
      },
      searchItems: {
        normal: [
          { name: '字典名称', field: 'dictName', type: 'text', dbfield: 'dict_name', dboper: 'cn' },
          { name: '字典编号', field: 'dictCode', type: 'text', dbfield: 'dict_code', dboper: 'cn' }
        ]
      },

      currentItem: null,
      currentId: null
    }
  },
  methods: {
    addOrUpdateDictItemHandle() {
      this.$refs.dictItem.addOrUpdateFunc(null, this.currentItem.id)
    },

    handleSelectedChange(val) {
      if (val) {
        // 保存当前的角色id
        this.currentId = val.dictName
        this.currentItem = val

        this.$refs.dictItem.initByDictId(val.id)
      }
    }
  }
}
</script>
