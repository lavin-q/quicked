<template>
  <div>
    <searchbar
      ref="searchbar"
      :search-items="searchItems"
      :pagination="pagination"
      class="grid-search-bar"
      @search="getDataList"
      @resizeSearchbar="resizeSearchbar">
      <!-- <template slot="button">
          <el-button size="small" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        </template> -->
    </searchbar>
    <!--表格渲染-->
    <el-table v-loading="dataListLoading" :data="dataList" :height="tableHeight-120" border style="width: 100%;">
      <el-table-column prop="itemText" label="名称"/>
      <el-table-column prop="itemValue" label="数值"/>
      <el-table-column prop="status" label="是否启用">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 0" :size="size" type="danger">禁用</el-tag>
          <el-tag v-else :size="size">正常</el-tag>
        </template>
      </el-table-column>
      <el-table-column fixed="right" header-align="center" align="center" width="100" label="操作">
        <template slot-scope="scope">
          <el-button :size="size" type="text" @click="addOrUpdateFunc(scope.row.id,null)">修改</el-button>
          <el-button :size="size" type="text" @click="deleteHandle(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div ref="paginationbar" class="pagination-wrapper">
      <el-pagination
        :page-sizes="[20, 30, 50, 100, 200]"
        :page-size="pagination.limit"
        :current-page.sync="pagination.page"
        :total="pagination.total"
        style="float:right;"
        layout="sizes, prev, pager, next, total"
        @current-change="handleCurrentChange"
        @size-change="handleSizeChange"/>
    </div>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"/>
  </div>
</template>

<script>
import mixinViewModule from '@/mixins/view-module'
import Searchbar from '@/components/Searchbar'
import AddOrUpdate from './dict-item-add-or-update'
import * as API from '@/api/sys/dict'

export default {
  components: {
    AddOrUpdate,
    Searchbar
  },
  mixins: [mixinViewModule],
  data() {
    return {
      dictId: null,
      mixinViewModuleOptions: {
        activatedIsNeed: false,
        getListAPI: API.listOfDictItem,
        delAPI: API.delOfDictItem
      },
      searchItems: {
        normal: [
          { name: '名称', field: 'itemText', type: 'text', dbfield: 'item_text', dboper: 'cn' }
        ]
      }
    }
  },
  methods: {
    // 根据字典列表id，初始化字典配置列表
    initByDictId(dictId) {
      this.dictId = dictId
      if (dictId) {
        this.defaultQueryConditions = [{ 'field': 'dict_id', 'op': 'cn', 'data': dictId }]
      }
      this._initViewModule({})
      this.resizeSearchbar()
    },

    // 新增 / 修改
    addOrUpdateFunc(id, dictId) {
      this.addOrUpdateVisible = true
      this.$nextTick(() => {
        this.$refs.addOrUpdate.dataForm.id = id
        this.$refs.addOrUpdate.dataForm.dictId = dictId
        this.$refs.addOrUpdate.init(id)
      })
    }
  }
}
</script>
