<template>
  <div id="app">
    <Nav></Nav>
    <router-view  v-wechat-title="$route.meta.title"></router-view>
  <el-backtop :bottom="200">
  </el-backtop>
    <Footer></Footer>
  </div>
</template>
<script>

import Nav from "@/components/layouts/Nav";
import Footer from "@/components/layouts/Footer";
export default {
  components: { Footer, Nav },
  data(){
    return {
      update:false
    }
  }
};
</script>

<style lang="scss">
$icon-font-path: "~bootstrap-sass/assets/fonts/bootstrap/";
@import "~bootstrap/scss/bootstrap";
@import "./style/main.scss";
@import "~animate.css/animate.min.css";
@import "./style/main";
@import "./style/icon";
@import "~font-awesome/css/font-awesome.min.css";
@import "~animate.css";

#app {
  background-color:#f7f7f7;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
