## 基于vue3+element-plus+laravel8.x构建的前后端分离的博客应用

> 最新的博客开源啦～～～ 哈哈哈。利用空余时间将以前的老博客更新重写了一下。模仿了两个博客的ui。基于 vue3+element-plus+laravel8.x前后端分离构建的一款博客应用。

#### 前端UI参考
 * [炫酷ui](https://88250.b3log.org/)
 * [简洁ui](https://www.louislivi.com/)
 
 
[博客地址](https://pltrue.top/)


#### 实现了一些小功能

* 主题切换

![最新的博客开源咯](https://cdn.learnku.com/uploads/images/202104/27/32593/75p9l93jEn.gif!large)

* 前后端分离下第三方授权登录

![最新的博客开源咯](https://cdn.learnku.com/uploads/images/202104/27/32593/3odHRNEdIO.gif!large)
* 响应式

![最新的博客开源咯](https://cdn.learnku.com/uploads/images/202104/27/32593/Fshu0ybfGF.png!large)

![最新的博客开源咯](https://cdn.learnku.com/uploads/images/202104/27/32593/dKLNrACCAC.png!large)
  


#### 前端使用到的一些组件和库
   * `element-plus` 处理封装一些组件其他基本是使用了ui框架提供的
   * `vue-wechat-title` 页面title渲染
   * `vue-router` 前端路由
   *` vuex`状态管理、`cookie`(存储token用户状态) `localStorage` 用户信息 数据缓存
   * `axios` 封装了请求和响应拦截器 处理`api`异常逻辑
   * `simplemde`+`highlight` maradown渲染以及代码高亮
   * `nprogress`实现进度条
   
   
#### 后端没啥好说的curd
  *  jwt 前后端分离下身份验证
  *  redis 缓存热点文章 异步队列处理提交评论解析ip用户的地址信息(守护进程消费)
  *  使用了自己开发的包实现了第三方登录 [thirdparty_oauth](https://github.com/pl1998/thirdparty_oauth)
  * dcat-admin快速开发的管理后台
  * 评论curd
  
 
 #### 关于搭建 
 
  * [前端源码](/app/)
  * [后端源码](/apiblog/)
  
#### 工具🔧  
  * [vue3](https://www.vue3js.cn/docs/zh)
  * [element-plus](https://github.com/element-plus/element-plus)
  * [laravel8.x](https://learnku.com/docs/laravel/8.x/upgrade/9352)
  
#### 前端UI参考
  * [炫酷ui](https://88250.b3log.org/)
  * [简洁ui](https://www.louislivi.com/)
  *

 
#### 前端安装集成

  * 前端
```shell script
   //全局配置文件 存放第三方登录一些key 以及后台接口
   .env
   .env.development
   .env.production
```  
  * 前端安装
  ```shell script
npm install
npm run serve //热开发 加载.env.development配置文件
npm run build:prod //打包发布 加载 .env.production配置文件
```

#### 后端安装集成(记得将sql文件(latent_blog)导入并配置好数据库和redis)
  * .env 配置(已经配置好了)

```shell script
BROADCAST_DRIVER=log 
CACHE_DRIVER=array 
QUEUE_CONNECTION=sync //异步
SESSION_DRIVER=redis //redis驱动
SESSION_LIFETIME=120

```
  * 启动 
```shell script
cp .env.example .env
composer install
php artisan key:gen
php artisan serve --port 9091
```   
#### 后台消费队列(正式环境用守护进程维护就行)
```shell script
php artisan queue:work redis --sleep=3
```

#### 更新日志 
  * 2021-04-17 新增用户评论所属区域显示 新增归档a链接 新增评论删除模型监听
  * 2021-04-20 新增文章图片跳转 新增二级评论
  
