import Vue from 'vue'
import Router from 'vue-router'
import VideoList from '@/components/pages/Videos'
import Featured from '@/components/pages/Featured'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'Vídeos em destaque',
      component: Featured,
      meta: {
        title: 'Vídeos em destaque'
      }
    },
    {
      path: '/busca',
      name: 'Busca de vídeos',
      component: VideoList,
      meta: {
        title: 'Busca de vídeos'
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  document.title = to.meta.title
  next()
})

export default router
