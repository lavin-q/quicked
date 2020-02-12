<template>
<div>
    <el-upload ref="upload" class="el-upload-files" action="/sys/oss/upload/multi"
        :on-preview="handlePictureCardPreview" :on-remove="handleRemove"
        :file-list="urlComputed" :http-request="upload" :drag="drag" :multiple="multiple"
    >
        <el-button v-if="!drag" slot="trigger" size="small" type="primary">选取文件</el-button>
        <template v-else>
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        </template>
        <div class="el-upload__tip" slot="tip">{{tip}}</div>
    </el-upload>
</div>
</template>

<script>
import Viewer from 'viewerjs'
import 'viewerjs/dist/viewer.min.css'
import * as $http from '@/api/uploadFile'
export default {
    name:'UploadFiles',
    props:{
        dataSource:{
            type:[Array,String,null],
            default:function(){
                return []
            }
        },
        acceptFileType:{
            type:Array,
            default:function(){
                return []
            }
        },
        drag:{
            type:Boolean,
            default:false
        },
        multiple:{
            type:Boolean,
            default:false
        },
        tip:{
            type:String,
            default:''
        },
        postData:{
            type:Object,
            default:null
        }
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
            }else if(Object.prototype.toString.apply(this.dataSource)==="[object Null]"){
                urls = []
            }

            return urls.map(function (value, index, array) {
                return value
            });
        },
        urlComputed(){
            let urls = [];
            if(Object.prototype.toString.apply(this.dataSource)==="[object Array]"){
                urls = this.dataSource;
            }else if(Object.prototype.toString.apply(this.dataSource)==="[object String]"){
                urls = this.dataSource.split(',')
            }else if(Object.prototype.toString.apply(this.dataSource)==="[object Null]"){
                urls = []
            }

            return urls.map(function (value, index, array) {
                return {
                    name: value.slice(value.indexOf('_')+1),
                    url: value
                }
            });
        }
    },
    methods: {
        //清空已上传的文件列表
        clearFiles(){
            this.$refs.upload.clearFiles();
        },
        //取消上传请求
        abort(){
            this.$refs.upload.clearFiles();
        },

        // 上传列表文件预览
        handlePictureCardPreview: function (file, index) {
            var src = file.url;
            if ((/.pdf$/).test(src)) {
                window.open(src, '_blank');
            } else if ((/.(doc|docx|docm|dot|ppt|pptx|pptm)$/).test(src)) {
                window.open('https://view.officeapps.live.com/op/view.aspx?src=' + encodeURIComponent(src),'_blank')
            } else if ((/.(xls|xlsx|xlsb|xlsm)$/).test(src)) {
                window.open('https://excel.officeapps.live.com/op/view.aspx?src=' + encodeURIComponent(src),'_blank')
            } else if ((/.(jpg|jpeg|png|gif)$/).test(src)) {
                this.showImage(src);
            } else {
                this.downLoadFile(src);
            }
        },

        // 图片预览
        showImage(url){
            let divNode = document.createElement("div");
            divNode.style.display = "none";
            let imageNode = document.createElement("img");
            imageNode.setAttribute('src',url);
            imageNode.setAttribute('alt','图片');
            divNode.appendChild(imageNode);
            document.body.appendChild(divNode);
            let viewer = new Viewer(divNode,{
                zIndex: 20190108,
                hidden(){
                    viewer.destroy();
                    divNode.remove();
                }
            });
            imageNode.click();
        },

        // 下载非doc,excel,图片的其他类型文件
        downLoadFile(url){
            let link = document.createElement("a");
            link.style.display = "none";
            link.href = url;
            let fileName = url.slice(url.indexOf('_')+1),
                fileType = url.slice(url.lastIndexOf('.')+1)

            link.setAttribute(
                "download",
                `${fileName}.${fileType}`
            );
            document.body.appendChild(link);
            link.click();
            link.remove();
        },

        // el-upload文件删除
        handleRemove: function (file, fileList) {
            let urlMap = fileList.map(item=>{
                return item.url;
            });
            this.submitModifyHandle(urlMap);
        },

        // 新增证件url
        addLicUrl(url){
            if(!url) return;
            this.submitModifyHandle(this.dataSourceArray.concat([url]));
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
        }
    }
}
</script>

<style scoped>

</style>
