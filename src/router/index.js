import Vue from 'vue'
import Router from 'vue-router'
import VideoList from '@/components/pages/Videos'
import Featured from '@/components/pages/Featured'

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
