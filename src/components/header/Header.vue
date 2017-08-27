<template>
  <md-layout id="header">
    <md-layout md-flex="15"></md-layout>
    <md-layout md-flex="40" md-align="start">
      <h1>
        <img src="../../assets/youtube.svg" width="40" height="224" alt="Youtube free icon" title="Youtube free icon">
        Fictícia videos
      </h1>
    </md-layout>
    <md-layout md-flex="15" md-align="end">
    </md-layout>
    <md-layout md-flex="5" md-align="end">
      <input type="text" id="search-input" v-if="showSearch"  @keyup="initKeyTimer()" v-model="qSearch">
      <md-button class="md-icon-button" @click="displaySearchInput"> 
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
      showSearch: false,
      keyTimer: null
    }
  },
  methods: {
    // Control the input display
    displaySearchInput () {
      this.showSearch = !this.showSearch
    },

    // Timeout to check automatic when the user type a query
    initKeyTimer () {
      if (this.keyTimer) {
        clearTimeout(this.keyTimer)
      }
      this.keyTimer = setTimeout(() => {
        this.$store.commit('setQuery', this.qSearch)
        if (this.$route.name !== 'Busca') {
          this.$router.push({name: 'Busca'})
        }
      }, 600)
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

.vue-tooltip
  background-color: white

#search-input
  position: absolute
  border: 1px solid white
  border-radius: 4px
  padding-top: 15px
  background: rgba(0,0,0,0.1)
  text-align: start
  font-family: inherit
  color: white
  font-style: inherit
  letter-spacing: inherit
  line-height: 16px
  margin: 0px -10px
  padding: 10px 16px
  text-align: start
  width: 250px
  font-variant: inherit

#search-input:focus
  border: 1px solid white
  border-radius: 4px
  outline: white
</style>
