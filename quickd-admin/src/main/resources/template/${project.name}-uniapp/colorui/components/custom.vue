<template>
	<view>
		<!-- 状态栏站位 -->
		<view class="cu-custom" :style="[{height:StatusBar + 'px'}]">
			<view class="cu-bar fixed" :style="style" :class="bgColor"></view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				StatusBar: this.StatusBar
			};
		},
		name: 'custom',
		computed: {
			style() {
				var StatusBar= this.StatusBar;
				var style = `padding-top:${StatusBar}px;`;
				return style
			}
		},
		props: {
			bgColor: {
				type: String,
				default: ''
			}
		},
		methods: {
		}
	}
</script>

<style>

</style>
