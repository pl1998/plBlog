import { createStore } from "vuex";
import ArticleApi from '../api/article'
import authApi from '../api/auth'
import topicApi from '../api/topic'
import { ElMessage } from 'element-plus'
export default createStore({
  state: {
    articles: [],
    hots: [],
    article: undefined,
    content: undefined,
    archives: [],
    auth: localStorage.getItem('auth') || false,
    users: localStorage.getItem('users') ? JSON.parse(localStorage.getItem('users')) : false,
    token: undefined,
    topics:[],
    isTopic:false
  },
  mutations: {
    updateArticles(state, list) {
      state.articles = list;
    },
    updateArticle(state, data) {
      state.article = data;
    },
    updateContent(state, data) {
      state.content = data;
    },
    updatehots(state, list) {
      state.hots = list;
    },
    updateArticleArchive(state, list) {
      state.archives = list;
    },
    updateUsers(data) {
      localStorage.setItem('users', data, 7200)
    },
    delAuth(state,auth){
      localStorage.removeItem('auth')
      state.auth = auth
      localStorage.removeItem('users')
      state.users = []
      localStorage.removeItem('token')
      state.token = undefined
    },
    setAuth(state,auth){
      state.auth = auth
      localStorage.setItem('auth', true, 7200)
    },
    setUsers(state,users){
      state.users = users
      localStorage.setItem('users', users, 7200)
    },
    setToken(state,token){
      state.token = token
      localStorage.setItem('token', token, 7200)
    },
    updateTopics(state,topics){
      state.topics = topics
    },
    updateIsTopics(state,isTopic){
      state.isTopic = isTopic
    },
    updateAuth(auth) {
      localStorage.setItem('auth', auth, 7200)
    },
    updateToken(token) {
      localStorage.setItem('token', token, 7200)
    }
  },
  actions: {

    getArticleList({ commit }, data) {
      ArticleApi.getArticles(data)
        .then((response) => {
          const { data } = response.data
          commit('updateArticles', data.list)
        })
    },
    getUsers({commit}) {
      authApi.me(localStorage.getItem('token'))
        .then((response) => {
          let users = JSON.stringify(response.data)
          commit('setUsers',users)
          commit('setAuth',true)
        })
    },
    getArticles({ commit }, id) {
      ArticleApi.getArticle(id)
        .then((response) => {
          const { data } = response.data
          commit('updateArticle', data)
          commit('updateContent', data.content)
        })
    },
    userLogout({ commit }) {
      let token = localStorage.getItem('token')
      commit('delAuth',false)
      authApi.logout(token)
        .then((response) => {
          const {data} =  response.data
          console.log(data)
          ElMessage('退出登录成功')
        })
    },
    getHotList({ commit }) {
      ArticleApi.getHots()
        .then((response) => {
          const { data } = response.data
          commit('updatehots', data)
        })
    },
    getArticleArchive({ commit }) {
      ArticleApi.ArticleArchive()
        .then((response) => {
          const { data } = response.data
          commit('updateArticleArchive', data)
        })
    },
    getTopicsList({commit},id)
    {
      topicApi.getTopics(id)
      .then((response) => {
        const { data } = response.data
        console.log(Object.keys(data))
         if(Object.keys(data).length!=0){
          commit('updateTopics',data)
          commit('updateIsTopics',true)
         
         }
      })
    }
  },
  getters: {
    fullInfo(state) {
      return `${state.name} ${state.age} ${state.sex}`;
    },
  },
});
