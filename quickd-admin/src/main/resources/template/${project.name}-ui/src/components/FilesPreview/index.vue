<template>
  <div>
    <div v-for="(item,index) in dataSource" :class="{'inline':inline}" :key="item+index" class="file-preview-item">
      <svg-icon
        v-if="(/.pdf$/).test(item.slice(item.lastIndexOf('.')))"
        icon-class="pdf"
        class-name="svg-icon"/>
      <svg-icon
        v-else-if="(/.(doc|docx|docm|dot|ppt|pptx|pptm)$/).test(item.slice(item.lastIndexOf('.')))"
        icon-class="word"
        class-name="svg-icon"/>
      <svg-icon
        v-else-if="(/.(xls|xlsx|xlsb|xlsm)$/).test(item.slice(item.lastIndexOf('.')))"
        icon-class="excel"
        class-name="svg-icon"/>
      <svg-icon
        v-else-if="(/.(jpg|jpeg|png|gif)$/).test(item.slice(item.lastIndexOf('.')))"
        icon-class="image"
        class-name="svg-icon"/>
      <svg-icon v-else icon-class="file" class-name="svg-icon"/>
      <el-button :title="'点击查看文档：'+item.slice(item.indexOf('_')+1)" type="text" @click.native.prevent="showDoc(item)">
        {{ item.slice(item.indexOf('_') + 1) }}
      </el-button>
      <template v-if="inline==true&&index<dataSource.length-1">,&nbsp;&nbsp;</template>
    </div>
  </div>
</template>

<script>
import Viewer from 'viewerjs'
import 'viewerjs/dist/viewer.min.css'

export default {
  name: 'FilesPreview',
  props: {
    dataSource: {
      type: Array,
      default() {
        return []
      }
    },
    inline: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {}
  },
  computed: {},
  methods: {
    createNodeLoading(targetNode, loadingText) {
      const loading = this.$loading({
        lock: true,
        text: loadingText || '加载中...',
        target: targetNode.$el
      })
      return loading
    },

    showDoc: function(url) {
      var src = url
      if ((/.pdf$/).test(src)) {
        window.open(src, '_blank')
      } else if ((/.(doc|docx|docm|dot|ppt|pptx|pptm)$/).test(src)) {
        window.open('https://view.officeapps.live.com/op/view.aspx?src=' + encodeURIComponent(src), '_blank')
      } else if ((/.(xls|xlsx|xlsb|xlsm)$/).test(src)) {
        window.open('https://excel.officeapps.live.com/op/view.aspx?src=' + encodeURIComponent(src), '_blank')
      } else if ((/.(jpg|jpeg|png|gif)$/).test(src)) {
        this.showImage(src)
      } else {
        this.downLoadFile(src)
      }
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
          if (image.src.indexOf('61.174.22.139') >= 0) {
            return image.src.replace(/\@\w+$/, '')
          } else {
            return image.src.replace(/\@\w+$/, '') + '@2o'
          }
        },
        zIndex: 2999,
        hidden() {
          viewer.destroy()
          divNode.remove()
        }
      })
      imageNode.click()
    },

    // 下载非doc,excel,图片的其他类型文件
    downLoadFile(url) {
      const link = document.createElement('a')
      link.style.display = 'none'
      link.href = url
      const fileName = url.slice(url.indexOf('_') + 1)
      const fileType = url.slice(url.lastIndexOf('.') + 1)

      link.setAttribute(
        'download',
        `${fileName}.${fileType}`
      )
      document.body.appendChild(link)
      link.click()
      link.remove()
    }

  }

}
</script>

<style scoped>
  .file-preview-item {
    position: relative;
    padding-left: 20px;
    line-height: 25px;
  }

  .inline {
    display: inline-block;
  }

  .svg-icon {
    font-size: 18px;
    position: absolute;
    top: 50%;
    margin-top: -9px;
    left: 0;
  }
</style>
