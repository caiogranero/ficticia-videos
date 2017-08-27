<template>
  <div id="button-search">
    <md-layout md-align="center">
      <md-layout md-flex="100" md-align="center">
        <button class="md-custom-button" @click="fnButton()">Carregar mais vídeos...</button>
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

<style scoped lang="sass">
  .md-custom-button
    width: 500px;
    border: 1px solid #C8C8C8;
    margin: 6px 8px;
    padding: 0 16px;
    display: inline-block;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    -moz-user-select: none;
    -ms-user-select: none;
    cursor: pointer;
    background: white;
    -webkit-transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
    transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
    color: #828282;
    font-family: inherit;
    font-size: 11px;
    font-style: inherit;
    font-variant: inherit;
    font-weight: bold;
    letter-spacing: inherit;
    line-height: 36px;
    text-align: center;
    text-transform: uppercase;
  
  .md-custom-button:hover
    background: #828282;
    color: white;
</style>
