<template>
    <div class="passport-map">
        <slot  v-if='initComplete'></slot>
        <!-- <keep-alive>
          <component v-if='initComplete' :is="mapComp" v-on:handledisp="handleDisp" :vmap ="map"></component>
        </keep-alive> -->
        <div  id="viewMap" :style="{'height':mapConfig.mapHeight+'px'}"></div>
    </div>
</template>

<script>
import * as Tool from "@/utils/tool"
export default {
  name: "baseMap",
  data() {
    return {
      map: null,
      myDrawingManagerObject:null,
      bdary:null,
      driving:null,
      path: [],
      entpName: "",
      overlay: null,
      loading: true,
      tableLoading: false,
      tableHeight: 170,
      mapHeight: 500,
      list:[],
      // comments:[],
      mapConfig:{
        drawingModes:[],
        scrollWheelZoom:false,//是否开启滚动
        navigationControl:false,//缩放控件
        centerAndZoom:{
          point:[121.681275,29.973008],
          zoom:13,
          city:"宁波市"
        },
        mapHeight:768,
        mapDrawing:false
      },
      initComplete:false//子组件加载锁
    };
  },
  props:{
    param:{
      // type:'Object',
      required: false
    }
  },
  created(){
    let param = this.$props.param;
    this.mapConfig = Object.assign({},this.mapConfig,param);
  },
  mounted() {
    if(!this.mapConfig.mapHeight){
      let mapHeight = Tool.getClientHeight()-80;
      let _this = this;

      this.mapConfig.mapHeight = mapHeight;
      window.addEventListener("resize", function() {
              _this.mapConfig.mapHeight = Tool.getClientHeight()-80;
      });
    }

    this.$nextTick(() => {
      this.loadMap();
      this.loading = false;
    });
  },
  methods: {
    //处理地图的子组件分发的数据
    handleDisp(payload){
      let data = payload.data;
      let handleFn = payload.handleFn;
      let lastHandleFn = payload.lastHandleFn;
      let getBoundary = this.getBoundary;

      (Object.prototype.toString.call(handleFn) == '[object Function]')
      && handleFn.call(this,data);
      if(lastHandleFn){
        this.$emit('handledisp',data)
      }
    },
    //初始化地图及地图相关控价
    loadMap() {
      let _this = this;
      let map = new BMap.Map("viewMap");

      this.map = map;

      //初始化地图设置
      this.initMapSetting(map);

      //加载地图控件
      this.addMapControl(map);

      //获取区域围栏
      // this.getBoundary();

      //绘制覆盖物插件
      this.addDrawingManager(map);

      //路线导航服务
      this.drivingRoute(map);

      //区域搜索
      this.localSearch(map);

      this.initComplete = true;//子组件加载锁
      //保存地图到 store管理器
      this.commitMapComp('SET_MAP',map);
    },
     //保存地图到 store管理器
    commitMapComp(name,comp){
      this.$store.commit(name,comp)
    },
    //初始化地图设置
    initMapSetting(map){
      let mapConfig = this.mapConfig;
      let centerZoomPoint = mapConfig.centerAndZoom.point;
      let zoom = mapConfig.centerAndZoom.zoom;
      let city = mapConfig.centerAndZoom.city;

      // 初始化地图,设置中心点坐标和地图级别
      map.centerAndZoom(new BMap.Point(centerZoomPoint[0],centerZoomPoint[1]), zoom);
      // 设置地图显示的城市 此项是必须设置的
      map.setCurrentCity(city);
      map.setMapType(BMAP_HYBRID_MAP);
       //开启鼠标滚轮缩放
      if(mapConfig.scrollWheelZoom){
        map.enableScrollWheelZoom();
      }
    },
    //统一加载地图控件
    addMapControl(map){
      let mapConfig = this.mapConfig;
      //添加地图类型控件
      map.addControl(
        new BMap.MapTypeControl({
          mapTypes: [BMAP_NORMAL_MAP, BMAP_HYBRID_MAP]
        })
      );

      if(mapConfig.navigationControl){
         // 添加带有定位的导航控件
        let navigationControl = new BMap.NavigationControl({
          // 靠左上角位置
          anchor: BMAP_ANCHOR_TOP_RIGHT,
          // LARGE类型
          type: BMAP_NAVIGATION_CONTROL_LARGE,
          offset:new BMap.Size(0, 40)
        });
        map.addControl(navigationControl);
      }
    },
    //区域搜索
    localSearch(map){
      //区域搜索
      var local = new BMap.LocalSearch(map);
      this.local = local;
    },
    //路线导航
    drivingRoute(map){
      //路线导航
      var driving = new BMap.DrivingRoute(map, {
          renderOptions:{
            map: map,
            autoViewport: false,
            enableDragging : true
          }
      });
      this.driving = driving;
      this.commitMapComp('SET_MAP_DRIVING',driving);
    },
    //加载地多边形绘制工具
    addDrawingManager(map){
        //地图配置参数
        let mapConfig = this.mapConfig;
        let polyOption = {
          strokeWeight: 2,
          strokeColor: "#078aff"
        };
        if(mapConfig.mapDrawing){
          let myDrawingManagerObject = new BMapLib.DrawingManager(map, {
          isOpen: false,
          enableDrawingTool: true,
          drawingToolOptions: {
              anchor: BMAP_ANCHOR_TOP_RIGHT,
              offset: new BMap.Size(10, 40),
              enableCalculate: true,
              drawingModes: mapConfig.drawingModes
          },
          polygonOptions: polyOption,
          circleOptions: polyOption,
          rectangleOptions: polyOption
        });
        this.myDrawingManagerObject = myDrawingManagerObject;
        this.commitMapComp('SET_MAP_DRAWING',myDrawingManagerObject);
      }
    },
    //获取行政区域
    getBoundary(callback){
      var bdary = new BMap.Boundary();
      var map = this.map;

      this.bdary = bdary;
      this.commitMapComp('SET_MAP_BDARY',bdary);
      bdary.get("宁波市镇海区", function(rs){       //获取行政区域
        map.clearOverlays();        //清除地图覆盖物
        var count = rs.boundaries.length; //行政区域的点有多少个
        if (count === 0) {
          this.$message({
            type:'error',
            message:'未能获取当前输入行政区域'
          });
          return ;
        }

        var pointArray = [];
        for (var i = 0; i < count; i++) {
          var ply = new BMap.Polygon(rs.boundaries[i], {
            strokeWeight: 2,
            fillOpacity: 0.0,
            fillColor: "none",
            strokeColor: "#ff0000",
            strokeOpacity: 0.8,
            strokeStyle: "dashed"
          }); //建立多边形覆盖物
          map.addOverlay(ply);  //添加覆盖物
          pointArray = pointArray.concat(ply.getPath());
        }
        if(callback){
          callback.call();
        }else{
          map.setViewport(pointArray);
        }
      });
    },
    //显示多边形
    showOverlay(lnglat) {
      if (lnglat) {
        let lnglatArr = lnglat
          .split(",")
          .join(";")
          .split(";");
        let polygon;
        let pointArr = [];

        this.path.length = 0;

        for (var i = 0, len = lnglatArr.length; i < len; i += 2) {
          pointArr.push(new BMap.Point(lnglatArr[i], lnglatArr[i + 1]));
        }

        polygon = new BMap.Polygon(pointArr, {
          strokeWeight: 2,
          strokeColor: "#e12828"
        });

        if (this.overlay) {
          this.map.removeOverlay(this.overlay);
        }

        this.map.addOverlay(polygon); //添加覆盖物
        this.map.setViewport(pointArr); //调整地图视口
        this.overlay = polygon;
      } else {
        this.$message({
          message: "无围栏坐标数据",
          type: "error"
        });
      }
    },
    //清除地图覆盖物
    clear(overlay) {
      this.map.removeOverlay(overlay);
    },
    //获取多边形中心点
    getCenterPoint(path) {
      var x = 0.0;
      var y = 0.0;
      for (var i = 0; i < path.length; i++) {
        x = x + parseFloat(path[i].lng);
        y = y + parseFloat(path[i].lat);
      }
      x = x / path.length;
      y = y / path.length;

      return new BMap.Point(x, y);
    },
    //获取地图缩放级别
    getCurrentMapZoom() {
      return this.map.getZoom();
    }
  }
};
</script>
<style >
  .passport-map{
      position: relative;
      background: #fff;
  }
  /* 地图样式重置 */
    .anchorBL{display:none;}
    .tangram-suggestion-main{
      z-index: 10;
    }
</style>
