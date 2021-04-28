<template>
  <el-row :gutter="20">
    <el-col :xs="1" :sm="2" :lg="4"></el-col>
    <el-col :xs="22" :sm="20" :lg="16">
      <div
        class="card card-content mt-3"
        :key="project.id"
        v-for="(project,key) in projects"
      >
        <div class="span-title">
          <p>
            <span class="span-key">{{key+1+'.'}}</span>
            {{ project.title }}
            <span class="text-left span-tag">{{ project.tag }}</span>
            <a class="span-a" :href="project.github"
              >&nbsp;&nbsp;🏠&nbsp;{{ project.github }}</a
            >
          </p>
          <span class="span-describe">{{ project.describe }}</span>
        </div>
      </div>
    </el-col>
  </el-row>
</template>
<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState(["projects"]),
  },
  mounted() {
    //getSourceList
    this.$store.dispatch("getSourceList");
  },
};
</script>
<style lang="scss" scoped>
.span-title {
  text-align: left;
  float: left;
  color: #77b6ff;
  font-size: 18px;
  font-weight: bold;
}
.span-key{

  color: #738a94;
  font-size: 18px;
  font-weight: bold;
}

.span-tag {
  display: inline-block;
  padding: 3px 5px;
  font: 11px Consolas, Liberation Mono, Menlo, Courier, monospace;
  line-height: 10px;
  color: #794de0;
  vertical-align: middle;
  background-color: #fafbfc;
  border: 1px solid #d1d5da;
  border-radius: 3px;
  box-shadow: inset 0 -1px 0 #d1d5da;
}

.span-a {
  font-size: 13px;
}

.span-describe {
  color: #738a94;
  text-align: left;
  word-wrap: break-word;
  font-size: 17px;
  overflow: hidden;
}
</style>