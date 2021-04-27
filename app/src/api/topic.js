import {get,del,post} from '../request/http'

export default {
    /**
     * 获取评论列表
     * @param {*} id 
     */
   getTopics:function(id){
       return get('/topic/'+id)
   },
   /**
    * 删除评论
    * @param {*} id 
    */
   delTopics:function(id){
    return del('/topic/'+id)
   },
   /**
    * 添加评论
    * @param {*} data 
    */
   createTopics:function(data){
    return post('/topic',data)
   },
}