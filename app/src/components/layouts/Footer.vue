<template>
	<footer class="footer">
		<div class="container">
			<div class="row bg">
				<div class="text-left col-6">
				<a href="#"><img style="    border-radius: 90%;" :src="websiteInfo.logo" class="h-10 w-10"></a>
				<div class="">
					<p class="name">{{websiteInfo.name}}</p>
					<h5><a href="https://www.miit.gov.cn/">备案/许可证编号为:{{websiteInfo.license}}</a></h5>

				</div>
			</div>
			<div class="col-6 text-right-6 footer-logo">
				<a v-for="site in websiteInfo.website" :key="site.title" :title="site.title" :href="site.website_url">
							<img style="width:25px" :src="site.website_img">
				</a>
        <br>

			</div>
			</div>
      <p class="pl-statement">基于MIT协议开源 <a target="_blank" href="https://github.com/pl1998/plBlog">PlBolg</a>  ·  v1.0</p>
		</div>
	</footer>
</template>
<script>
import {mapState} from "vuex";
	export default {
		name:"Footer",
    computed:{
      ...mapState([
        'websiteInfo'
      ])
    },
    mounted() {
      this.$store.dispatch('getWebsiteInfo')
    }
  }
</script>
<style>
.pl-statement{
  font-size: 13px;
}
</style>
