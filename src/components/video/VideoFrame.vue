<template>
  <div id="video-frame">
    <iframe width="560" height="320" :src="videoUrl" frameborder="0" allowfullscreen></iframe>
  </div>
</template>

<script>
export default {
  name: 'VideoFrame',
  data () {
    return {
      videoUrl: ''
    }
  },
  props: {
    videoId: String
  },
  watch: {
    videoId () {
      this.videoUrl = `https://www.youtube.com/embed/${this.videoId}`
    }
  },
  created () {
    this.videoUrl = `https://www.youtube.com/embed/${this.videoId}`
  }
}
</script>

<style lang="sass">

#video-frame 
  iframe
    height: 320px;

</style>
