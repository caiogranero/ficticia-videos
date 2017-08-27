import Vue from 'vue'
import Router from 'vue-router'
import VideoList from '@/components/search/VideosList'
import Featured from '@/components/featured/Featured'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Destaque',
      component: Featured
    },
    {
      path: '/busca',
      name: 'Busca',
      component: VideoList
    }
  ]
})
