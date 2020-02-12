<template>
  <div :loading="loading">
    <template v-if="operType=='edit' && !refresh">
      <el-upload
        ref="upload"
        :on-preview="handlePictureCardPreview"
        :on-remove="handleRemove"
        :file-list="dataSourceComputed"
        :show-file-list="true"
        :http-request="upload"
        class="el-upload-custom"
        list-type="picture-card"
        action="/sys/oss/upload/multi"
      >
        <i class="el-icon-plus"/>
      </el-upload>
    </template>
    <div v-else class="image-preview-wape">
      <div v-for="(item,index) in dataSource.split(';')" :key="index" class="image-preview-item">
        <span><img :src="item" @click="showImage(item)"></span>
      </div>
    </div>

    <!-- 图片裁剪 -->
    <div v-show="startImageCrop" class="cropper-container" >
      <!--[if lt IE 9]>
                <el-alert
                    type="error"
                    show-icon
                    title="信息提示"
                    description="You are using an <strong>outdated</strong> browser. Please <a href='http://browsehappy.com/'>upgrade your browser</a> to improve your experience."
                    :closable="false">
                </el-alert>
            <![endif]-->
      <div style="width:69vw;height:100vh;padding:10px;box-sizing:border-box;float:left;position:relative;">
        <div ref="croperHeader" style="font-size:16px;line-height:18px;">
          <p style="padding:0;margin:0;">裁剪前效果：(鼠标中键滚动可缩放图片)</p>
          <div class="btn-group">
            <a class="btn" href="javascript:void(0)" title="移动" @click="move"><svg-icon icon-class="move" class-name="svg-icon"/></a>
            <a class="btn" href="javascript:void(0)" title="裁剪" @click="crop"><svg-icon icon-class="crop" class-name="svg-icon"/></a>
            <a class="btn" href="javascript:void(0)" title="左旋30度" @click="rotateLeft(30)"><svg-icon icon-class="rotate-left" class-name="svg-icon"/></a>
            <a class="btn" href="javascript:void(0)" title="右旋30度" @click="rotateRight(30)"><svg-icon icon-class="rotate-right" class-name="svg-icon"/></a>
            <a class="btn" href="javascript:void(0)" title="左右翻转" @click="scaleX"><svg-icon icon-class="left-right" class-name="svg-icon"/></a>
            <a class="btn" href="javascript:void(0)" title="上下翻转" @click="scaleY"><svg-icon icon-class="up-down" class-name="svg-icon"/></a>
            <a class="btn" href="javascript:void(0)" title="重置" @click="reset"><svg-icon icon-class="reset" class-name="svg-icon"/></a>
          </div>
        </div>
        <div :style="{maxHeight:croperContentHeight+'px'}">
          <img ref="imageCropper" alt="剪裁前效果图">
        </div>
      </div>
      <div style="width:29vw;height:100vh;padding:10px;margin-right:0.5vw;box-sizing:border-box;float:right;position:relative;">
        <p>裁剪后效果：</p>
        <div ref="previewImageCropper" :style="{maxHeight:(croperContentHeight+30)+'px'}" style="width:100%;height:100%;max-width:100vw;overflow:hidden;"/>
        <div class="img_btn" style="position:absolute;bottom:0;left:0;right:0;text-align:center;padding:20px;">
          <el-button size="small" type="primary" @click="doCrop">剪裁上传</el-button>
          <el-button size="small" @click="cancelCrop">全图上传</el-button>
          <el-button size="small" type="error" @click="cancelUpload">取消上传</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import 'blueimp-canvas-to-blob'
import Viewer from 'viewerjs'
import 'viewerjs/dist/viewer.min.css'
import Cropper from 'cropperjs'
import 'cropperjs/dist/cropper.min.css'
import { uploadImages } from '@/api/common'
import * as Tool from '@/utils/tool'

export default {
  name: 'UploadImages',
  props: {
    // 组件类型：read(只读) , edit(可读可写)
    operType: {
      type: String,
      default: 'edit'
    },
    limit: {
      type: Number,
      default: 5
    },
    // 图片数据，传入的null类型，默认设置的图片结果是字符串,用;拼接
    dataSource: {
      type: [String, Array, null],
      required: true
    }
  },
  data() {
    return {
      refresh: false,
      loading: false,
      croperContentHeight: Tool.getClientHeight() - 90,
      imgCropperData: {
        file: null, // 上传的文件
        // previewSrc:'',              // 剪裁前预览图地址,
        fileType: null,
        fileName: null,
        accept: 'image/gif, image/jpeg, image/png, image/bmp',
        maxSize: 5242880 // 最大5M
      },
      cropper: null,
      startImageCrop: false,
      // cropperLoading: false,
      scaleXFlag: 1,
      scaleYFlag: 1,
      cropperTarget: null, // 裁剪对象节点
      uploadItem: null
    }
  },
  computed: {
    // 数据源的初始类型
    initialTypeOfDataSource() {
      const type = Object.prototype.toString.apply(this.dataSource)
      if (type === '[object Array]') {
        if (!this.initialTypeOfDataSource) {
          return 'Array'
        }
      } else if (type === '[object String]') {
        return 'String'
      } else {
        return 'String'
      }
    },
    // 图片数组
    dataSourceComputed() {
      let imageList = null
      const type = Object.prototype.toString.apply(this.dataSource)
      if (type === '[object Array]') {
        imageList = this.dataSource
      } else if (type === '[object String]') {
        imageList = this.dataSource.length > 0 ? this.dataSource.split(';') : []
      } else {
        imageList = []
      }

      if (imageList && imageList.length > 0) {
        return imageList.map(function(value, index, array) {
          // var src = value.replace('#', '%23');
          const src = value
          return {
            name: '',
            url: src,
            response: {
              code: 0,
              data: [src]
            }
          }
        })
      } else {
        return []
      }
    }
  },
  mounted: function() {
    window.addEventListener('resize', this.setCroperContentHeight)
    this.setCroperContentHeight()
  },
  destroyed() {
    window.removeEventListener('resize', this.setCroperContentHeight)
    this.destroyCrop()
  },
  methods: {
    // init(data) {
    //   this.show = false;
    //   if (this.dataSource.length !== 0) {
    //     this.refresh = true
    //     this.$nextTick(() => {
    //       this.refresh = false;
    //       this.constructor(data);
    //     })
    //   } else {
    //     this.constructor(data);
    //   }
    // },
    // constructor(data) {
    //   let imageList = null;
    //   const type = Object.prototype.toString.apply(data);
    //   if (type === '[object Array]') {
    //     this.initialTypeOfDataSource = 'Array';
    //     imageList = data;
    //   } else if (type === '[object String]') {
    //     this.initialTypeOfDataSource = 'String';
    //     imageList = data.length > 0 ? data.split(';') : [];
    //   }

    //   if (imageList && imageList.length > 0) {
    //     this.$set(this, 'dataSource', imageList.map(function(value, index, array) {
    //       // var src = value.replace('#', '%23');
    //       const src = value;
    //       return {
    //         name: '',
    //         url: src,
    //         response: {
    //           code: 0,
    //           data: [src]
    //         }
    //       }
    //     }))
    //   } else {
    //     this.$set(this, 'dataSource', []);
    //   }
    // },
    // 设置剪裁容器高度
    setCroperContentHeight() {
      const _this = this
      this.$nextTick(() => {
        let croperHeaderHeight = this.$refs.croperHeader.offsetHeight
        if (croperHeaderHeight < 50) {
          croperHeaderHeight = 50
        }
        _this.croperContentHeight = Tool.getClientHeight() - croperHeaderHeight - 30
      })
    },

    // 初始化剪切
    initCropper() {
      this.cropper = new Cropper(this.$refs.imageCropper, {
        aspectRatio: NaN, // 容器的比例
        viewMode: 1,
        preview: this.$refs.previewImageCropper,
        checkCrossOrigin: false,
        checkOrientation: false,
        autoCrop: false
        // ready: function () {
        //     console.log('cropper is ready');
        //     // var image = new Image();
        //     // image.src = _this.cropper.getCroppedCanvas().toDataURL('image/jpeg');
        //     // _this.$refs.previewImageCropper.appendChild(image);
        // }
      })
    },

    // 移动
    move() {
      this.cropper.setDragMode('move')
    },

    // 裁剪
    crop() {
      this.cropper.setDragMode('crop')
    },

    // 左旋
    rotateLeft(dataRotate) {
      this.cropper.rotate(-dataRotate)
    },

    // 右旋
    rotateRight(dataRotate) {
      this.cropper.rotate(dataRotate)
    },

    // 左右翻转
    scaleX() {
      this.scaleXFlag = -this.scaleXFlag
      this.cropper.scaleX(this.scaleXFlag)
    },

    // 上下翻转
    scaleY() {
      this.scaleYFlag = -this.scaleYFlag
      this.cropper.scaleY(this.scaleYFlag)
    },

    // 重置
    reset() {
      this.cropper.reset()
    },

    // 清空裁剪
    clearCrop() {
      this.cropper.clear()
    },

    // 销毁
    destroyCrop() {
      if (this.cropper) {
        this.cropper.destroy()
      }
    },

    // 确认剪切操作
    doCrop() {
      this.startImageCrop = false
      this.submitImageUploadHandle()
    },

    // 取消剪切操作
    cancelCrop() {
      this.startImageCrop = false
      this.clearCrop()
      this.submitImageUploadHandle()
    },

    // 取消上传
    cancelUpload() {
      this.startImageCrop = false
      this.clearCrop()
      // 清除loading节点
      if (this.cropperTarget) {
        const loadingNode = this.cropperTarget.getElementsByClassName('el-loading-mask')
        if (loadingNode.length > 0) {
          loadingNode[0].remove()
        }
      }
    },
    // 设置节点加载
    createNodeLoading(targetNode, loadingText) {
      const loading = this.$loading({
        lock: true,
        text: loadingText || '加载中...',
        target: targetNode.$el
      })
      return loading
    },

    // 文件格式和大小验证
    validateFileHandle(file) {
      // const isJPG = ['image/jpeg','image/png','image/jpg','image/webp','webp'].includes(file.type);
      const isJPG = this.imgCropperData.accept.includes(file.type)
      const isLt5M = file.size < this.imgCropperData.maxSize

      if (!isJPG) {
        this.$message.error('上传的图片有误，只允许 jpg,png,jpeg,webp 格式!')
      }
      if (!isLt5M) {
        this.$message.error('上传图片大小不能超过 5M!')
      }
      if (!isJPG || !isLt5M) return false
      else return true
    },

    // el-upload控件图片上传
    upload(item) {
      const file = item.file
      if (!file) return

      // 判断文件格式
      const isValidate = this.validateFileHandle(file)
      if (!isValidate) {
        item.onError()
        return false
      }
      // _this.cropperLoading = true;
      this.cropperHandle(item)
      this.uploadItem = item
      this.loading = true
    },
    // 裁剪证件操作
    cropperHandle(data) {
      const _this = this
      this.imgCropperData.file = data.file
      this.imgCropperData.fileType = data.file.type
      this.imgCropperData.fileName = data.file.name

      this.startImageCrop = true

      // 每次替换图片要重新得到新的url
      if (!this.cropper) {
        this.initCropper()
      }

      // let fileSrc = this.getObjectURL(this.imgCropperData.file);
      // this.imgCropperData.previewSrc = fileSrc;
      // //每次替换图片要重新得到新的url
      // this.cropper.replace(fileSrc);

      var reader = new FileReader()
      // 将图片将转成 base64 格式
      reader.readAsDataURL(data.file)
      reader.onload = function() {
        // _this.imgCropperData.previewSrc = this.result;
        _this.cropper.replace(this.result)
      }

      this.scaleXFlag = 1
      this.scaleYFlag = 1
    },

    // 图片上传
    submitImageUploadHandle() {
      const _this = this
      const type = this.imgCropperData.fileType || 'image/jpeg'

      // 证件识别
      this.cropper.getCroppedCanvas({
        fillColor: '#fff'
      }).toBlob(function(blob) {
        // 图片上传处理
        // FormData 对象
        const formData = new FormData()
        formData.append('file', blob, _this.imgCropperData.fileName)

        uploadImages(formData).then(response => {
          if (response.code === 0) {
            _this.addImages(response.data[0].thumbUrl)
            _this.loading = false
            _this.uploadItem.onSuccess('上传成功')
          } else {
            _this.$message({
              message: response.message,
              type: 'error'
            })
            _this.loading = false
            _this.uploadItem.onError('上传失败')
          }
        }).catch(error => {
          _this.loading = false
          _this.uploadItem.onError('上传失败')
          console.log(error)
          if (error.response) {
            // The request was made and the server responded with a status code
            // that falls out of the range of 2xx
            console.log('配时文件上传失败(' + error.response.status + ')，' + error.response.data)
          } else if (error.request) {
            // The request was made but no response was received
            // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
            // http.ClientRequest in node.js
            console.log('配时文件上传失败，服务器端无响应')
          } else {
            // Something happened in setting up the request that triggered an Error
            console.log('配时文件上传失败，请求封装失败')
          }
        })
      }, type)
    },
    addImages(url) {
      if (!url) return
      let res = this.dataSourceComputed.slice(0)
      if (this.dataSource.indexOf(url) === -1) {
        res.push({
          name: '',
          url: url,
          response: {
            code: 0,
            data: [url]
          }
        })
      }
      res = res.map((item) => {
        return item.url
      })
      if (this.initialTypeOfDataSource === 'String') {
        res = res.join(';')
      }
      this.$nextTick(() => {
        this.$emit('modify', res)
      })
    },
    // el-upload图片删除
    handleRemove: function(file, fileList) {
      const imageUrlMap = fileList.map(item => {
        return item.url
      })
      let imageUrl = null
      if (this.initialTypeOfDataSource === 'Array') {
        imageUrl = imageUrlMap
      } else {
        imageUrl = imageUrlMap.join(';')
      }
      this.$nextTick(() => {
        this.$emit('modify', imageUrl)
      })
    },
    // 图片预览
    handlePictureCardPreview: function(file, index) {
      this.showImage(file.url)
    },
    // 图片预览
    showImage(url) {
      const divNode = document.createElement('div')
      divNode.style.display = 'none'
      const imageNode = document.createElement('img')
      imageNode.setAttribute('src', url)
      imageNode.setAttribute('alt', '图片')
      divNode.appendChild(imageNode)
      document.body.appendChild(divNode)
      const viewer = new Viewer(divNode, {
        url(image) {
          // var src = image.src.replace("#","%23");
          // var	src = encodeURI(image.src.replace(/\@\w+$/, '') + '@2o')
          var src = image.src
          if (/\@\w+$/.test(src)) {
            src = src.replace(/@\S+/, '') + '@2o'
          }
          return src
        },
        zIndex: 2999,
        hidden() {
          viewer.destroy()
          divNode.remove()
        }
      })
      imageNode.click()
    }
  }
}
</script>

<style scoped>
.cropper-container{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 999999;
    background-color: #797979;
    font-size:16px;
    color:#fff;
}
.btn-group{
    display: table;
    margin-bottom: 8px;
    width: 100%;
    text-align: center;
}
.btn{
    display: inline-block;
    background: #409EFF;
    padding:5px 10px;
    margin: 0;
    color:#fff;
    font-size:15px;
    border-right:1px solid rgba(255,255,255,0.5);
}
.btn:first-child{
    border-radius: 5px 0 0 5px;
}
.btn:last-child{
    border-radius: 0 5px 5px 0;
    border-right:none;
}
.svg-icon{
    font-size: 20px;
}
</style>
