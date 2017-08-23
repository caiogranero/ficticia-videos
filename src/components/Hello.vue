<template>
  <div class="hello">
    <header-component></header-component>
    <videos-list></videos-list>
  </div>
</template>

<script>

import HeaderComponent from '@/components/header/Header'
import VideosList from '@/components/videos/VideosList'

export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  components: {
    HeaderComponent,
    VideosList
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
