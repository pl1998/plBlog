<template>
  <div :class="['menu-nav', 'bg', style == 'element' ? 'nav-h' : '']">
    <div class="menu-h" v-if="style == 'element'">
      <div class="float-right mt-4">
        <el-button
          size="small"
          class="mr-4"
          type="menu"
          icon="el-icon-s-fold"
          @click="Collapse"
          >menu</el-button
        >
      </div>

      <div class="m-4">
        <el-menu
          default-active="1-4-1"
          class="el-menu-vertical-demo menu-hidden"
          @open="handleOpen"
          @close="handleClose"
          :collapse="isCollapse"
        >
          <el-menu-item index="1">
            <i class="el-icon-s-home"></i>
            <template #title> <a href="/?keywords=">首页</a></template>
          </el-menu-item>
          <!-- <el-menu-item index="1">
            <i class="el-icon-s-help"></i>
            <template #title> <a href="/?keywords=">文章</a></template>
          </el-menu-item> -->

          <el-submenu index="2">
            <template #title>
              <i class="el-icon-star-on"></i>
              <span>分类</span>
            </template>
            <el-menu-item index="2-1">
              <template #title>
                <a class="a-text" href="/?keywords=php">PHP</a>
              </template>
            </el-menu-item>
            <el-menu-item index="2-2">
              <template #title>
                <a class="a-text" href="/?keywords=Go">Go</a>
              </template>
            </el-menu-item>
            <el-menu-item index="2-3">
              <template #title>
                <a class="a-text" href="/?keywords=Js">Js</a>
              </template>
            </el-menu-item>
            <el-menu-item index="2-4">
              <template #title>
                <a class="a-text" href="/?keywords=Js">Js</a>
              </template>
            </el-menu-item>
          </el-submenu>
          <el-menu-item index="3">
            <i class="el-icon-s-order"></i>
            <template #title>归档</template>
          </el-menu-item>
          <el-menu-item index="4">
            <i class="el-icon-s-cooperation"></i>
            <template #title>开源</template>
          </el-menu-item>

          <el-menu-item index="5">
            <template #title>
              <i
                @click="setStyle"
                class="fa fa-power-off"
                aria-hidden="true"
              ></i
              >&nbsp;&nbsp;{{ style == "element" ? "酷炫" : "简约" }}
            </template>
          </el-menu-item>
        </el-menu>
      </div>
    </div>
    <div v-if="style == 'element'" class="container">
      <div class="blog-title">
        <h2 class="h-size">latent的个人博客</h2>
        <p class="p-size">不成大牛,不改个签</p>
      </div>
      <Vue-Canvas id="canvas" :options="options"></Vue-Canvas>
    </div>
    <div v-else class="container">
      <el-menu
        :default-active="activeIndex"
        class="menu el-menu-demo mb-5"
        style="border: none"
        mode="horizontal"
        @select="handleSelect"
      >
        <el-menu-item index="0">
          <router-link :to="`/`">
            <img class="h-10 w-10" :src="logo" />
          </router-link>
        </el-menu-item>
        <el-menu-item index="1">
          <a href="/?keywords=">文章</a>
        </el-menu-item>
        <el-submenu index="2">
          <template #title>分类</template>
          <el-menu-item index="2-1"
            ><a class="a-text" href="/?keywords=php">PHP</a></el-menu-item
          >
          <el-menu-item index="2-2"
            ><a class="a-text" href="/?keywords=Go">Go</a></el-menu-item
          >
          <el-menu-item index="2-3"
            ><a class="a-text" href="/?keywords=Js">Js</a></el-menu-item
          >
          <el-menu-item index="2-3"
            ><a class="a-text" href="/?keywords=Linux">Linux</a></el-menu-item
          >
        </el-submenu>
        <el-menu-item index="3">
          <router-link :to="`/timeline`">归档</router-link>
        </el-menu-item>
        <el-menu-item index="4"
          ><router-link :to="`/open_source`">开源</router-link></el-menu-item
        >
        <el-menu-item class="float-right" index="8">
          <Drawer></Drawer>
        </el-menu-item>
        <el-menu-item class="float-right" index="5" v-if="auth">
          <el-submenu index="6">
            <template #title
              ><img
                v-if="users.avatar"
                :src="users.avatar"
                class="login-avatar"
              />
              {{ users.name }}
            </template>
            <el-menu-item @click="logout" index="6-1"
              ><i class="fa fa-sign-in"></i>退出登录</el-menu-item
            >
          </el-submenu>
        </el-menu-item>
        <el-menu-item v-else class="float-right" index="7">
          <button class="btn btn-lg btn-default" @click="login">
            <i class="fa fa-home"></i>
          </button>
        </el-menu-item>
        <el-menu-item class="float-right" index="9">
          <i @click="setStyle" class="fa fa-power-off" aria-hidden="true"></i
          >&nbsp;&nbsp;{{ style == "element" ? "酷炫" : "简约" }}
        </el-menu-item>
      </el-menu>
    </div>
  </div>
  <DialogLogin
    :title="已关闭账号注册"
    :show="show"
    :before-close="handleClose"
  ></DialogLogin>
  <div class="line"></div>
</template>
<script>
import DialogLogin from "../DialogLogin";
import Drawer from "../Drawer";
import logo from "../../assets/logo.jpg";
import { mapState } from "vuex";

import store from "../../store";
export default {
  name: "Nav",
  components: { Drawer, DialogLogin },

  computed: {
    ...mapState(["auth", "users", "style"]),
  },
  data() {
    return {
      isCollapse: true,
      btnValue: "隐藏",
      options: {
        color: "rgba(225,225,225,0.5)", //气泡颜色
        radius: 15, //气泡半径
        densety: 0.4, // 气泡密度 越大越密集(建议不要大于1)
        clearOffset: 0.3, // 气泡消失距离[0-1] 越大越晚消失
      },
      name: "Latent",
      show: false,
      logo: logo,
    };
  },
  methods: {
    Collapse() {
      this.isCollapse = !this.isCollapse;
    },
    handleOpen2(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose2(key, keyPath) {
      console.log(key, keyPath);
    },
    setStyle() {
      let style =
        localStorage.getItem("style") == "bootstarp" ? "element" : "bootstarp";
      store.dispatch("setTyple", style);
    },
    logout() {
      this.$confirm("是否退出登录?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        store.dispatch("userLogout");
      });
    },
    handleClose(done) {
      this.show = false;
      done();
    },
    login() {
      if (this.show == false) {
        this.show = true;
      } else {
        this.show = false;
      }
    },
  },
};
</script>
<style lang="scss">
.menu-nav {
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
  .menu {
    border: none;
    .a-text {
      width: 100%;
      height: 100%;
      display: block;
    }
  }
}

.user-name {
  font-size: 10px;
  font-weight: bold;
  color: rgba(0, 0, 0, 0.5);
}
.user-name:hover {
  text-decoration: none;
}

.transition-box {
  margin-bottom: 10px;
  width: 200px;
  height: 100px;
  border-radius: 4px;
  background-color: #409eff;
  text-align: center;
  color: #fff;
  padding: 40px 20px;
  box-sizing: border-box;
  margin-right: 20px;
}
.nav-h {
  background: url("../../assets/header-bg.jpg") no-repeat 50%;
  height: 852px;
  background-repeat: no-repeat;
  overflow: hidden;
  background-size: cover;
  position: relative;
}
.menu-h {
  position: absolute;
  top: 0px;
  left: 0px;
  z-index: 2;
  height: 100%;
  width: 100%;
}

.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
.menu-hidden {
  opacity: 0.8;
  background-color: #5d5858;
  color: #fff;
}

// 重写button样式
.el-button--menu.is-active,
.el-button--menu:active {
  opacity: 0.8;
  color: #fff;
}

.el-button--menu:focus,
.el-button--menu:hover {
  opacity: 0.8;
  color: #fff;
}

.el-button--menu {
  opacity: 0.8;
  background-color: #5d5858;
  border: 1px solid hsla(0, 0%, 100%, 0.6);
  color: #fff;
  transition: left 0.3s ease;
  text-transform: uppercase;
  border-radius: 3px;
}
.blog-title {
  height: 100%;
  width: 100%;
  align-items: center;
  display: flex;
  top: 0px;
  left: 0px;
  position:absolute;
  justify-content: center;
  flex-direction: column;
  .h-size {
    etter-spacing: -1px;
    font-weight: 700;
    font-size: 45px;
    color: #fff;
  }
  .p-size{
     etter-spacing: -1px;
    font-weight: 400;
    font-size: 20px;
    color: #fff;
  }
}
</style>
