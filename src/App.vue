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
  components: { HeaderComponent }
}
</script>

<style>
.icon-pointer {
  cursor: pointer;
}
</style>
