<template>
  <div class="custom-steps">
    <div
      v-for="(item,index) in list"
      :class="[(index+1)===active?'active':'',active>(index+1)?'finish':'']"
      :key="index"
      class="custom-steps-item"
      @tap="onClick">
      <div class="custom-steps-item__head">
        <div class="custom-steps-item__line"/>
        <div class="custom-steps-item__icon">
          <template v-if="item.icon">
            <svg-icon :icon-class="item.icon"/>
          </template>
          <template v-else>
            {{ index+1 }}
          </template>
        </div>
      </div>
      <div class="custom-steps-item__main">
        <div class="custom-steps-item__title">{{ item.title }}</div>
        <div v-if="item.subTitle" class="custom-steps-item__subTitle">{{ item.subTitle }}</div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Steps',
  props: {
    // 步骤条显示的内容 { title:""}
    list: {
      type: Array,
      required: true
    },
    active: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {

    }
  },
  methods: {
    onClick() {
      this.$emit('click')
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.custom-steps{
	display: -webkit-flex;
  display: flex;
  flex-flow:row nowrap;
  justify-content: space-around;
	padding:10px 0;

	.custom-steps-item{
		flex: 1;
		position:relative;
		text-align: center;

		&:last-of-type{

			.custom-steps-item__line{
				display: none;
			}
		}

		.custom-steps-item__head{
			position:relative;
			// height: 59px;
			width:100%;
			.custom-steps-item__line{
				position: absolute;
				border-color: inherit;
				background-color: #DBDBDB;
				height: 2px;
				top: 50%;
				left: 50%;
				right: -50%;
				margin-top:-1px;
			}
			.custom-steps-item__icon{
				position: relative;
				z-index: 2;
				display: inline-flex;
				justify-content: center;
				align-items: center;
				width: 24px;
				height: 24px;
				font-size: 14px;
				box-sizing: border-box;
				-webkit-border-radius: 14px;
				border-radius: 14px;
				background-color: #C5C5C5;
				transition: .15s ease-out;
				color:#fff;
			}
		}
		.custom-steps-item__main{
			display:flex;
			flex-direction: column;
			color:#C5C5C5;
			.custom-steps-item__title{
				font-size: 14px;
				line-height: 32px;
			}
			.custom-steps-item__subTitle{
				font-size: 12px;
				line-height: 20px;
			}
		}
		&.finish{
			.custom-steps-item__line{
				background-color: #45C473;
			}
			.custom-steps-item__head{
				.custom-steps-item__icon{
					background-color: #45C473;
				}
			}
			.custom-steps-item__main{
				color:#45C473;
			}
		}
		&.active{
			.custom-steps-item__head{

				&:before{
					content: '';
					z-index: 1;
					display: block;
					position: absolute;
					width: 24px;
					height: 24px;
					left: 50%;
					top:50%;
					margin-left: -12px;
					margin-top: -12px;
					border-radius: 14px;
					background-color: #C3EED2;
					animation: enlarge 2s infinite;
					-webkit-animation: enlarge 2s infinite;
				}

				.custom-steps-item__line{
					// background-color: #45C473;
				}
				.custom-steps-item__icon{
					background-color: #45C473;

					// &:before{
					// 	content:'';
					// 	z-index:1;
					// 	display:block;
					// 	position:absolute;
					// 	width:24px;
					// 	height:24px;
					// 	border-radius: 14px;
					// 	background-color: #C3EED2;
					// 	animation:enlarge 1s infinite;
					// 	-webkit-animation:enlarge 1s infinite; /* Safari 和 Chrome */
					// }
				}
			}
			.custom-steps-item__main{
				color:#45C473;
			}
		}
	}
}
@keyframes enlarge{
	0%   {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
	25%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	50%  {width:40px;height:40px;border-radius: 40px;margin-left: -20px;margin-top: -20px;}
	75%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	100% {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
}
@-moz-keyframes enlarge{
	0%   {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
	25%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	50%  {width:40px;height:40px;border-radius: 40px;margin-left: -20px;margin-top: -20px;}
	75%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	100% {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
}
@-webkit-keyframes enlarge{
	0%   {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
	25%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	50%  {width:40px;height:40px;border-radius: 40px;margin-left: -20px;margin-top: -20px;}
	75%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	100% {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
}
@-o-keyframes enlarge{
	0%   {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
	25%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	50%  {width:40px;height:40px;border-radius: 40px;margin-left: -20px;margin-top: -20px;}
	75%  {width:32px;height:32px;border-radius: 32px;margin-left: -16px;margin-top: -16px;}
	100% {width:24px;height:24px;border-radius: 24px;margin-left: -12px;margin-top: -12px;}
}
</style>
