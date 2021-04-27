import { createStore } from "vuex";
import ArticleApi from '../api/article'
import authApi from '../api/auth'
import topicApi from '../api/topic'
import { ElMessage } from 'element-plus'
import Cookies from 'js-cookie'
export default createStore({
  state: {
    articles: [],
    hots: [],
    article: undefined,
    content: undefined,
    archives: [],
    auth: Cookies.get('auth') ? true : false,
    users: localStorage.getItem('users') ? JSON.parse(localStorage.getItem('users')) : false,
    token: Cookies.get('token') || undefined,
    topics: [],
    isTopic: false,
    websiteInfo: JSON.parse(localStorage.getItem('websiteInfo')) || false,
    projects: localStorage.getItem('projects'),
    style: localStorage.getItem('style') ? localStorage.getItem('style') : 'bootstarp'
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
    updateProject(state, list) {
      state.projects = list
      localStorage.setItem('projects', list)
    },
    updateArticleArchive(state, list) {
      state.archives = list;
    },
    updateUsers(data) {
      localStorage.setItem('users', data, 7200)
    },
    delAuth(state, auth) {
      state.auth = auth
      Cookies.remove('token')
      Cookies.remove('auth')

      localStorage.removeItem('users')
    },
    setAuth(state, auth) {
      state.auth = auth
      Cookies.set('auth', auth, { expires: 604700 })

    },
    setUsers(state, users) {
      state.users = users
      localStorage.set('users', users)
    },
    setToken(state, token) {
      state.token = token
      Cookies.set('token', token, { expires: 604700 })
    },
    updateTopics(state, topics) {
      state.topics = topics
    },
    updateIsTopics(state, isTopic) {
      state.isTopic = isTopic
    },
    updateAuth(state, auth) {
      Cookies.set('auth', auth, { expires: 604700 })
      state.auth = true
    },
    updateToken(token) {
      Cookies.set('token', token, { expires: 604700 })
    },
    updateWebsiteInfo(state, data) {
      state.websiteInfo = JSON.stringify(data)
      localStorage.setItem('websiteInfo', JSON.stringify(data))
    },
    SET_STYLE(state, style) {
      state.style = style
      localStorage.setItem('style', style)
    }
  },
  actions: {
    setTyple({ commit }, style) {
      commit('SET_STYLE', style)
    },
    getWebsiteInfo({ commit }) {
      if (this.state.websiteInfo == false) {
        authApi.getWebsiteInfo()
          .then((response) => {
            const { data } = response
            commit('updateWebsiteInfo', data)
          })
      }
    },
    // getArticleList({ commit }, data) {
    //   ArticleApi.getArticles(data)
    //     .then((response) => {
    //       const { data } = response
    //       commit('updateArticles', data.list)
    //     })
    // },
    getUsers({ commit }, token) {
      Cookies.set('token',token,{ expires: 604700 })
      this.state.token = token
      authApi.me()
        .then((response) => {
          let users = JSON.stringify(response)
          localStorage.setItem('users', users)
          this.state.users = users
          Cookies.set('token', token, { expires: 604700 })
          commit('updateAuth', true)
          ElMessage.success({
            message: '登录成功'
          })
        })
    },
    getSourceList({commit}){
      authApi.getSourceList()
      .then((response) => {
        const { data } = response
        commit('updateProject', data)

      })
    },
    // getArticles({ commit }, id) {
    //   ArticleApi.getArticle(id)
    //     .then((response) => {
    //       const { data } = response
    //       commit('updateArticle', data)
    //       commit('updateContent', data.content)
    //     })
    // },
    userLogout({ commit }) {
      commit('delAuth',false)
      authApi.logout()
        .then((response) => {
          const {data} =  response
          Cookies.remove('token')
          Cookies.remove('auth')
          ElMessage.success({
            message:data.message
          })
        })
    },
    getHotList({ commit }) {
      if (this.state.style == 'bootstarp') {
        ArticleApi.getHots()
          .then((response) => {
            const { data } = response
            commit('updatehots', data)
          })
      }
    },
    getArticleArchive({ commit }) {
      ArticleApi.ArticleArchive()
        .then((response) => {
          const { data } = response
          commit('updateArticleArchive', data)
        })
    },
    getTopicsList({commit},id)
    {
      topicApi.getTopics(id)
      .then((response) => {
        const { data } = response
         if(Object.keys(data).length!=0){
          commit('updateTopics',data)
          commit('updateIsTopics',true)
         }else {
           commit('updateTopics',[])
           commit('updateIsTopics',false)
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
