<template>
	<view>
		<list v-if="PageCur=='list'" :menuList="elements"></list>
		<mine v-if="PageCur=='mine'"></mine>
		<view class="cu-bar tabbar bg-white shadow foot">
			<view class="action" @click="NavChange" data-cur="list">
				<view class='cuIcon-cu-image'>
					<image :src="'/static/tabbar/home' + [PageCur=='list'?'HL':''] + '.png'"></image>
				</view>
				<view :class="PageCur=='list'?'text-red':'text-gray'">首页</view>
			</view>
			<view class="action" @click="NavChange" data-cur="mine">
				<view class='cuIcon-cu-image'>
					<image :src="'/static/tabbar/user' + [PageCur == 'mine'?'HL':''] + '.png'"></image>
				</view>
				<view :class="PageCur=='mine'?'text-red':'text-gray'">我的</view>
			</view>
		</view>
	</view>
</template>

<script>
	import { mapGetters} from 'vuex';
	import * as API from '@/api/menu'
	export default {
		data() {
			return {
				PageCur: 'list',
				elements:[]
			}
		},
		computed:{
			...mapGetters(['userInfo']),
		},
		onLoad() {
			this.init() //初始化菜单
		},
		methods: {
			NavChange: function(e) {
				this.PageCur = e.currentTarget.dataset.cur
			},
			init() { //初始化菜单
				API.listUniappMenu().then(res => {
					if (res.code == 0) {
						this.elements = res.data
					}
				}).catch(err => {

				});
			}
		}
	}
</script>

<style>

</style>
