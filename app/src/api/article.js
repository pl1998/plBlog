import axios from "axios";
var baseUrl = process.env.VUE_APP_BASE_API


export default {
    /**
     * 文章列表
     * @param {*} data 
     */
    getArticles:function(data){
        return axios.get(baseUrl+'/article',{
            params:data
        })
    },
    /**
     * 文章详情
     * @param {*} data 
     */
    getArticle:function(id){
        return axios.get(baseUrl+'/article/'+id)
    },
    /**
     * 热门文章
     */
    getHots:function(){
        return axios.get(baseUrl+'/ho_list')
    },
    ArticleArchive:function(){
        return axios.get(baseUrl+'/article_archive')
    }

} 