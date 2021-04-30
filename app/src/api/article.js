import {get} from '../request/http'
export default {
    /**
     * 文章列表
     * @param {*} data 
     */
    getArticles:function(data){
        return get('/article',data)
    },
    /**
     * 文章详情
     * @param {*} data 
     */
    getArticle:function(id){
        return get('/article/'+id)
    },
    /**
     * 热门文章
     */
    getHots:function(){
        return get('/ho_list')
    },
    ArticleArchive:function(){
        return get('/article_archive')
    },
    getCategory:function(){
        return get('/getCategory')
    }

} 