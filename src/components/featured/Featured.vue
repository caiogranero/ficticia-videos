<template>
  <div id="featured">
    <md-layout v-if="featuredVideo">

      <md-layout md-flex="15"></md-layout>
      <md-layout md-flex="40" class="top-content">
        <h3 class="featured-title">Vídeo em destaque</h3>
        <md-layout md-flex="100">
          <video-frame :videoId="featuredVideo.id.videoId"></video-frame>
        </md-layout>
        <md-layout md-flex="100">
          <md-card id="related-description">
            <video-description :data="featuredVideo"></video-description>
          </md-card>
        </md-layout>
      </md-layout>

      <md-layout md-flex="30" class="top-content">
        <h3 class="featured-title">+ Vídeos </h3>
        <md-card>
          <div v-if="relatedVideos.length > 0">
            <div id="scroll">
              <thumbnails 
                :fnAction="changeFeatured" 
                v-for="video in relatedVideos" 
                :key="video.id.videoId" 
                :video="video"></thumbnails>
            </div>
            <button-search :fnButton="getRelatedVideos"></button-search>
          </div>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>

<script>
import Thumbnails from '@/components/search/Thumbnails'
import VideoFrame from '@/components/video/VideoFrame'
import VideoDescription from '@/components/video/VideoDescription'
import ButtonSearch from '@/components/helpers/ButtonSearch'
import mixin from '@/components/mixins'

export default {
  name: 'Featured',
  mixins: [mixin],
  data () {
    return {
      featuredVideo: null,
      relatedVideos: [],
      openVideoDetails: false,
      nextPageToken: ''
    }
  },
  components: { Thumbnails, VideoFrame, VideoDescription, ButtonSearch },
  created () {
    let featuredParams = {
      order: 'rating',
      maxResults: '1'
    }
    this.getFeaturedVideo(featuredParams)
  },
  methods: {
    getFeaturedVideo (params = {}) {
      this.$VideoService.get(params).then(res => {
        this.featuredVideo = res.data.items[0]
        this.getRelatedVideos()
      })
    },
    getRelatedVideos () {
      let relatedParams = {
        relatedToVideoId: this.featuredVideo.id.videoId,
        maxResults: 4
      }

      if (this.nextPageToken) {
        relatedParams['pageToken'] = this.nextPageToken
      }

      this.$VideoService.get(relatedParams).then(res => {
        this.nextPageToken = res.data.nextPageToken
        res.data.items.forEach((el, idx) => {
          this.relatedVideos.push(Object.assign(el, {views: this.generateRandomViews()}))
        })
      })
    },
    changeFeatured (video) {
      this.featuredVideo = video
    }
  }
}
</script>

<style scoped lang="sass">

.featured-title
  color: #B0135A
  font-size: 30px
  font-weight: 300

.md-videos-custom
  opacity: 0.7

.md-videos-custom:hover
  opacity: 1
  cursor: pointer

.top-content
  align-self: flex-start

.md-card
  padding: 10px 10px 10px 0px
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.2), -1px 0px 1px rgba(0, 0, 0, 0.14), 0px -1px 0px 2px rgba(0, 0, 0, 0.12)

#related-description
  margin-top: 15px
  max-width: 560px
  padding-left: 15px

#scroll
  overflow-y: scroll
  max-height: 440px

</style>
