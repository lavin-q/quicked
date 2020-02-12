<template>
  <div style="margin-bottom:20px;">
    <slot name="prepend"/>
    <div v-loading="loading" style="position:relative;width: 100%;height:0;padding-bottom:81.25%;" element-loading-text="视频加载中，请稍等。。。">
      <template v-if="dataSource.isOnLine==='在线'">
        <img v-show="!isShowVideo" :src="dataSource.poster" style="width: 100%;border: 1px solid #212224;position: position;top:0;left:0;z-index:20">
        <div v-show="!isShowVideo" class="video-play-btn-wape" title="点击播放" @click="loadVideoPlayer">
          <svg-icon icon-class="play" class-name="video-play-btn"/>
        </div>
        <div v-show="isShowVideo" :id="dataSource.number" class="player"/>
        <div v-show="isShowContinuePlay" class="video-play-btn-wape" style="z-index:999;" title="继续播放" @click="continuePlayVideo">
          <svg-icon icon-class="play" class-name="video-play-btn"/>
        </div>
        <!-- <video-player class="video-player vjs-custom-skin" v-if="isShowVideo"
                      :playsinline="true" :options="dataSource.playerOption?dataSource.playerOption:playerOption"
                      @play="onPlayerPlay($event)" @pause="onPlayerPause($event)" @ready="playerReadied" @playing="onPlayerPlaying($event)">
        </video-player> -->
      </template>
      <template v-else>
        <img src="static/img/video-img/video-offline.jpg" style="width: 100%;border: 1px solid #fff;">
      </template>
    </div>
    <slot name="append"/>
  </div>
</template>

<script>
// import Vue from 'vue'
// import 'video.js/dist/video-js.css';
// import 'vue-video-player/src/custom-theme.css';
// import VideoPlayer from 'vue-video-player';
// Vue.use(VideoPlayer);
// 引入hls.js
// import VideojsContribHls from 'videojs-contrib-hls';
// Vue.use(VideojsContribHls);
// import { videoPlayer } from 'vue-video-player';
import * as $http from '@/api/video'
import cyberplayer from 'static/player/cyberplayer.js'

export default {
  name: 'ElVideoPlayer',
  props: {
    dataSource: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      // playerOption: {
      //   autoplay: true, //如果true,浏览器准备好时开始回放。
      //   muted: false, // 默认情况下将会消除任何音频。
      //   loop: false, // 导致视频一结束就重新开始。
      //   preload: 'auto', // 建议浏览器在<video>加载元素后是否应该开始下载视频数据。auto浏览器选择最佳行为,立即开始加载视频（如果浏览器支持）
      //   language: 'zh-CN',
      //   aspectRatio: '16:13', // "16:9",将播放器置于流畅模式，并在计算播放器的动态大小时使用该值。值应该代表一个比例 - 用冒号分隔的两个数字（例如"16:9"或"4:3"）
      //   fluid: true, // 当true时，Video.js player将拥有流体大小。换句话说，它将按比例缩放以适应其容器。
      //   // sources: [
      //   //   {
      //   //     type: "application/x-mpegURL",  //  mp4格式的："rtmp/mp4", m3u8格式的："application/x-mpegURL",
      //   //     withCredentials: false,
      //   //     src:""
      //   //     // src: "http://121.196.207.47:10016/live/452fceb5-3018-4d94-a0a5-18396751e077" //你的m3u8地址（必填）
      //   //   }
      //   // ],
      //   // controls: true, //控制条
      //   poster: 'http://ipc-pic.img-cn-hangzhou.aliyuncs.com/screenshot/ipc/0d69a167-1924-4b0d-9199-d71405e3bf9c_20180814170837.jpg', //你的封面地址
      //   notSupportedMessage: '此视频暂无法播放，请稍后再试', //允许覆盖Video.js无法播放媒体源时显示的默认信息。
      //   controlBar: {
      //     timeDivider: false,
      //     durationDisplay: false,
      //     remainingTimeDisplay: false,
      //     fullscreenToggle: true //全屏按钮
      //   }
      // },
      isShowVideo: false,
      loading: false,
      player: null,
      isShowContinuePlay: false, // 继续播放
      timer: null // 定时器
    }
  },
  // components: {
  //   videoPlayer
  // },
  destroyed() {
    if (this.timer) {
      clearInterval(this.timer)
    }
  },
  methods: {
    palyer(obj, fileUrl) {
      const _this = this
      this.player = cyberplayer(obj).setup({
        width: '100%',
        height: _this.dataSource.height,
        file: fileUrl, // <—rtmp直播地址
        autostart: true,
        stretching: 'uniform',
        volume: 100,
        controls: true,
        rtmp: {
          reconnecttime: 100, // rtmp直播的重连次数
          bufferlength: 3 // 缓冲多少秒之后开始播放 默认1秒
        },
        ak: '5cea269459dc4a5ea5e1a4abea561dc7' // 公有云平台注册即可获得accessKey
      })
      this.player.onError(function(event) {
        console.log('onError')
        _this.$set(_this, 'isShowVideo', false)
      })
      // 触发播放按钮(无效)
      // this.player.on('play', function () {
      //   if(_this.dataSource.number){
      //     $http.getVideoStreamUrl(_this.dataSource.number);   // 激活视频流
      //   }
      // });
    },
    loadVideoPlayer(isContinue) {
      const _this = this
      if (this.dataSource.number != null && this.dataSource.number !== '') {
        this.loading = true

        $http.getVideoStreamUrl(_this.dataSource.number).then(res => {
          if (res && Number(res.code) === 0) {
            // _this.dataSource.playerOption.sources =  [
            //   {
            //     type: "application/x-mpegURL",
            //     src: res.streamurl
            //   }
            // ];
            _this.palyer(_this.dataSource.number, res.streamurl || res.streamUrl)
            _this.$emit('listenToplayer', this.player)
            _this.$set(_this, 'isShowVideo', true)
            // setTimeout(function(){
            _this.loading = false
            // },900000);

            _this.initTimer() // 初始化定时器
          } else {
            _this.loading = false
            _this.$message.error('视频数据地址获取失败，请联系管理员')
          }
        })
          .catch(error => {
            _this.loading = false
            console.log(error)
          })
      }
    },

    continuePlayVideo() {
      const _this = this
      this.loading = true
      $http.getVideoStreamUrl(_this.dataSource.number).then(res => {
        if (res && Number(res.code) === 0) {
          _this.loading = false
          _this.isShowContinuePlay = false // 隐藏继续播放按钮
          _this.initTimer() // 初始化定时器
        } else {
          _this.loading = false
          _this.$message.error('视频数据地址获取失败，请联系管理员')
        }
      })
        .catch(error => {
          _this.loading = false
          console.log(error)
        })
    },

    // 初始化定时器
    initTimer() {
      const _this = this
      if (this.timer) {
        clearInterval(this.timer)
      }
      this.timer = setInterval(function() {
        // 判断当前浏览器页面是否是激活状态
        var isHidden = true
        if (typeof document.hidden !== 'undefined') { // Opera 12.10 and Firefox 18 and later support
          isHidden = document.hidden
        } else if (typeof document.msHidden !== 'undefined') {
          isHidden = document.msHidden
        } else if (typeof document.mozHidden !== 'undefined') {
          isHidden = document.mozHidden
        } else if (typeof document.webkitHidden !== 'undefined') {
          isHidden = document.webkitHidden
        }
        if (isHidden) { // 非激活状态
          if (_this.timer) {
            clearInterval(_this.timer)
          }
          _this.isShowContinuePlay = true // 暂停状态，显示继续播放按钮
        } else { // 激活状态
          $http.getVideoStreamUrl(_this.dataSource.number)
        }
      }, 599400) // 每隔9.99(599400秒)分执行定时器，服务器端的视频流是10分钟的播放时间，持续播放需要定时访问服务器视频流接口。
    },

    onPlayerPlay(event) {
      console.log(event)
    },

    onPlayerPause(event) {
      console.log(event)
    },

    playerReadied() {
      // this.loading = false;
    },

    onPlayerPlaying() {
      this.loading = false
    }
  }
}
</script>

<style scoped>
  .container {
    padding: 10px;
    background-color: #212224;
  }
  .video-play-btn-wape{
    position:absolute;
    top: 50%;
    left: 50%;
    margin-top: -46px;
    margin-left: -30px;
    display:inline-block;
    z-index: 21
  }
  .video-play-btn{
    font-size: 60px;
    color: #34b6f3;
    cursor: pointer;
  }
  .video-play-btn:hover{
    color:#00aeff;
  }
  .player{
    position: absolute;
    top: 0;
    left:0;
    overflow: hidden;
  }
</style>
