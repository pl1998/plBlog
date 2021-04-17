<template>
	<footer class="footer">
		<div class="container">
			<div class="row bg">
				<div class="text-left col-6">
				<a href="#"><img style="    border-radius: 90%;" :src="avatar" class="h-10 w-10"></a>
				<div class="">
					<p class="name">latent@2021 潜蛰的个人博客</p>
					<h5><a href="http://www.beian.miit.gov.cn/">备案/许可证编号为:赣ICP备19000975号-1</a></h5>
				</div>
			</div>

			<div class="col-6 text-right-6 footer-logo">
			
				<a href="https://learnku.com/blog/pltrue">
							<img style="width:25px" :src="laravelblog">
				</a>
				<a href="https://laravelacademy.org/">
							<img style="width:25px" :src="laravelacademy">
				</a>
				<a href="https://element-plus.gitee.io/#/zh-CN/component/installation">
					<img  style="width:25px" :src="element">
				</a>
					<a href="https://v4.bootcss.com/docs/components/popovers/">
					<img  style="width:25px" :src="bootstrap">
				</a>
			</div>
			</div>
		</div>
	</footer>
</template>
<script>
import logo from "../../assets/logo.jpg";
import laravelacademy from "../../assets/laravelacademy.png";
import laravelblog from "../../assets/laravel_blog.png"
import element from "../../assets/element.png"
import bootstrap from "../../assets/bootstap.png"
	export default {
		name:"Footer",
		data(){
			return {
				avatar:logo,
				laravelacademy:laravelacademy,
				laravelblog:laravelblog,
				bootstrap:bootstrap,
				element:element
			}
		}
	}
</script>