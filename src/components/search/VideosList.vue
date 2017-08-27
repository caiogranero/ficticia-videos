<template>
  <div id="videos-list">
    <md-layout>
      <md-layout md-flex="15"></md-layout>
      <md-layout md-flex="70">
        <h3 class="page-title">Todos os vídeos do Canal</h3>
      </md-layout>
    </md-layout>
    <md-layout>
      <md-layout md-flex="15"></md-layout>
      <md-layout md-flex="70">
        <md-layout class="md-videos-custom" md-flex-xsmall="100" md-flex-small="100" md-flex-medium="60" md-flex-large="33" v-for="video in videos" :key="video.id.videoId">
          <thumbnails :video="video" :fnAction="showVideoDetails"></thumbnails>
        </md-layout>
      </md-layout>
    </md-layout>

    <button-search :fnButton="getVideos"></button-search>

    <spinner v-show="isLoading"></spinner>

    <video-details v-if="detailVideo" :open="openVideoDetails" :data="detailVideo"></video-details>
  </div>
</template>

<script>
import Spinner from '@/components/helpers/Spinner'
import Thumbnails from '@/components/search/Thumbnails'
import ButtonSearch from '@/components/helpers/ButtonSearch'
import VideoDetails from '@/components/search/VideoDetails'
import mixin from '@/components/mixins'

export default {
  name: 'VideosList',
  mixins: [mixin],
  data () {
    return {
      videos: [],
      isLoading: false,
      params: {
        maxResults: 5
      },
      detailVideo: null,
      openVideoDetails: false
    }
  },
  components: {Spinner, Thumbnails, ButtonSearch, VideoDetails},
  created () {
    this.videos = []
    this.params.q = 'Velozes e Furiosos'
    this.getVideos()
  },
  methods: {
    getVideos () {
      this.isLoading = true
      this.$VideoService.get(this.params).then(res => {
        this.params.pageToken = res.data.nextPageToken
        res.data.items.forEach((el) => {
          this.videos.push(Object.assign(el, {views: this.generateRandomViews()}))
        })
        this.isLoading = false
      })
    },
    showVideoDetails (videoData) {
      this.detailVideo = videoData
      window.setTimeout(() => {
        this.openVideoDetails = !this.openVideoDetails
      })
    }
  }
}
</script>

<style lang="sass" scoped>

.page-title
  color: #B0135A
  font-size: 35px
  font-weight: 300

</style>
