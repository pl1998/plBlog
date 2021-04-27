/**
 * Api 统一管理
 */
import {get} from './http'

export const getArticles = p => get('/article', p);
export const getArticle = id => get('/article/'+id);
