<template>
  <div class="container" v-wechat-title="article.title">
    <div class="row">
      <div class="col-sm-2"></div>
      <!-- <LeftSidebar></LeftSidebar> -->
      <div class=" col-sm-8 m-2 text-left bg  article-preview">

        <!-- article-preview -->
        <el-skeleton v-if="!loading" :rows="20" animated />
        <div v-else>
          <div class="bg">
            <h2 class="mt-3">{{ article.title }}</h2>
            <div class="button is-size-7 mt-3">
              <span class="float-left">
                <i class="fa fa-user mr-2"></i>Latent&nbsp;&nbsp;</span
              >
              <span class="float-left"
                ><i class="fa fa-calendar mr-2"></i
                >{{ article.created_at }}&nbsp;&nbsp;</span
              >
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
              :to="`/?keywords=` + article.label"
              class="btn btn-danger float-left"
              >{{ article.label }}</router-link
            >
          </div>
          <br />
          <br />
          <!-- id="vditorPreview"
            class="vditor-reset" -->
          <!-- editor-preview-side editor-preview-active-side -->
          <div

            @click="proxyImage"
            class="markdown-reply articles article__content"
            v-html="article.content"
            v-highlight
          >
          </div>
           <div class="markdown-reply articles article__content">
             <blockquote>
               <p>最后欢迎👏 关注我的公众号 🔭</p>
             </blockquote>
             <img @click="proxyImage" class="weixin-img" :src="wxImg">
           </div>
        </div>
      </div>
    </div>
    <!-- 评论组件 -->
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8 m-2 bg">
        <el-empty v-if="!isTopic" description="暂无评论"></el-empty>
        <div class="commons" v-for="topic in topics" :key="topic.id">
          <div class="commons-header">
            <div class="float-left">
              <img class="reply-avatar" :src="topic.user.avatar" />
            </div>
            <div class="commons-header-one">
              <div class="float-left pl-1" style="">
                <span class="name">{{ topic.user.name }}</span>
              </div>
              <div class="float-left pl-1" style="">
                <span class="address">{{ topic.address }}</span>
              </div>
              <div class="float-left pl-1">
                <span class="time">{{ topic.created_at }}</span>
              </div>

              <div v-if="users.id != topic.user.id" class="float-right pl-1">
                <el-button
                  href="#reply"
                  size="mini"
                  icon="el-icon-github"
                  class="float-right"
                  @click="
                    onReply({
                      user_id: topic.user_id,
                      id: topic.id,
                      name: topic.user.name,
                    })
                  "
                  type="relay"
                  >回复</el-button
                >
              </div>
            </div>
          </div>
          <br />
          <div class="commons-prview m-2">
            <div
              class="vditor-reset p-2"
              v-highlight
              v-html="topic.content"
            ></div>
          </div>
          <br />
          <div
            v-for="child in topic.childs"
            :key="child.id"
            class="child-commons pl-2"
          >
            <div class="child-commons-header">
              <div class="child-commons-header-one">
                <div class="float-left">
                  <img class="reply-child-avatar" :src="child.user.avatar" />
                </div>
                <div class="float-left pl-1" style="">
                  <span class="name">{{ child.user.name }}</span>
                </div>
                <div class="float-left pl-1" style="">
                  <span class="address">{{ child.address }}</span>
                </div>
                <div class="float-left pl-1">
                  <span class="time">{{ child.created_at }}</span>
                </div>

                <div v-if="users.id != child.user.id" class="float-right pl-1">
                  <el-button
                    href="#reply"
                    size="mini"
                    icon="el-icon-github"
                    class="float-right"
                    @click="
                      onReply({
                        user_id: child.user_id,
                        id: child.id,
                        name: child.user.name,
                      })
                    "
                    type="relay"
                    >回复</el-button
                  >
                </div>
              </div>
            </div>
            <br />
            <div class="child-commons-prview m-2">
              <div
                class="vditor-reset p-2"
                v-highlight
                v-html="child.content"
              ></div>
            </div>
            <div class="child-commons-footer pl-2">
              <i
                itemid=""
                v-if="users.id == child.user.id"
                class="fa fa-trash"
                @click="del(child.id)"
              ></i>
            </div>
          </div>
          <br />
          <div class="commons-footer">
            <i
              itemid=""
              v-if="users.id == topic.user.id"
              class="fa fa-trash"
              @click="del(topic.id)"
            ></i>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8 bg m-2 p-4">
        <h5 class="text-left">评论</h5>
        <el-form
          :inline="true"
          :model="form"
          :rules="rule"
          class="demo-form-inline"
        >
          <el-input
            id="reply"
            type="textarea"
            v-on:input="markdown2Html"
            v-model="form.comments"
            :placeholder="commentValue"
          ></el-input>
          <br />
          <br />
          <el-button
            size="mini"
            icon="el-icon-github"
            class="float-right mb-3"
            @click="submit"
            :loading="submitLoading"
            type="goon"
            >{{ btnValue }}</el-button
          >
          <div class="review container" v-html="html" v-highlight></div>
        </el-form>
      </div>
    </div>
    <DialogLogin :show="show" :before-close="handleClose"></DialogLogin>
  </div>
</template>
<script>
import ArticleApi from "../api/article";
import topicApi from "../api/topic";
import marked from "marked";
import { mapState } from "vuex";
import DialogLogin from "../components/DialogLogin";
import { ElMessage } from "element-plus";
import Cookies from "js-cookie";

export default {
  components: { DialogLogin },
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
      wxImg:process.env.VUE_APP_WX_IMG,
      html: "",
      articleId: this.$route.params.id,
      topidId: "",
      userId: "",
      article: [],
      loading: false,
      submitLoading: false,
      show: false,
      commentValue: "说些什么吧~ 支持markdwn语法",
      btnValue: Cookies.get("auth") ? "提交" : "github登录",
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
    onReply(e) {
      {
        document.querySelector("#reply").scrollIntoView(true);
      }
      this.form.comments = "@" + e.name;
      this.html = "@" + e.name;
      this.topidId = e.id;
      this.userId = e.user_id;
    },
    proxyImage: function (e) {
      if (e.target.tagName.toUpperCase() === "IMG") {
        window.open(e.target.src);
      }
      if (e.target.tagName.toUpperCase() === "PRE") {
        console.log('测试')
      }
    },
    del(id) {
      this.$confirm("是否删除评论?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        this.delTopic(id);
        this.getTopcs(this.articleId);
      });
    },
    delTopic(id) {
      topicApi.delTopics(id).then((response) => {
        const { message } = response;

        ElMessage.success({
          message: message,
        });
        this.getTopcs(this.articleId);
      });
    },
    refresh() {
      Cookies.remove("auth");
      Cookies.remove("token");
    },
    markdown2Html() {
      //默认去去除了@别人
      import("showdown").then((showdown) => {
        const converter = new showdown.Converter();
        this.html = converter.makeHtml(this.form.comments);
      });
    },
    submit() {
      if (Cookies.get("auth") != "true") {
        //测试环境使用gitee登录
        if (process.env.NODE_ENV == "development") {
          window.location.href =
            "https://gitee.com/oauth/authorize?client_id=" +
            process.env.VUE_APP_GITEE_CLIENT_ID +
            "&redirect_uri=" +
            process.env.VUE_APP_GITEE_REDIRECT_URL +
            "&response_type=code";
        } else {
          window.location.href =
            "https://github.com/login/oauth/authorize?client_id=" +
            process.env.VUE_APP_GITHUB_CLIENT_ID +
            "&redirect_uri=" +
            process.env.VUE_APP_GITHUB_REDIRECT_URL;
        }
      } else {
        if (this.form.comments == undefined || this.form.comments == "") {
          ElMessage("内容不能为空");
        } else {
          this.subLoading(true);

          if (this.form.comments.substr(0, 1) != "@") {
            this.topidId = "";
            this.userId = "";
          }

          let data = {
            article_id: this.articleId,
            contents: this.html,
            user_id: this.userId,
            topic_id: this.topidId,
          };
          topicApi.createTopics(data).then((response) => {
            const { message } = response;
            ElMessage.success({ message: message });
            this.subLoading(false);
            this.getTopcs(this.articleId);
          });
        }
      }
    },
    subLoading(bools) {
      if (bools == false) {
        this.form.comments = undefined;
        this.html = undefined;
        this.submitLoading = false;
        this.btnValue = "提交";
      } else {
        this.submitLoading = true;
        this.btnValue = "提交中...";
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
      ArticleApi.getArticle(this.articleId).then((response) => {
        const { data } = response;
        data.content = marked(data.content);
        this.article = data;
        this.loading = true;
      });
    },
    getTopcs(id) {
      this.$store.dispatch("getTopicsList", id);
    },
  },
};
</script>
<style lang="scss" scoped>
.weixin-img{
  border-radius: 5px;
  width: 85%;
  margin-left: 15%;
  border-left: 5px solid #e7ebef;
}
.commons {
  border: 1px solid #ddd;
  padding: 5px 5px 5px 5px;
  margin: 5px 0px 15px 0px;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
  text-align: left;
  background-color: #fff;

  .commons-header {
    .commons-header-one {
      .name {
        font-size: 0.9em;
        color: rgba(0, 0, 0, 0.87);
        font-weight: 700;
      }
      .time {
        color: #a5a5a5 !important;
        font-size: 0.7em;
      }
      .address {
        font-size: 0.8em;
      }
    }
  }
}

.commons::before {
  top: 11px;
  right: 100%;
  left: 44px;
  display: block;
  width: 0;
  height: 0;
  pointer-events: none;
  content: " ";
  border-color: transparent;
  border-style: solid solid outset;
  border-width: 8px;
  border-right-color: #d4e0e8;
  margin-left: -40px;
}

.review {
  //width: 568px;
  text-align: left;
  border: 1px dashed rgb(204, 204, 204);
  border-radius: 6px;
  padding: 5px 5px 5px 5px;
  display: inline-block;
  *display: inline;
  *zoom: 1;
  //margin-left: 33px;
}

// 重写button样式
.el-button--goon.is-active,
.el-button--goon:active {
  background: #6190e8;
  border-color: #6190e8;
  color: #fff;
}

.el-button--goon:focus,
.el-button--goon:hover {
  background: #6190e8;
  border-color: #6190e8;
  color: #fff;
}

.el-button--goon {
  color: #fff;
  background-color: #6190e8;
  border-color: #6190e8;
}
//#23b7e5

// 重写button样式
.el-button--relay.is-active,
.el-button--relay:active {
  background: #23b7e5;
  border-color: #23b7e5;
  color: #fff;
}

.el-button--relay:focus,
.el-button--relay:hover {
  background: #83c2d4;
  border-color: #83c2d4;
  color: #fff;
}

.el-button--relay {
  color: #fff;
  background-color: #23b7e5;
  border-color: #23b7e5;
}

.child-commons {
  border-top: 1px dashed rgb(204, 204, 204);
  padding: 5px 5px 5px 5px;
  margin: 5px 0px 5px 0px;
  .child-commons-header {
    .name {
      font-size: 0.9em;
      color: rgba(0, 0, 0, 0.87);
      font-weight: 700;
    }
    .time {
      color: #a5a5a5 !important;
      font-size: 0.7em;
    }
    .address {
      font-size: 0.8em;
    }
  }
  .row-bg {
    background-color: #f7f7f7;
  }
}
</style>
