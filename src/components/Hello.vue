<template>
  <div class="hello">
    <header-component></header-component>
  </div>
</template>

<script>

import HeaderComponent from '@/components/header/Header'

export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  created () {
    this.$YoutubeService.get({q: 'EACH-USP'}).then(res => {
      console.log(res)
    })
  },
  components: {
    HeaderComponent
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
