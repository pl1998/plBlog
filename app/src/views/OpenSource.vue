<template>
    <div class="container">
       <el-row>
       
       </el-row>
    </div>
</template>
<script>
import { mapState } from "vuex";
export default {
      computed: {
    ...mapState(["projects"]),
  },
}
</script>