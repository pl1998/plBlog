import {get} from '../request/http'

export default {
    /**
     * 获取用户信息
     * @param {*} data
     */
    me:function(){
        return get('/auth/me')
    },
    /**
     * 清除token
     * @param {*} token
     */
    logout:function(){
        return get('/auth/logout')
    },

    getWebsiteInfo:function()
    {
        return get('/getWebsiteInfo');
    },
    
    getSourceList:function(){
        return get('/getSourceProject')
    }
}
