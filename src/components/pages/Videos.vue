<template>
  <div id="videos-list">
    <md-layout>
      <md-layout md-flex="15"></md-layout>
      <md-layout md-flex="70">
        <h3 class="page-title">{{pageTitle}}</h3>
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
import Thumbnails from '@/components/video/Thumbnails'
import ButtonSearch from '@/components/helpers/ButtonSearch'
import VideoDetails from '@/components/video/VideoDetails'
import mixin from '@/components/mixins'

export default {
  name: 'VideosList',
  mixins: [mixin],
  data () {
    return {
      pageTitle: 'Todos os vídeos do Canal',
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
    // If, the user click in video option, load the somem videos order by rating
    if (this.$store.state.query === '') {
      this.params.order = 'rating'
      this.pageTitle = 'Todos os vídeos do Canal'
    } else { // If the user make a search, find what is typed
      this.params.q = this.$store.state.query
      this.pageTitle = `Resultados para: "${this.$store.state.query}"`
    }
    this.getVideos()
  },
  computed: {
    query () {
      return this.$store.state.query
    }
  },
  watch: {
    // Watch search term change
    query () {
      this.videos = []
      if (this.query === '') {
        this.params.order = 'rating'
        this.pageTitle = 'Todos os vídeos do Canal'
      } else {
        this.params.q = this.query
        this.pageTitle = `Resultados para: "${this.query}"`
      }
      this.getVideos()
    }
  },
  methods: {
    // Load all videos for the params
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

    // Open a modal with videos details
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
