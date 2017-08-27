<template>
  <div id="button-search">
    <md-layout md-align="center">
      <md-layout md-flex="100" md-align="center">
        <md-button class="md-raised md-primary" @click="fnButton()">Carregar mais vídeos</md-button>
      </md-layout>
    </md-layout>
  </div>
</template>

<script>

export default {
  name: 'ButtonSearch',
  props: {
    fnButton: Function
  }
}
</script>

<style scoped>

</style>
