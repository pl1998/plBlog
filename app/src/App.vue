<template>
  <div id="app">
    <Nav></Nav>
     <!-- <div class="frameset-im">
         <frameset  cols="25%,50%,25%" style="z-index:1000px">
      <frame src="http://im.pltrue.top/login"/>
    </frameset>
     </div> -->
    <router-view v-wechat-title="$route.meta.title"></router-view>
    <el-backtop :bottom="200"> </el-backtop>
    <Footer></Footer>
  </div>
</template>
<script>
import Nav from "@/components/layouts/Nav";
import Footer from "@/components/layouts/Footer";
export default {
  components: { Footer, Nav },
  data() {
    return {
      update: false,
    };
  },
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
   font-family: Helvetica,Arial,PingFang SC,Noto Sans,Roboto,Microsoft Yahei,sans-serif;
  background-color: #f7f7f7;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  text-align: center;
  color: #2c3e50;
  font-family: Muiicons;
  font-weight: normal;
  font-style: normal;
  .frameset-im{
    position: fixed;
    top: 20%;
    z-index: 999;
  }
}
</style>
