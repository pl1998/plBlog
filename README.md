## 基于vue3+element-plus+laravel8.x构建的前后端分离的博客应用

#### 前端UI参考
 * [炫酷ui](https://88250.b3log.org/)
 * [简洁ui](https://www.louislivi.com/)
 
[博客地址](https://pltrue.top/)
#### 实现了一些小功能

* 主题切换

![](https://cdn.learnku.com/uploads/images/202104/27/32593/75p9l93jEn.gif!large)

* 前后端分离下第三方授权登录

![](https://cdn.learnku.com/uploads/images/202104/27/32593/3odHRNEdIO.gif!large)
* 响应式

![最新的博客开源咯](https://cdn.learnku.com/uploads/images/202104/27/32593/Fshu0ybfGF.png!large)


![最新的博客开源咯](https://cdn.learnku.com/uploads/images/202104/27/32593/dKLNrACCAC.png!large)
  * 模仿论坛样式的二级评论(ps 模范不到位 。挺丑的感觉)

![最近写的一个小小博客~~](https://cdn.learnku.com/uploads/images/202104/27/32593/YebDBjnnML.png!large)
 * 评论框监听渲染(这个功能很简单我就不上图了。
 
 
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
    
#### 模块
  * 登录第三方授权+jwt token 授权 使用了自己开发的[第三方登录包](https://github.com/pl1998/thirdparty_oauth) `thirdparty_oauth`
  * 评论模块
  * element组件:时间轴、组件分离、分页 导航栏等组件
  * job队列异步记录访客ip以及地址(守护进程消费)
  * 利用redis有序集合缓存热门排行榜
  * 后台使用了[dcat-admin](https://learnku.com/docs/dcat-admin/2.x)
  * 前端新增主题切换
  * 等待完善...
  
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

#### 后端安装集成(记得将sql文件导入并配置好数据库和redis)
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
  
