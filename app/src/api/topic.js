import axios from "axios";
var baseUrl = process.env.VUE_APP_BASE_API
const service = axios.create({
	headers: {
		'Authorization': 'Bearer '+localStorage.getItem('token')	//	可以是授权凭证用的参数值
	}
});
const qs = require('qs');
export default {
    /**
     * 获取评论列表
     * @param {*} id 
     */
   getTopics:function(id){
       return axios.get(baseUrl+'/topic/'+id)
   },
   /**
    * 删除评论
    * @param {*} id 
    */
   delTopics:function(id){
    return service.delete(baseUrl+'/topic/'+id)
   },
   /**
    * 添加评论
    * @param {*} data 
    */
   createTopics:function(data){
    return service.post(baseUrl+'/topic',qs.stringify(data))
   },
}