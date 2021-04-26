<template>
<el-row v-if="style=='element'">
<el-col :span="24">
    <h5 class="float-left menu-h3">分类</h5>
    <br />
    <ul class="list-group list-group-flush p-1 bg">
      <a :href="`?keywords=`+menu.label" v-for="menu in menus" :key="menu.label">
        <li class="list-group-item d-flex justify-content-between align-items-centerm menu-size">
          {{ menu.label }}
          <span class="badge badge-primary badge-pill">{{ menu.value }}</span>
        </li>
      </a>
    </ul>
</el-col>
</el-row>
  <div v-else class="col-sm-2 m-2 p-2 bg" style="height: 100%;color:#4a4a4a">
    <h5 class="float-left menu-h3">分类</h5>
    <br />
    <ul class="list-group list-group-flush p-1 bg">
      <a :href="`?keywords=`+menu.label" v-for="menu in menus" :key="menu.label">
        <li class="list-group-item d-flex justify-content-between align-items-centerm menu-size">
          {{ menu.label }}
          <span class="badge badge-primary badge-pill">{{ menu.value }}</span>
        </li>
      </a>
    </ul>
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
  name:"LeftSidebar",
   computed: {
    ...mapState(["style"]),
  },
  data() {
    return {
      menus: [
        {
          label: "随笔",
          value: 5,
        },
        {
          label: "PHP",
          value: 13,
        },
        {
          label: "Javascript",
          value: 1,
        },
        {
          label: "Golang",
          value: 4,
        },
        {
          label: "Github",
          value: 3,
        },
      ],
    };
  }
};
</script>
