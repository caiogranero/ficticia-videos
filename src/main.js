// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import VueMaterial from 'vue-material'
import Tooltip from 'vue-directive-tooltip'
import 'vue-material/dist/vue-material.css'
import 'vue-directive-tooltip/css/index.css'

Vue.config.productionTip = false
Vue.use(Tooltip)
Vue.use(VueMaterial)

import AppServices from './services'
Object.keys(AppServices).forEach(k => Vue.use(AppServices[k]))

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})
