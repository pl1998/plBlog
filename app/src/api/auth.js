import axios from "axios";


var baseUrl = process.env.VUE_APP_BASE_API
export default {
    /**
     * 获取用户信息
     * @param {*} data
     */
    me:function(token){
        return axios.get(baseUrl+'/auth/me',{
            headers:{
                'Authorization':'Bearer '+token,
              }
        })
    },
    /**
     * 清除token
     * @param {*} token
     */
    logout:function(token){
        return axios.get(baseUrl+'/auth/logout',{
            headers:{
                'Authorization':'Bearer '+token,
            }
        })
    },

    getWebsiteInfo:function()
    {
        return axios.get(baseUrl+'/getWebsiteInfo');
    },
    
    getSourceList:function(){
        return axios.get(baseUrl+'/getSourceProject')
    }
}
