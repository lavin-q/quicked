<template>
	<view class="page app-container">
		<view class="header">
			<image class="titleImg" src="../../static/login/titleBg.png" mode="aspectFit"></image>
			<view class="logo">
				<image class="logoImg" src="../../static/logo.png" mode="aspectFit"></image>
			</view>
			<view class="name">${project.sysName}</view>
		</view>
		<view class="loginform">
			<form>
				<!-- <view class="cu-form-group">
					<text class="lg text-gray cuIcon-people"></text>
					<input v-model="loginForm.mobile" placeholder="输入手机号" name="input" type="number" @input="inpurFunc('mobile')" maxlength="11"></input>
				</view>
				<view class="cu-form-group">
					<text class="lg text-gray cuIcon-safe"></text>
					<input v-model="loginForm.code" placeholder="输入验证码" name="input" @input="inpurFunc('code')"></input>
					<button class="cu-btn round" :class="codeMobile?'lines-red':'lines-gray'" @tap="getMobCode">{{codevalMessage}}</button>
				</view> -->
				<view class="cu-form-group">
					<text class="lg text-gray cuIcon-people"></text>
					<input v-model="loginForm.username" placeholder="输入用户名" name="input" type="text" @input="inpurFunc('mobile')" maxlength="11"></input>
				</view>
				<view class="cu-form-group">
					<text class="lg text-gray cuIcon-lock"></text>
					<input v-model="loginForm.password" placeholder="输入密码" name="input" type="password" @input="inpurFunc('mobile')" maxlength="11"></input>
				</view>
			</form>
			<view class="padding flex flex-direction">
				<button v-if="!disabledBtn" class="cu-btn bg-red margin-tb-sm lg" disabled type="">登 录</button>
				<button v-else class="cu-btn bg-red margin-tb-sm lg" @tap="toLogin">登 录</button>
			</view>
			<!-- <view class="wechat">
				<view class="wechatBg">
					<text class="lg text-white cuIcon-weixin"></text>
				</view>
				<view class="wechat-text">微信授权登录</view>
			</view> -->
		</view>
	</view>
</template>

<script>
	import graceChecker from '@/graceUI/graceChecker.js'
	import * as Tool from "@/common/util";
	import { mapGetters} from 'vuex';
	export default {
		data() {
			return {
				loginForm:{
					// mobile:'',
					// code:''
					username: '',
					password: ''
				},
				disabledBtn:false,
				
				codevalMessage:'发送验证码',
				codeMobile:false,
				regainIntervalTime:60,
				regainNextTime:60,
				regainTask:null,
				regainFlag:true,
				
				formRules:[
					// { name: "mobile", checkType: "notnull", checkRule: "", errorMsg: "请输入手机号"},
					// { name: "code", checkType: "notnull", checkRule: "", errorMsg: "请输入验证码"},
					{ name: "username", checkType: "notnull", checkRule: "", errorMsg: "请输入用户名"},
					{ name: "password", checkType: "notnull", checkRule: "", errorMsg: "请输入密码"}
				],
			}
		},
		onLoad(options) {
			if(this.username){
				this.loginForm.username = this.username
			}
		},
		computed:{
			...mapGetters(['username']),
		},
		methods:{
			toLogin(){//登录
				//进行表单检查
				var checkRes = graceChecker.check(this.loginForm, this.formRules);
				if(!checkRes){
					uni.showToast({ title: graceChecker.error, icon: "none" });
					return;
				}
				let username = this.encode(this.loginForm.username.trim(), 3);//去空格加密
				let password = this.encode(this.loginForm.password.trim(), 3);//去空格加密
				let postData = {
					username: username,
					password: password
				};
				// ajax请求提交登录信息
				this.$store.dispatch('loginByUsername', postData).then(res=>{
					if(res.code===0){
						uni.reLaunch({url:'/pages/index/index'});
					}else{
						uni.showToast({
							icon:"none",
							title:"登录失败："+res.msg
						})
					}
				}).catch(error=>{
					console.log(error);
				});
			},
			//Base64加密
			encode(val, times) {
			  if (times <= 0) {
			    return val;
			  }
			  let res = val;
			  for (let i = 0; i < times; i++) {
			    res = Tool.Base64.encode(res);
			  }
			  return res;
			},
			inpurFunc(name){//判断提交按钮是否禁用
				// this.disabledBtn = (this.$validate.isMobile(this.loginForm.mobile) && this.loginForm.code) ? true :false
				// if(name === 'mobile'){
				// 	this.codeMobile = this.$validate.isMobile(this.loginForm.mobile) ? true :false;
				// }
				this.disabledBtn = (this.loginForm.username && this.loginForm.password) ? true :false
			},
			// 开启定时任务
			startRegainTask() {
				this.regainNextTime = this.regainIntervalTime;
				this.regainFlag = false;
				this.regainTaskFun();
				this.regainTask = setInterval(this.regainTaskFun, 1000);
			},
			
			// 重置任务
			regainTaskFun(){
				let _this = this;
				_this.codevalMessage = _this.regainNextTime+"秒后再试";
				_this.regainNextTime -= 1;
				_this.regainFlag = false;
				if (_this.regainNextTime <=0) {
					_this.resetRegainTask();
					_this.codevalMessage = "发送验证码";
					_this.regainFlag = true;
				}
			},
			
			// 重置定时任务
			resetRegainTask() {
				this.regainNextTime = this.regainIntervalTime;
				clearInterval(this.regainTask);
			},
			
			// 获取手机验证码
			getMobCode(){
				let _this = this,
					mob = this.loginForm.mobile.trim();
				if(this.$validate.isMobile(mob)){	// 手机号验证通过
					if(this.regainFlag){
						this.startRegainTask();
						let postData={
							mob:mob
						}
						// uni request get CodeVal
						// this.$request.get('/getSmsCodeByMob',postData).then(res=>{
						// 	if(res.code==0){
						// 		console.log('发送成功');
						// 	}
						// 	
						// });
					}
				}else{
					uni.showToast({
						title: '手机号不正确',
						icon:"none"
					});
					return;
				}
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
			height: 500upx;
			background-color: #409EFF;
			position: relative;
			overflow: hidden;
			.titleImg{
				width: 100%;
				position: absolute;
				left: 0;
				top: 0;
				z-index: 99;
			}
			.logo{
				width: 120upx;
				height: 120upx;
				background-color: #fff;
				border-radius: 30upx;
				margin: 130upx auto 20upx;
				overflow: hidden;
				.logoImg{
					width: 100%;
					height: 100%;
				}
			}
			.name{
				color: #fff;
				font-size: 40upx;
				text-align: center;
			}
		}
		.loginform{
			width: 100%;
			height: 100%;
			background-color: #fff;
			position: relative;
			top: -50px;
			border-radius: 50upx 50upx 0 0;
			z-index: 2;
			padding: 80upx 40upx;
			.cu-form-group{
				border-bottom:1px solid #d2d2d3;
				padding:30upx 0;
				text[class*="cuIcon-"]{
					color: #63687c;
					font-size: 40upx;
					margin-right: 20upx;
				}
			}
			.wechat{
				width:640upx;
				position: fixed;
				bottom: 80upx;
				text-align: center;
				.wechatBg{
					width: 100upx;
					height:100upx;
					border-radius: 50upx;
					background-color: #66cd45;
					text-align: center;
					line-height: 95upx;
					margin-left: 280upx;
					text[class*="cuIcon-"]{
						font-size: 60upx;
					}
				}
				.wechat-text{
					margin-top: 20upx;
					font-size: 28upx;
					color: #898989;
				}
			}
		}
	}
	.lines-gray{
		color: #898989;
	}
	
</style>
