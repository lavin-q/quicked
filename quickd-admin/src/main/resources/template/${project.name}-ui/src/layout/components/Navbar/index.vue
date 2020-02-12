<template>
  <div :class="`header-navbar--${$store.state.app.navbarLayoutType}`" class="header-navbar">
    <el-menu class="header-navbar__menu mr-auto" mode="horizontal">
      <el-menu-item :title="sidebar.opened?'折叠菜单':'展开菜单'" index="1" @click="toggleSideBar()">
        <svg-icon icon-class="outdent" class-name="header-navbar__icon-menu header-navbar__icon-menu--switch"/>
      </el-menu-item>
      <el-menu-item index="2" title="刷新" @click="refresh()">
        <svg-icon icon-class="refresh" class-name="header-navbar__icon-menu"/>
      </el-menu-item>
      <span class="header-title" v-if="device=='desktop'">欢迎进入{{ webName }}</span>
      <span class="header-title" v-else>QuickD</span>
    </el-menu>

    <!--    <fast-navigation/>-->

    <el-menu class="header-navbar__menu" mode="horizontal">

      <el-menu-item index="1" title="帮助" @click="help()">
        <svg-icon icon-class="help" class-name="header-navbar__icon-menu"/>
      </el-menu-item>

      <el-menu-item index="2"  v-popover:noticeListPopover title="通知" >
        <el-popover
          ref="noticeListPopover"
          placement="bottom-start"
          trigger="click"
          width="300"
          popper-class="mod-menu__icon-popover">
          <el-tabs>
            <el-tab-pane :label="msg1Title" key="1">
              <div :key="index" v-for="(record, index) in announcement1" class="text item">
                <div style="margin-left: 5%;width: 80%">
                  <p><a @click="showAnnouncement(record)">标题：{{ record.titile }}</a></p>
                  <p style="color: rgba(0,0,0,.45);margin-bottom: 0px">{{ record.createTime }} 发布</p>
                </div>
                <div style="text-align: right">
                  <el-tag @click="showAnnouncement(record)" v-if="record.priority === 'L'" color="blue">一般消息</el-tag>
                  <el-tag @click="showAnnouncement(record)" v-if="record.priority === 'M'" color="orange">重要消息</el-tag>
                  <el-tag @click="showAnnouncement(record)" v-if="record.priority === 'H'" color="red">紧急消息</el-tag>
                </div>
              </div>
              <div style="margin-top: 5px;text-align: center">
                <el-button @click="toMyAnnouncement()" type="dashed" block>查看更多</el-button>
              </div>
            </el-tab-pane>
            <el-tab-pane :label="msg2Title" key="2">
              <div :key="index" v-for="(record, index) in announcement2" class="text item">
                <div style="margin-left: 5%;width: 80%">
                  <p><a @click="showAnnouncement(record)">标题：{{ record.titile }}</a></p>
                  <p style="color: rgba(0,0,0,.45);margin-bottom: 0px">{{ record.createTime }} 发布</p>
                </div>
                <div style="text-align: right">
                  <el-tag @click="showAnnouncement(record)" v-if="record.priority === 'L'" color="blue">一般消息</el-tag>
                  <el-tag @click="showAnnouncement(record)" v-if="record.priority === 'M'" color="orange">重要消息</el-tag>
                  <el-tag @click="showAnnouncement(record)" v-if="record.priority === 'H'" color="red">紧急消息</el-tag>
                </div>
              </div>
              <div style="margin-top: 5px;text-align: center">
                <el-button @click="toMyAnnouncement()" type="dashed" block>查看更多</el-button>
              </div>
            </el-tab-pane>
          </el-tabs>
        </el-popover>
        <el-badge :value="msgTotal">
          <svg-icon icon-class="bell"  class-name="header-navbar__icon-menu"/>
        </el-badge>
      </el-menu-item>


      <el-menu-item index="3">
        <el-dropdown :show-timeout="0" placement="bottom">
          <span class="action action-full ant-dropdown-link user-dropdown-menu">
             <el-avatar size="small" title="点击上传头像"
                        src="static/images/avatar/avatar.png"/>
               <i class="el-icon-caret-bottom" style="  font-size: 12px;  color: white;"/>
          </span>
          <el-dropdown-menu slot="dropdown">
            <a target="_blank" href="https://docs.auauz.net/">
              <el-dropdown-item>
                项目文档
              </el-dropdown-item>
            </a>
            <el-dropdown-item @click.native="show=true">布局设置</el-dropdown-item>
            <router-link class="router-link"  to="/user/center">
              <el-dropdown-item>
                个人中心
              </el-dropdown-item>
            </router-link>
            <el-dropdown-item @click.native="logoutHandle()">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-menu-item>
      <template v-if="device!=='mobile'">
        <el-menu-item index="4">
          <screenfull class="hover-effect"/>
        </el-menu-item>
      </template>
    </el-menu>

    <show-notice ref="ShowNotice"></show-notice>
  </div>
</template>

<script>
    import {mapGetters} from 'vuex'
    import Screenfull from '@/components/Screenfull'
    import ShowNotice from './ShowNotice'
    import * as $httpCommon from '@/api/common'
    import {info, setRead,listNoticeByUser} from '@/api/sys/notice'
    const Base64 = require('js-base64').Base64
    export default {
        inject: ['refresh'],
        components: {
            Screenfull,
            ShowNotice
        },
        data() {
            return {
                dialogVisible: false,
                announcement1: [],
                announcement2: [],
                msg1Count: "3",
                msg2Count: "0",
                msg1Title: "通知(3)",
                msg2Title: "",
                stopTimer: false,
            }
        },
        computed: {
            ...mapGetters([
                'sidebar',
                'user',
                'username',
                'device'
            ]),
            msgTotal() {
                return parseInt(this.msg1Count) + parseInt(this.msg2Count);
            },
            show: {
                get() {
                    return this.$store.state.settings.showRightPanel
                },
                set(val) {
                    this.$store.dispatch('changeSetting', {
                        key: 'showRightPanel',
                        value: val
                    })
                }
            }
        },
        mounted() {
            this.loadData();
            this.initWebSocket();
        },
        destroyed: function () { // 离开页面生命周期函数
            this.websocketclose();
        },
        methods: {
            help() {
                window.open('www.quickd.cn')
            },
            toggleSideBar() {
                this.$store.dispatch('toggleSideBar')
            },
            logoutHandle() {
                this.$confirm('确定注销并退出系统吗？', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.$store.dispatch('logOut').then(() => {
                        location.reload() // 为了重新实例化vue-router对象 避免bug
                    })
                })
            },

            timerFun() {
                this.stopTimer = false;
                let myTimer = setInterval(() => {
                    // 停止定时器
                    if (this.stopTimer == true) {
                        clearInterval(myTimer);
                        return;
                    }
                    this.loadData()
                }, 6000)
            },
            loadData() {
                try {
                    // 获取系统消息
                    listNoticeByUser().then((res) => {
                        if (res.code == 0) {
                            this.announcement1 = res.data.anntMsgList;
                            this.msg1Count = res.data.anntMsgTotal;
                            this.msg1Title = "通知(" + res.data.anntMsgTotal + ")";
                            this.announcement2 = res.data.sysMsgList;
                            this.msg2Count = res.data.sysMsgTotal;
                            this.msg2Title = "系统消息(" + res.data.sysMsgTotal + ")";
                        }
                    }).catch(error => {
                        console.log("系统消息通知异常", error);//这行打印permissionName is undefined
                        this.stopTimer = true;
                        console.log("清理timer");
                    });
                } catch (err) {
                    this.stopTimer = true;
                    console.log("通知异常", err);
                }
            },
            fetchNotice() {
                if (this.loadding) {
                    this.loadding = false
                    return
                }
                this.loadding = true
                setTimeout(() => {
                    this.loadding = false
                }, 200)
            },
            showAnnouncement(record) {

                setRead({anntId: record.id}).then((res) => {
                    if (res.code == 0) {
                        this.loadData()
                    }
                })
                this.hovered = false
                this.$refs.ShowAnnouncement.detail(record)
            },
            toMyAnnouncement() {
                this.$router.push({ path: '/sys/notice' })
            },
            handleHoverChange(visible) {
                this.hovered = visible
            },
            initWebSocket: function () {
                // WebSocket与普通的请求所用协议有所不同，ws等同于http，wss等同于https
                let userId =  this.$store.state.user.user.id
                let url ="ws://quickd.jhyj56.com/quickd/websocket/" + userId
                // let url = process.env.BASE_API.replace("https://", "wss://").replace("http://", "ws://").replace("api", "quickd") + "/websocket/" + 1000
                console.log(url)
                this.websock = new WebSocket(url)
                this.websock.onopen = this.websocketonopen
                this.websock.onerror = this.websocketonerror
                this.websock.onmessage = this.websocketonmessage
                this.websock.onclose = this.websocketclose
            },
            websocketonopen: function () {
                console.log("WebSocket连接成功")
            },
            websocketonerror: function (e) {
                console.log("WebSocket连接发生错误")
            },
            websocketonmessage: function (e) {
                console.log("-----接收消息-------", e.data)
                let data = eval("(" + e.data + ")") //解析对象
                this.loadData()
                //if(data.cmd == "topic"){
                //系统通知
                this.openNotification(data)
                //}else if(data.cmd == "user"){
                //用户消息
                //  this.openNotification(data)
                //}


            },
            websocketclose: function (e) {
                console.log("connection closed (" + e.code + ")")
            },

            openNotification(data) {
                let text = data.msgTxt
                const key = `open${Date.now()}`
                this.$notify({
                    title: '消息提醒：',

                    message: text,
                    customClass: 'notify-box',
                    iconClass: 'icon-notify',
                    duration: 0,
                    position: 'top-right',
                    onClick: () => {
                        this.$notify.close()
                        this.showDetail(key, data)
                    }
                })

            },

            showDetail(key, data) {
                let id = data.msgId
                info(id).then((res) => {
                    if (res.code == 0&&res.data) {
                        let record = res.data
                        this.showAnnouncement(record)
                    }
                })

            }
        }
    }

</script>
