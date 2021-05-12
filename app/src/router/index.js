// export default router
import { createRouter, createWebHistory } from 'vue-router'
import store from '../store'
import Home from "../views/Home.vue";
import Content from "../views/Content.vue";
import TimeLine from "../views/TimeLine.vue";
import OpenSource from "../views/OpenSource.vue";

const  routerMap = [
    {
      path: '/',
      name: 'Home',
      component: Home,
      meta:{
        title:'Latent的个人Blog',
      }
    },
    {
      path: '/article/:id',
      component: Content
    },
    {
      path: '/timeline',
      component: TimeLine,
      meta:{
        title:'文章归档 Latent的个人博客',
      }
    },
    {
      path: '/open_source',
      component: OpenSource,
      meta:{
        title:'开源项目 Latent的个人博客',
      }
    }
  ]



const router = createRouter({
    //路由分为 history 模式 hash模式
    history: createWebHistory(),
    routes: routerMap //`routes: routes` 的缩写
})

router.beforeEach((to)=>{
  if(to.query.token != undefined && to.query.token!='' && store.state.auth == false) {
    store.dispatch('getUsers',to.query.token)
    setTimeout(function () {
      let url = location.protocol+'//'+location.host+location.pathname
       history.pushState('','',url)
       location.reload()
  }, 1000);
  }
})

export default router