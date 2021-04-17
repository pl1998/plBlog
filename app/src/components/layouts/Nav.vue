<template>
  <nav
    class="navbar navbar-expand-lg navbar-light bg-light shadow p-3 mb-5 bg-white rounded topnav"
  >
    <div class="container">
      <a href="/" class="navbar-brand">
        <img class="h-10 w-10" :src="logo" />
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="/?keywords=文章"
              >文章 <span class="sr-only">(current)</span></a
            >
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              分类
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/?keywords=php">PHP</a>
              <a class="dropdown-item" href="/?keywords=Go">GO</a>
              <a class="dropdown-item" href="/?keywords=docker">docker</a>
              <a class="dropdown-item" href="/?keywords=JavaScript"
                >JavaScript</a
              >
            </div>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" :to="`/timeline`">归档</router-link>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <div>
            <el-button @click="show3 = !show3">Click Me</el-button>
            <div style="margin-top: 20px; height: 200px">
              <el-collapse-transition>
                <div v-show="show3">
                  <div class="transition-box">el-collapse-transition</div>
                  <div class="transition-box">el-collapse-transition</div>
                </div>
              </el-collapse-transition>
            </div>
          </div>
          <ul  v-if="auth" class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
              <a
                class="user-name bgnav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <img
                    v-if="users.avatar"
                    :src="users.avatar"
                    class="login-avatar"
                  />
                {{users.name}}
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" @click="logout">退出</a>
                <!-- <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a> -->
              </div>
            </li>
          </ul>
        
          <el-button
            v-else
            @click="login"
            style="border: none"
            icon="el-icon-s-home"
            circle
          ></el-button>
          <Drawer></Drawer>
          <DialogLogin
            :title="已关闭账号注册"
            :show="show"
            :before-close="handleClose"
          ></DialogLogin>
        </form>
      </div>
    </div>
  </nav>
</template>
<script>
import DialogLogin from "../DialogLogin";
import Drawer from "../Drawer";
import logo from "../../assets/logo.jpg";
import { mapState } from "vuex";
import store from '../../store';
export default {
  name: "Nav",
  components: { Drawer, DialogLogin },

  computed: {
    ...mapState(["auth","users"]),
  },

  data() {
    return {
      name: "Latent",
      show: false,
      logo: logo,
      show3: false
    };
  },
  methods: {
    logout()
    {
      this.$confirm('是否退出登录?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
           store.dispatch('userLogout')
        })
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
.user-name{
    font-size: 10px;
    font-weight: bold;
    color: rgba(0,0,0,.5);
}
.user-name:hover{
  text-decoration: none;
}
</style>