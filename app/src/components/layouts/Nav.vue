<template>
  <div class="menu-nav bg">
    <div class="container">
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
          <!-- <el-button

            @click="login"
            style="border: none"
            icon="el-icon-s-home"
            circle
          ></el-button> -->
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
    ...mapState(["auth", "users"]),
  },

  data() {
    return {
      name: "Latent",
      show: false,
      logo: logo,
      show3: false,
    };
  },
  methods: {
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
</style>
