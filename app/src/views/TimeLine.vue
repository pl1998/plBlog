<template>
  <div class="container mt-3">
    <div v-if="style!='element'" class="row">
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
    <el-row v-else>
       <el-col :xs="1" :sm="2" :lg="4"></el-col>
      <el-col :xs="22" :sm="20" :lg="16">
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
      </el-col>
    </el-row>
  </div>
</template>
<script>
import LeftSidebar from '../components/layouts/LeftSidebar'
import {mapState} from 'vuex'
export default {
  components:{LeftSidebar},
  computed:{
    ...mapState([
      'archives',
      'style'
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
