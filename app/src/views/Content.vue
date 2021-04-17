<template>
  <div class="container" v-wechat-title="article.title">
    <div class="row">
      <LeftSidebar></LeftSidebar>
      <div class="col-sm-8 m-2 text-left bg">
        <el-skeleton v-if="!loading" :rows="20" animated />
        <div v-else>
          <div class="bg">
            <h2 class="mt-3">{{ article.title }}</h2>
            <div class="button is-size-7 mt-3">
              <span class="float-left">
                <i class="fa fa-user mr-2"></i>Latent&nbsp;&nbsp;
              </span>
              <span class="float-left">
                <i class="fa fa-calendar mr-2"></i
                >{{ article.created_at }}&nbsp;&nbsp;
              </span>
              <span class="float-left">
                <i class="fa fa-eye mr-2"></i
                >{{ article.review_count }}&nbsp;&nbsp;
              </span>
              <span class="float-left">
                <i class="fa fa-comments mr-2"></i
                >{{ article.browse_count }}&nbsp;&nbsp;
              </span>
            </div>
          </div>
          <br />
          <div class="label mt-1">
            <router-link
              :to="`/article?keywords` + article.label"
              class="btn btn-danger float-left"
              >{{ article.label }}</router-link
            >
          </div>
          <br />
          <br />
          <div
            class="vditor-reset"
            id="vditorPreview"
            v-highlight
            v-html="article.content"
          ></div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-2 m-2 p-2"></div>
      <div class="col-sm-8 bg m-2 p-4">
        <h5 class="text-left">评论</h5>
        <el-form
          :inline="true"
          :model="form"
          :rules="rule"
          class="demo-form-inline"
        >
          <el-form-item>
            <img
              v-if="auth"
              class="login-avatar"
              :src="users.avatar"
              :title="users.name"
            />
          </el-form-item>
          <el-form-item>
            <el-input
              style="width: 560px"
              type="textarea"
              v-on:input="markdown2Html"
              v-model="form.comments"
              :placeholder="commentValue"
              :disabled="!auth"
            ></el-input>
          </el-form-item>
          <br />
          <el-form-item>
            <div class="review container" v-html="html" v-highlight></div>
          </el-form-item>
          <el-button
            class="float-right"
            @click="submit"
            type="primary"
            :disabled="!auth"
            plain
            >{{ btnValue }}</el-button
          >

        </el-form>
      </div>
    </div>

    <!-- 评论组件 -->
    <div class="row">
      <div class="col-sm-2 m-2 p-2"></div>
      <div class="col-sm-8 bg m-2 p-2">
        <el-empty v-if="!isTopic" description="暂无评论"></el-empty>
        <div class="commons text-left" v-for="topic in topics" :key="topic.id">
          <div class="commons-header">
            <div class="">
              <div class="float-left">
                <img class="login-avatar" :src="topic.user.avatar" />
              </div>
              <div class="float-left pl-1" style="">
                <span class="name">{{ topic.user.name }}</span>
              </div>
              <div class="float-left pl-1">
                <span class="time">{{ topic.created_at }}</span>
              </div>
            </div>
          </div>
          <br />
          <div class="commons-prview m-2">
            <div class="vditor-reset" v-highlight v-html="topic.content"></div>

          </div>
           <br />
           <div class="commons-footer">

             <i v-if="users.id == topic.user.id" class="fa fa-trash" @click="del(topic.id)"></i>
           </div>
        </div>
      </div>
    </div>
    <DialogLogin :show="show" :before-close="handleClose"></DialogLogin>
  </div>
</template>
<script>
import LeftSidebar from "@/components/layouts/LeftSidebar";
import Api from "../api/article";
import topicApi from "../api/topic";
import marked from "marked";
import { mapState } from "vuex";
import DialogLogin from "../components/DialogLogin";
import { ElMessage } from "element-plus";
import "vditor/dist/index.css";
export default {
  components: { LeftSidebar, DialogLogin },
  computed: {
    ...mapState(["users", "auth", "topics", "isTopic"]),
  },
  watch: {
    show() {
      return this.show;
    },
  },
  data() {
    return {
      rule: {
        comments: [{ required: true, message: "请输入内容" }],
      },
      html: "",
      articleId: this.$route.params.id,
      topidId: "",
      article: [],
      loading: false,
      show: false,
      commentValue: localStorage.getItem("auth") ? "请输入" : "请登录在评论--",
      btnValue: localStorage.getItem("auth") ? "提交" : "请登录",
      form: {
        comments: undefined,
      },
      formInline: {
        user: "",
        region: "",
      },
    };
  },
  created() {
    this.getArticle();
    this.getTopcs(this.articleId);
  },
  methods: {
    del(id){
       this.$confirm('是否删除评论?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.delTopic(id)
          this.getTopcs(this.articleId);
        })
    },
    delTopic(id)
    {
        topicApi.delTopics(id)
      .then((response) => {
            const { code, data, message } = response.data;
            if (code == 200) {
              ElMessage("删除成功");
              this.getTopcs(this.articleId);
            } else {
              ElMessage(message);
            }
          })
          .catch((error) => {
            ElMessage("失败");
          });
    },
    markdown2Html() {
      import("showdown").then((showdown) => {
        const converter = new showdown.Converter();
        this.html = converter.makeHtml(this.form.comments);
      });
    },
    submit() {
      if (this.form.comments == undefined) {
        ElMessage("内容过低");
      } else {
        let data = { article_id: this.articleId, contents: this.html };
        topicApi
          .createTopics(data)
          .then((response) => {
            const { code, data, message } = response.data;
            if (code == 200) {
              ElMessage("评论成功");
              this.getTopcs(this.articleId);
            } else {
              ElMessage(message);
            }
          })
          .catch((error) => {
            console.log(error)
            ElMessage("失败");
          });
      }
    },
    handleClose(done) {
      this.show = false;
      done();
    },
    isLogin() {
      if (this.auth == false) {
        this.show = true;
      } else {
        this.show = false;
      }
    },
    comments() {},
    getArticle() {
      Api.getArticle(this.articleId)
        .then((response) => {
          const { data } = response.data;
          data.content = marked(data.content);
          this.article = data;
          this.loading = true;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getTopcs(id) {
      this.$store.dispatch("getTopicsList", id);
    },
  },
};
</script>
<style lang="scss" scoped>
.commons {
  border: 1px dashed rgb(204, 204, 204);
  padding: 5px 5px 5px 5px;
  margin: 5px 0px 5px 0px;
  .commons-header {
    .name {
      font-size: 0.9em;
      color: rgba(0, 0, 0, 0.87);
      font-weight: 700;
    }

    .time {
      color: #a5a5a5 !important;
      font-size: 0.8em;
    }
  }
}
.review {
  width: 560px;

  text-align: left;
  border: 1px dashed rgb(204, 204, 204);
  border-radius: 6px;
  padding: 5px 5px 5px 5px;
  display: inline-block;
  *display: inline;
  *zoom: 1;
  margin-left: 105px;
}
</style>
