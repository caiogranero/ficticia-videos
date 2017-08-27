<template>
  <div id="thumbnails" @click="fnAction(video)">
    <md-card class="md-card-custom">
      <md-card-header>
        <md-card-media md-big>
          <img :src="video.snippet.thumbnails.medium.url" alt="People">
        </md-card-media>

        <div class="video-info">
          <md-card-header-text>
            <div class="md-title-videos">{{maxTitleSize(video.snippet.title)}}</div>
            <div class="md-views-videos"><md-icon class="md-size-1x">remove_red_eye</md-icon> {{video.views}} views</div>
          </md-card-header-text>
        </div>
      </md-card-header>
    </md-card>
  </div>
</template>

<script>
export default {
  name: 'Thumbnails',
  props: {
    video: Object,
    fnAction: Function
  },
  methods: {
    maxTitleSize (title) {
      if (title.length > 28) {
        return title.substring(0, 25) + '...'
      } else {
        return title
      }
    }
  }
}
</script>

<style scoped lang="sass">

.md-card-custom
  box-shadow: none

.video-info
  margin-left: 10px
  position: relative

.md-title-videos
  color: #B0135A

.md-card 
  .md-card-header 
    .md-card-media.md-big
      flex: 0 0 180px
      height: 100px

.md-views-videos
  position: absolute
  bottom: 0
  color: #C8C8C8

.md-card-custom
  opacity: 0.7

.md-card-custom:hover
  opacity: 1
  cursor: pointer

.md-card 
  .md-card-header
    padding: 0px

</style>
