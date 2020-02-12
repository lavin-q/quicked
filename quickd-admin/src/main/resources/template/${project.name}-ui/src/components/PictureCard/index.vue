<template>
<div ref="pictureWape">
    <el-upload ref="upload" v-if="operType=='edit'"
        class="el-upload-custom"
        list-type="picture-card"
        action="/sys/oss/upload/multi"
        :multiple=multiple
        :file-list="dataSourceArray"
        :show-file-list="true"
        :http-request="upload"

        :on-preview="handlePictureCardPreview"
        :on-remove="handleRemove"
        >
        <i class="el-icon-plus"></i>
    </el-upload>
    <div v-else>
        <div class="">
            <div class="image-preview-wape" v-for="item in urlList"
                 :key="item">
             <span><img :src="item?(item+'@0e_2o_0l_360h_360w_90q'):initLicImgBg" @click="imgPreviewHandle($event)"
                           style="cursor:pointer;"/></span>
            </div>
            <div class="" v-if="dataSourceArray.length==0">
              无附件
            </div>
          </div>
    </div>
</div>
</template>

<script>
import Viewer from 'viewerjs'
import 'viewerjs/dist/viewer.min.css'
import * as $http from '@/api/uploadFile'
export default {
    name:'UploadFiles',
    props:{
        // 组件类型：read(只读) , edit(可读可写)
        operType: {
            type: String,
            default: 'read'
        },
        dataSource:{
            type:[Array,String],
            default:function(){
                return []
            }
        },
        acceptFileType:{
            type:Array,
            default:function(){
                return ['image/jpeg','image/png','image/jpg','image/webp','image/gif']
            }
        },
        multiple:{
            type:Boolean,
            default:true
        },
    },
    data() {
        return {
            
        }
    },
    computed:{
        dataSourceArray(){
            let urls = [];
            if(Object.prototype.toString.apply(this.dataSource)==="[object Array]"){
                urls = this.dataSource;
            }else if(Object.prototype.toString.apply(this.dataSource)==="[object String]" && this.dataSource.length>0){
                urls = this.dataSource.split(',')
            }

            return urls.map(function (value, index, array) {
                var src = value.replace("#","%23");
                src = encodeURI(src);
                return {
                    name: '',
                    url: src,
                    response: {
                        code: 0,
                        data: [src]
                    }
                }
            });
        },
        urlList() {
            let urls = [];
            if(Object.prototype.toString.apply(this.dataSource)==="[object Array]"){
                urls = this.dataSource;
            }else if(Object.prototype.toString.apply(this.dataSource)==="[object String]" && this.dataSource.length>0){
                urls = this.dataSource.split(',')
            }

            return urls.map(function (value, index, array) {
                var src = value.replace("#","%23");
                src = encodeURI(src);
                return src;
            });
        }
    },
    methods: {

        // 新增证件url
        addLicUrl(url){
            if(!url) return;
            let res = [];
            if(this.dataSourceArray && this.dataSourceArray.length>0){
                res = this.dataSourceArray.map(function (item, index, array) {
                    return item.url;
                });
            }
            this.submitModifyHandle(res.concat([url]));
        },

        // 文件格式和大小验证
        validateFileHandle(file){
            // const isJPG = ['image/jpeg','image/png','image/jpg','image/webp','image/gif'].includes(file.type);
            let isLt5M = file.size <5242880;

            if(this.acceptFileType.length>0){
                let isJPG = this.acceptFileType.includes(file.type);
                if (!isJPG) {
                    this.$message.error(`上传的文件格式有误，只允许 ${this.acceptFileType.join(',')} 格式!`);
                    return false;
                }
            }

            if (!isLt5M) {
                this.$message.error('上传文件大小不能超过 5M!');
                return false;
            }

            return true;
        },

        // el-upload控件图片上传
        upload(item) {
            let _this = this,
                file = item.file,
                formData = new FormData();

            // 判断文件格式
            let isValidate = this.validateFileHandle(file);
            if(!isValidate){
                item.onError();
                return false;
            }

            formData.append('file', file, file.name);
            if(this.postData){
               Object.keys(this.postData).forEach(key=>{
                   formData.append('key', _this.postData.key);
               })
            }

            $http.uploadFiles(formData).then(response => {
                if (response.code === 0) {
                    _this.addLicUrl(response.data[0].fileUrl);
                    item.onSuccess('上传成功');
                }else{
                    _this.$message({
                        message: response.message,
                        type: 'error'
                    });
                    item.onError('上传失败');
                }
            }).catch(error => {
                item.onError('上传失败');
                console.log(error);
                if (error.response) {
                    // The request was made and the server responded with a status code
                    // that falls out of the range of 2xx
                    console.log('配时文件上传失败(' + error.response.status + ')，' + error.response.data);
                } else if (error.request) {
                    // The request was made but no response was received
                    // `error.request` is an instance of XMLHttpRequest in the browser and an instance of
                    // http.ClientRequest in node.js
                    console.log('配时文件上传失败，服务器端无响应');
                } else {
                    // Something happened in setting up the request that triggered an Error
                    console.log('配时文件上传失败，请求封装失败');
                }
            });
        },

        // 向父组件提交证件修改信息，触发父组件方法
        submitModifyHandle(dataArr){
            this.$nextTick(() => {
                this.$emit('modify',dataArr);
            })
        },

        // 图片预览
        handlePictureCardPreview: function (file, index) {
            let viewer = new Viewer(this.$refs.pictureWape, {
                zIndex: 20190108,
                url(image) {
                    var src = image.src.replace("#","%23");
                    return src.replace(/\@\w+$/, '') + '@2o';
                },
                hidden() {
                    viewer.destroy();
                }
            });
        },

        // 图片预览
        showImage(url) {
            let divNode = document.createElement("div");
            divNode.style.display = "none";
            let imageNode = document.createElement("img");
            imageNode.setAttribute('src', url);
            imageNode.setAttribute('alt', '图片');
            divNode.appendChild(imageNode);
            document.body.appendChild(divNode);
            let viewer = new Viewer(divNode, {
                url(image) {
                    var src = image.src.replace("#","%23");
                    return src.replace(/\@\w+$/, '') + '@2o';
                },
                zIndex: 20190108,
                hidden() {
                    viewer.destroy();
                    divNode.remove();
                }
            });
            imageNode.click();
        },

        // el-upload图片删除
        handleRemove: function (file, fileList) {
            let licUrlMap = fileList.map(item => {
                return item.url;
            });
            let licUrl = licUrlMap.join(',')
            // this.$set(this.dataSource, 'licUrl', licUrl);
            this.$emit('modify',licUrlMap);
        },
        // 图片点击预览
        imgPreviewHandle(e) {
            this.handlePictureCardPreview();
            e.target.click();
        },
    }
}
</script>

<style scoped>
.image-preview-wape{
    position: relative;
    float: left;
    box-sizing: content-box;
    width: 170px;
    height: 170px;
    margin-right: 10px;
    margin-bottom: 15px;
    overflow: hidden;
    border: 1px dashed #e0e0e0;
    border-radius: 8px;
    background-color: #f9f7f7;
}
.image-preview-item{
    display: table;
    width: 170px;
    height: 170px;
}
.image-preview-item>span{
    vertical-align: middle;
    text-align: center;
    display: table-cell;
}
.image-preview-item>span>img{
    max-width: 170px;
}
</style>
