<template>
  <!-- <div id="header"> -->
    <md-layout class="outside-space" id="header">
      <md-layout md-flex="70" md-align="start">
        <h1>
          <md-icon class="md-size-2x">play_circle_outline</md-icon>
          Fictícia videos
        </h1>
      </md-layout>
      <md-layout md-flex="5" md-align="end">
        <md-icon class="md-size-1x icon-pointer">search</md-icon>
      </md-layout>
      <md-layout md-flex="5" md-align="end">
        <h3>Menu</h3>
        <md-icon class="md-size-1x icon-pointer">menu</md-icon>
      </md-layout>
    </md-layout>
  <!-- </div> -->
</template>

<script>
export default {
  name: 'header'
}
</script>

<style scoped>

#header {
  background-color: #B0135A;
  color: white;
  align-items: center;
}

#header h1 {
  font-size: 20px;
}

</style>
