import { createApp } from 'vue'
import App from './App.vue'
//element-ui+puls
import ElementPlus from 'element-plus';
import 'element-plus/lib/theme-chalk/index.css';

//vuex
import store from './store'

//vue-router
import router from './router'
//动画库
import animated from 'animate.css'
//nprogress 进度条功能
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
//渲染页面title
import VueWechatTitle from 'vue-wechat-title'
//进度条配置
NProgress.inc(0.2)
NProgress.configure({ easing: 'ease', speed: 500, showSpinner: false })
router.beforeEach((to,from,next) => {
  NProgress.start()
  next()
})
router.afterEach(() => {
  NProgress.done()
})

//引入bootstrap4样式
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'
//引入markeown
import 'github-markdown-css/github-markdown.css'
import hljs from 'highlight.js'
import 'highlight.js/styles/dracula.css';

//


const app = createApp(App)

// 全局过滤器
app.config.globalProperties.$filters = {
  prefix(url) {
    if (url && url.startsWith('http')) {
      return url
    } else {
      url = `http://backend-api-01.newbee.ltd${url}`
      return url
    }
  }
}


app.use(ElementPlus)
.use(animated)
.use(NProgress)
.use(VueWechatTitle)
.directive('highlight',
function (el) {
  let blocks = el.querySelectorAll('pre code');
  blocks.forEach((block)=>{
    hljs.highlightBlock(block)
  })
})

app.use(router)
app.use(store)

app.mount('#app')
