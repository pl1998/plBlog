<template>
  <div class="container">
    <div class="row">
      <LeftSidebar></LeftSidebar>
      <div class="col-sm-6 m-0">
        <div class="block">
          <el-timeline >
            <el-timeline-item
                v-for="archive in archives" :key="archive.id"
                :timestamp="archive.created_at"
                :icon="archive.icon"
                :type="archive.type"
                :color="archive.color"
                :size="archive.size"
                placement="top">
             <a :href="`/article/`+archive.id">
               <el-card>
                 <div class="row bg">
                   <div class="col-sm-4">
                     <img :src="archive.cover_img" style=" width:120px;height: 80px;">
                   </div>
                   <div class="col-sm-8">
                     <p class="is-size-7 text-left">{{archive.title}}</p>

                   </div>

                 </div>
                 <p></p>

               </el-card>
             </a>
            </el-timeline-item>
          </el-timeline>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import LeftSidebar from '../components/layouts/LeftSidebar'
import {mapState} from 'vuex'
export default {
  components:{LeftSidebar},
  computed:{
    ...mapState([
      'archives'
    ])
  },
  data() {
    return {};
  },
  methods: {
    getList(){
       this.$store.dispatch('getArticleArchive')
    }
  },
   mounted() {
      this.$store.dispatch('getArticleArchive')
  }
}
</script>
