<template>
  <md-layout id="header">
    <md-layout md-flex="15"></md-layout>
    <md-layout md-flex="40" md-align="start">
      <h1>
        <md-icon class="md-size-2x">play_circle_outline</md-icon>
        Fictícia videos
      </h1>
    </md-layout>
    <md-layout md-flex="15" md-align="end">
      <md-input-container v-if="showSearch">
        <label>Pesquisar</label>
        <md-input v-model="qSearch"></md-input>
      </md-input-container>
    </md-layout>
    <md-layout md-flex="5" md-align="end">
       <md-button class="md-icon-button" @click="showSearchInput"> 
         <md-icon class="md-size-1x icon-pointer">search</md-icon> 
      </md-button>
    </md-layout>
    <md-layout md-flex="5" md-align="end">
      <h3>Menu</h3>
      <md-icon v-tooltip.click="{ 
        html: 'tooltipContent',
        class: 'custom-white' 
      }" class="md-size-1x icon-pointer">menu</md-icon>

      <div id="tooltipContent">
        <md-list>
          <md-list-item href="" @click="$router.push({name: 'Destaque'})">
            <md-icon>star_border</md-icon> 
            Destaques
          </md-list-item>
          <md-list-item href="" @click="$router.push({name: 'Busca'})">
            <md-icon>play_circle_outline</md-icon> 
            Vídeos
          </md-list-item>
        </md-list>
      </div>
    </md-layout>
    <md-layout md-flex="20"></md-layout>
  </md-layout>
</template>

<script>
export default {
  name: 'Header',
  data () {
    return {
      qSearch: '',
      showSearch: false
    }
  },
  methods: {
    showSearchInput () {
      this.showSearch = true
    }
  }
}
</script>

<style lang="sass">

#header
  background-color: #B0135A
  color: white
  align-items: center

#header h1
  font-size: 20px

.md-input-container label, .md-input-container .md-has-value input, .md-input-container.md-has-value textarea
    color: white !important

.md-input-container:after
  background-color: white !important

#tooltipContent 
  i
    color: #B0135A

#tooltipContent
  .md-list-item 
    .md-list-item-container
      justify-content: flex-start
</style>
