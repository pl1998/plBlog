<template>
  <div class="pagination">
    <el-pagination 
    style="margin:0 auto"
        background
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        layout="pager"
        :current-page="currentPage"
        :total="total">
    </el-pagination>
  </div>
</template>

<script>
export default {
  name: "Pagination",
  data() {
    return {
      background:true
    }
  },
  props: {
    'currentPage':{
      required: false,
      default: 1
    },
    //总条数
    'total': {
      required: false,
      default: 0
    },
    // 没页显示多少数据
    'limit': {
      required: false,
      default: 10
    },
    //是否使用小型分页样式
    'small': {
      required: false,
      type: Boolean,
      default: false
    }
  },
  watch: {
    currentPage(val) {
      console.log(val)
      if(val ==undefined || val=='') {
         this.$emit("currentPage",  parseInt(this.$route.query.page) ? this.$route.query.page :1);
      }else{
        this.$emit("currentPage",  parseInt(val));
      }

     
    },
  },
  methods: {
    // 当前页变化
    handleCurrentChange(val) {
      this.$emit("handleCurrentChange", val);
    },
    // size变化
    handleSizeChange(val) {
      this.$emit("currentPage",  1);
      this.$emit('handleSizeChange', val);
    },
  }
}
</script>

<style lang="scss">
.pagination {
  margin: 20px 0;
  text-align: center;
}

.sysBox .el-pagination.is-background .el-pager li:not(.disabled).active {
  background-color: #f56c6c;   
  color: #fff;
}

</style>
