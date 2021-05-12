<template>
<el-row v-if="style=='element'" :gutter="20">
  <el-col :xs="1" :sm="2" :lg="4"></el-col>
  <el-col  :xs="22" :sm="20" :lg="16">
     <div class="card card-content mt-3" :key="list.id" v-for="list in lists">
          <h5>
            <router-link
              class="title float-left text-left"
              :to="`/article/` + list.id"
              >{{ list.title }}</router-link
            >
          </h5>
  
          <div class="row bg">
            <div class="col-12 text-left description">
              {{ list.description }}
            </div>
          </div>
          <div class="button is-size-7">
            <span class="float-left">
              <i class="fa fa-user mr-2"></i>Latent&nbsp;&nbsp;
            </span>
            <span class="float-left">
              <i class="fa fa-calendar mr-2"></i
              >{{ list.created_at }}&nbsp;&nbsp;
            </span>
            <span class="float-left">
              <i class="fa fa-eye mr-2"></i>{{ list.review_count }}&nbsp;&nbsp;
            </span>
            <span class="float-left">
              <i class="fa fa-comments mr-2"></i
              >{{ list.browse_count }}&nbsp;&nbsp;
            </span>
          </div>
        </div>
         <Pagination
          :currentPage="currentPage"
          :total="total"
          @handleCurrentChange="handleCurrentChange"
          @handleSizeChange="handleSizeChange"
        />
  </el-col>
  <el-col :span="4"></el-col>
</el-row>
  <div v-else class="container">
    <div class="row">
      <LeftSidebar></LeftSidebar>
      <div class="col-sm-6 m-0">
        <div class="card card-content animate__animated animate__zoomIn" :key="list.id" v-for="list in lists">
          <h5>
            <router-link
              class="title float-left text-left"
              :to="`/article/`+list.id"
              >{{ list.title }}</router-link
            >
          </h5>
          <div class="label">
            <a
              @click="setKeyword(list.label)"
              class="btn btn-danger float-left"
              >{{ list.label }}</a
            >
          </div>
          <div class="row bg">
            <div class="col-7 text-left description">
              {{ list.description }}
            </div>
            <div class="col-5">
              <img :src="list.cover_img" />
            </div>
          </div>
          <div class="button is-size-7 ">
            <span class="float-left">
              <i class="fa fa-user mr-2"></i>Latent&nbsp;&nbsp;
            </span>
            <span class="float-left">
              <i class="fa fa-calendar mr-2"></i
              >{{ list.created_at }}&nbsp;&nbsp;
            </span>
            <span class="float-left">
              <i class="fa fa-eye mr-2"></i>{{ list.review_count }}&nbsp;&nbsp;
            </span>
            <span class="float-left">
              <i class="fa fa-comments mr-2"></i
              >{{ list.browse_count }}&nbsp;&nbsp;
            </span>
          </div>
        </div>
        <Pagination
          :currentPage="currentPage"
          :total="total"
          @handleCurrentChange="handleCurrentChange"
          @handleSizeChange="handleSizeChange"
        />
      </div>
      <div class="col-sm-3 m-1">
        <div class="card card-content animate__animated animate__zoomIn">
          <h5 class="menu-h3 text-left">热门文章</h5>
          <article class="media" v-for="hot in hots" :key="hot.id">
            <a href="">
              <img style="width: 100px; height: 60px" :src="hot.cover_img" />
            </a>
            <div class="media-content p-1 text-left">
              <div class="content">
                <time>{{ hot.created_at }}</time>
              </div>
              <router-link :to="`/article/` + hot.id">
                {{ hot.title }}
              </router-link>
            </div>
          </article>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Pagination from "@/components/layouts/Pagination";
import LeftSidebar from "@/components/layouts/LeftSidebar";
import { mapState } from "vuex";
import ArticleApi from "@/api/article";
// import { getArticles } from '@/request/api';// 导入我们的api接口

export default {
  components: { Pagination, LeftSidebar },
  computed: {
    ...mapState(["hots","style"]),
  },
  watch:{
    $route(){
       this.data.categoryId = this.$route.query.categoryId
      this.data.keywords = this.$route.query.keywords
       this.getList()
    }
  },
  data() {
    return {
      pageSize: 10,
      currentPage: parseInt(this.$route.query.page)
        ? parseInt(this.$route.query.page)
        : 1,
      total: 0,
      lists: [],
      data: {
        pageSize: 10,
        page: parseInt(this.$route.query.page)
          ? parseInt(this.$route.query.page)
          : 1,
        keywords:this.$route.query.keywords,
        categoryId:this.$route.query.categoryId
      },
    };
  },
  methods: {
    getList() {
      ArticleApi.getArticles(this.data).then((response) => {
        const { data } = response;
        this.lists = data.list;
        this.total = data.meta.total;
      });
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.data.page = this.currentPage;
      this.$router.push({ path: "/#", query: { page: val } });
      this.getList();
    },
    handleSizeChange(val) {
      this.data.pageSize = val;
    },
    setKeyword(val) {
      this.$router.push({
        path: "/#",
        query: { page: this.currentPage, keywords: val },
      });
      this.data.keywords = val;
      this.getList();
    },
  },
  mounted:function(){
     this.getList();
    this.$store.dispatch("getHotList");
  }
};
</script>

<style lang="scss">
//@media (min-width: 1200px) {
//  .container {
//    max-width: 1380px;
//  }
//}
//@media (min-width: 1400px) {
//  .container {
//    max-width: 1380px;
//  }
//}
</style>
