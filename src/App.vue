<template>
  <div id="app">
    <header-component></header-component>
    <router-view></router-view>
  </div>
</template>

<script>
import HeaderComponent from '@/components/header/Header'

export default {
  name: 'app',
  components: { HeaderComponent },
  watch: {
    '$route' (to, from) {
      if (from.name === 'Busca') {
        this.$store.commit('setQuery', '')
      }
    }
  }
}
</script>

<style lang="sass">
.icon-pointer
  cursor: pointer

#app
  margin-bottom: 20px

.vue-tooltip
  &.custom-white
    z-index: 999
    background-color: white
    color: black
    background-color:white
    
    .tooltip-arrow
      border-color: white
      color: black
      background-color:white
</style>
