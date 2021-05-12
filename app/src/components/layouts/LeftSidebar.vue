<template>
<div  class="col-sm-2 m-2 p-2 bg animate__animated animate__zoomIn" style="height: 100%;color:#4a4a4a">
    <h5 class="float-left menu-h3">分类</h5>
    <br />
    <ul class="list-group list-group-flush p-1 bg">
      <router-link :to="`?categoryId=`+category.id" v-for="category in categorys" :key="category.name">
        <li class="list-group-item d-flex justify-content-between align-items-centerm menu-size">
          {{ category.name }}
          <span class="badge badge-primary badge-pill">{{ category.count }}</span>
        </li>
      </router-link>
    </ul>
  </div>
  
</template>
<script>
import { mapState } from "vuex";
export default {
  name:"LeftSidebar",
   computed: {
    ...mapState(["categorys"]),
  },
  created()
  {
     this.$store.dispatch("getcategorys");
  }
};
</script>
<style lang="scss" scoped>
.badge-pill{
    padding-right: .6em;
    padding-left: .6em;
    border-radius: 10rem;
    height: 20px;
    width:25px;
}
</style>
