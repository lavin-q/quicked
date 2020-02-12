<template name="mine">
	<view class="app-container">
		<cu-custom bgColor="bg-red"></cu-custom>
		<view class="bg-white">
			<view class="header bg-red">
				<image class="titleImg" src="../../static/login/titleBg.png" mode="aspectFit"></image>
				<view class="flex" style="margin-bottom: 60upx;">

				</view>
			</view>
			<view class="person bg-white">
				<view class="cu-list menu-avatar">
					<view class="cu-item" style="height: 120upx;">
						<view class="cu-avatar round lg" style="left:20upx;background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big10006.jpg);"></view>
						<view class="content flex-sub" style="left:136upx;">
							<view class="text-grey">{{userInfo.username}}</view>
							<view class="text-gray text-sm flex">
								<view class="text-cut">
									{{userInfo.name}}
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>
			<view class="cu-list menu sm-border">
				<view class="cu-item arrow">
					<view class="content">
						<text class="cuIcon-circlefill text-grey"></text>
						<text class="text-grey">设置</text>
					</view>
				</view>
				<view class="cu-item arrow">
					<view class="content">
						<text class="cuIcon-tagfill text-red  margin-right-xs"></text>
						<text class="text-grey">关于我们</text>
					</view>
				</view>
				<view class="cu-item arrow">
					<view class="content">
						<text class="cuIcon-warn text-green"></text>
						<text class="text-grey">意见反馈</text>
					</view>
					<view class="action">

					</view>
				</view>
			</view>
		</view>
		<view class="padding flex flex-direction">
			<button class="cu-btn bg-red margin-tb-sm lg" @tap="outlogin">退出登录</button>
		</view>
	</view>
</template>

<script>
	import { mapGetters} from 'vuex';
	export default {
		data() {
			return {
			}
		},
		onLoad() {

		},
		computed:{
			...mapGetters(['userInfo']),
		},
		methods:{
			outlogin(){
				uni.reLaunch({
					url:'/pages/login/login'
				})
			}
		}
	}
</script>

<style lang="less">
	page{
		height: 100%;
	}
	.app-container{
		height: 100%;
		overflow: hidden;
		.header{
			width: 100%;
			min-height: 200upx;
			position: relative;
			overflow: hidden;
			.titleImg{
				width: 100%;
				position: absolute;
				left: 0;
				top: 0;
			}
		}
		.person{
			width: 72%;
			height:120upx;
			border-radius: 60upx;
			box-shadow:0px 10px 25px -10px #409EFF;
			position: relative;
			top: -60upx;
			left: 14%;
			z-index: 2;
			overflow: hidden;
		}
	}
</style>
