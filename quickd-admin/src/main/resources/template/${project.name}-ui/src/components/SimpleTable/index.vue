<template>
<div style="padding-bottom:20px;">
	<div v-html="tableTitle"></div>
	<el-table class="el-table" :data="tablePage.list" highlight-current-row style="width: 100%;" :height="maxHeight" border>
		<el-table-column type="index" width="50"></el-table-column>
		<template v-for="(item,index) in tableHeader">
			<el-table-column v-if="item.operations"
				:label="item.name" :key="index" :width="item.width" :formatter="item.formatter">
				<template slot-scope="scope">
					<template v-for="(operate,operateIndex) in item.operations">
						<el-button v-if="operate.isShow" size="mini" :type="operate.type"
							@click="operate.func(scope.row)" :key="operateIndex" v-show="operate.isShow(scope.row)">{{operate.label}}</el-button>
						<el-button v-else size="mini" :type="operate.type"
							@click="operate.func(scope.row)" :key="operateIndex">{{operate.label}}</el-button>
					</template>

				</template>
			</el-table-column>
			<el-table-column v-else
				:label="item.name" :key="index" :width="item.width" :formatter="item.formatter">
				<template slot-scope="scope">
					<template v-if="item.formatter">
						<span v-html="item.formatter(scope.row[item.field],scope.row,index)"></span>
					</template>
					<template v-else>
						<span v-html="scope.row[item.field]"></span>
					</template>
				</template>
			</el-table-column>
		</template>
	</el-table>
	<!--工具条-->
	<div class="toolbar">
		<el-pagination background layout="sizes, prev, pager, next, total" @current-change="handleCurrentChange" @size-change="handleSizeChange" :page-size="tablePage.pageSize" :page-sizes="[20, 30, 50, 100, 200, 500]" :total="tablePage.totalPage" style="float:right;">
		</el-pagination>
	</div>
</div>
</template>

<script>
export default {
	name: 'SimpleTable',
	props: {
		tableTitle:{
			type:String,
			default:''
		},
		tableHeader:{
			type:Array,
			required:true
		},
		tablePage:{
			type:Object,
			default(){
				return {
					list:[],
					currPage:0,
					pageSize:20,
					totalPage:0
				}
			}
		},
		maxHeight:{
			type:Number,
			default:400
		}
	},
	methods: {
		// 分页跳转
        handleCurrentChange: function(val) {
            this.tablePage.currPage = val;
			let params = Object.assign({},{
				page:this.tablePage.currPage>0?this.tablePage.currPage:1,
				limit:this.tablePage.pageSize
			});
            this.$emit('tableRefreshByPagination',params);
		},

        // 分页条数修改
        handleSizeChange: function(val) {
			this.tablePage.pageSize = val;
			let params = Object.assign({},{
				page:this.tablePage.currPage>0?this.tablePage.currPage:1,
				limit:val
			});
            this.$emit('tableRefreshByPagination',params);
        },
	}
}
</script>
