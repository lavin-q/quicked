QuickD 快速开发平台
===============

当前最新版本： 1.0.0


项目介绍：
-----------------------------------
QuickD是一个前后端分离快速开发平台，是基于 Spring Boot 和 Vue 开发，整合Flowable工作流、Shiro、Redis等，来帮助中小型企业及个人实现敏捷化的应用交付和运营管理，并提供代码生成器、通用前端等业务组件，来帮助开发者聚焦于业务，加速中小型企业数字化转型。


## QuickD开发平台
* 采用前后端分离的模式，前端开源框架：[quickd-ui](https://gitee.com/quickd/quickd-ui) (基于 Vue、Element-UI)
* 后端采用Springboot+Mybatis-Plus+Shiro+jwt+redis，并同时对其基础组件做了高度的封装
* 全能代码生成器，Android，IOS，Vue增删改查功能自动生成，菜单配置直接使用；大幅度提升开发效率，不再为重复工作发愁。
* 在线配置报表（无需编码，通过在线配置方式，实现曲线图，柱状图，数据等报表）
* 完善的权限管理（精细化数据权限控制，控制到行级，列表级，表单字段级，实现不同人看不同数据，不同人对同一个页面操作不同字段
* 极简封装了多租户底层，用更少的代码换来拓展性更强的SaaS多租户系统。
* 查询过滤器：查询功能自动生成，后台动态拼SQL追加查询条件；支持多种匹配方式（全匹配/模糊查询/包含查询/不匹配查询）；
* 借鉴Shiro，采用JWT做Token认证，可拓展集成Redis等细颗粒度控制方案。
* 借助 Jenkins作为持续集成工具，提供持续集成的流水线，简化应用开发、缩短应用生命周期，快速迭代。
* 封装完善的用户、角色、菜单、组织机构、数据字典、在线定时任务等基础功能，支持访问授权、按钮权限、数据权限等功能
* 专业接口对接机制，统一采用restful接口方式，集成swagger-ui在线接口文档，Jwt token安全验证，方便客户端对接
* 协同办公工作流。集成工作流[Flowable](https://www.flowable.org/ "Flowable")，并实现了只需在页面配置流程转向，可极大的简化bpm工作流的开发；用bpm的流程设计器画出了流程走向，一个工作流基本就完成了，只需写很少量的java代码；
* 查询过滤器：查询功能自动生成，后台动态拼SQL追加查询条件；支持多种匹配方式（全匹配/模糊查询/包含查询/不匹配查询）
* 集成可视化工具大屏插件，可以自定义大屏显示内容；
* 常用共通封装，各种工具类(定时任务,短信接口,邮件发送,Excel导入导出等),基本满足80%项目需求
* 后台提供分布式限流、同步锁、验证码等工具类 前端提供丰富Vue模版
* 基于Websocket消息推送管理、基于Quartz定时任务管理、数据字典管理
* SQL监控：采用druid 监控数据库访问性能，默认用户名admin，密码123456
* 异常日志：记录异常日志，方便开发人员定位错误
* 操作日志：记录用户操作的日志
* 定时任务：整合Quartz做定时任务，加入任务日志，任务运行情况一目了然
* 文件管理:支持本地或者第三方阿里云文件存储服务，可动态任意切换
* 实现防止表单重复提交，避免短时间内不止一次提交表单。
* 完善的阿里云配置文档和部署文档
* 社交账号管理：支持多种第三社交账号登录，不干涉原用户数据，实现第三方账号管理
* 专业接口对接机制：统一采用restful接口方式，集成swagger-ui在线接口文档，Jwt token安全验证，方便客户端对接
* 整合ELK实现日志收集：用Elasticsearch、Logstash、Kibana,组合起来可以搭建线上日志系统

## 架构图
<img src="https://img.kancloud.cn/48/38/48380481029d8827edbe9871a60a190a_2222x932.png"/>

 
技术架构：
-----------------------------------

#### 后端
- 基础框架：Spring Boot 2.1.7.RELEASE

- 持久层框架：Mybatis-Plus_3.0.6

- 安全框架：Apache Shiro 1.4.0，Jwt_3.7.0

- 数据库连接池：阿里巴巴Druid 1.1.10

- 缓存框架：redis

- 日志打印：logback

- 其他：fastjson，poi，Swagger-ui，quartz, lombok（简化代码）等。


#### 前端
 
- [Vue 2.5.22](https://cn.vuejs.org/),[Vuex](https://vuex.vuejs.org/zh/),[Vue Router](https://router.vuejs.org/zh/)
- [Axios](https://github.com/axios/axios)
- [ElementUI](https://element.eleme.cn/#/zh-CN//)
- [webpack](https://www.webpackjs.com/),[yarn](https://yarnpkg.com/zh-Hans/)
- [vue-cropper](https://github.com/xyxiao001/vue-cropper) - 头像裁剪组件
- eslint，[@vue/cli 3.2.1](https://cli.vuejs.org/zh/guide)


#### 开发环境

- 语言：Java 8

- IDE(JAVA)： IDEA安装lombok插件

- IDE(前端)： visual studio code

- 依赖管理：Maven

- 数据库：MySQL8.1,mongodb

- 缓存：Redis



## 工程结构
``` 
quickd
├── quickd-admin-- 基础框架[端口:9090]
├── quickd-devtools -- Web管理后台基础项目, 生成初始化项目（包含后端，前端，android，ios,小程序)
├── quickd-system-- 系统核心模块
├── admin-ui -- 前台VUE模板[端口:9001]
├── demo-parent -- wms演示后端系统[端口:8080]
├── demo-ui -- wms演示前端系统[端口:8098]
├── demo-uniapp -- wms手机端演示系统（包含IOS和android）
├── demo-android -- wms手机端android原生演示系统
├── quickd-components-- 用户权限管理系统
|    ├── quickd-components-flowable -- 流程引擎组件
|    ├── quickd-components-quartz-- 定时任务组件
|    ├── quickd-components-oss-- 文件处理组件
|    ├── quickd-components-datav--大屏组件
```

## 官网
* 官网地址：[http://website.jhyj56.com/](http://website.jhyj56.com/)
* qq交流群：`473540229`

## 在线演示
* Web项目演示：http://quickd.jhyj56.com
* uniapp移动端项目演示：http://quickd.jhyj56.com
* Android移动端项目演示：http://quickd.jhyj56.com

## 技术文档
* [开发手册一览](http://doc.jhyj56.com)

## 项目地址
* 后端QuickD Gitee地址：[https://gitee.com/quickd/quickd](https://gitee.com/quickd/quickd)

* 前端QuickD Gitee地址：[https://gitee.com/quickd/quickd-ui](https://gitee.com/quickd/quickd-ui)

* 后端WMS Gitee地址：[https://gitee.com/quickd/demo-parent](https://gitee.com/quickd/demo-parent)

* 前端WMS Gitee地址：[https://gitee.com/quickd/demo-ui](https://gitee.com/quickd/demo-ui)

* WMS uniapp Gitee地址：[https://gitee.com/quickd/demo-uniapp](https://gitee.com/quickd/demo-uniapp)

* WMS Android Gitee地址：[https://gitee.com/quickd/demo-android](https://gitee.com/quickd/demo-android)

# 开源协议
Apache Licence 2.0 （[英文原文](http://www.apache.org/licenses/LICENSE-2.0.html)）
Apache Licence是著名的非盈利开源组织Apache采用的协议。该协议和BSD类似，同样鼓励代码共享和尊重原作者的著作权，同样允许代码修改，再发布（作为开源或商业软件）。
需要满足的条件如下：
* 需要给代码的用户一份Apache Licence
* 如果你修改了代码，需要在被修改的文件中说明。
* 在延伸的代码中（修改和有源代码衍生的代码中）需要带有原来代码中的协议，商标，专利声明和其他原来作者规定需要包含的说明。
* 如果再发布的产品中包含一个Notice文件，则在Notice文件中需要带有Apache Licence。你可以在Notice中增加自己的许可，但不可以表现为对Apache Licence构成更改。
Apache Licence也是对商业应用友好的许可。使用者也可以在需要的时候修改代码来满足需要并作为开源或商业产品发布/销售。

## 用户权益
* 允许免费用于学习、毕设、公司项目、私活等。
* 对未经过授权和不遵循 Apache 2.0 协议二次开源或者商业化我们将追究到底。
* 参考请注明：参考自 QuickD：https://gitee.com/quickd/quickd 。另请遵循 Apache 2.0 协议。

# 界面

## QuickD PC端界面一览
<table>
    <tr>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012132836.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012133130.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134655.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134746.png"/></td>
    </tr>
    <tr>
       <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134812.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134918.png"/></td>
    </tr>
    <tr>
         <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134812.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134918.png"/></td>
    </tr>
    <tr>
       <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012135120.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012163142.png"/></td>
    </tr>
    <tr>
         <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012135302.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012134918.png"/></td>
    </tr>
	<tr>
         <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012163212.png"/></td>
          <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/quickd/QQ图片20191012163405.png"/></td>
    </tr>

</table>



## WMS演示系统 uniapp界面一览


<table>
    <tr>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012165756.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170200.png"/></td>
    </tr>
    <tr>
      <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012165914.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012165938.png"/></td>
    </tr>
    <tr>
       <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012165952.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170138.png"/></td>
    </tr>
    <tr>
      <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170150.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170223.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170246.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170255.png"/></td>
    </tr>
    <tr>
           <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ图片20191012165841.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ图片20191012170110.png"/></td>
    </tr>
	<tr>
      <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ图片20191012170129.png"/></td>
        <td><img src="https://gitee.com/quickd/quickd/raw/master/pic/app/QQ截图20191012170733.png"/></td>
    </tr>

</table>

## WMS演示系统 Android界面一览

## QQ群
![QQ群](https://img.kancloud.cn/0a/23/0a230c88c9182df7cead0d3673228ece_298x313.png "QQ群")