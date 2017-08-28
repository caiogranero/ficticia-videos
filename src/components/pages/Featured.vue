<template>
  <div id="featured">
    <md-layout v-if="featuredVideo">

      <md-layout md-flex-xsmall="10" md-flex-small="20" md-flex-medium="20" md-flex-large="15" md-flex-xlarge="25"></md-layout>
      <md-layout md-flex-xsmall="75" md-flex-small="75" md-flex-medium="75" md-flex-large="40" md-flex-xlarge="30" class="top-content">
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
      <md-layout md-flex-xsmall="15" md-flex-small="5" md-flex-medium="5" md-hide-large-and-up></md-layout>

      <md-layout md-flex-xsmall="10" md-flex-small="20" md-flex-medium="20" md-hide-large-and-up></md-layout>
      <md-layout md-flex-xsmall="75" md-flex-small="75" md-flex-medium="75" md-flex-large="30" md-flex-xlarge="20" class="top-content">
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
import Thumbnails from '@/components/video/Thumbnails'
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
    this.getFeaturedVideo()
  },
  methods: {
    // Load the feature video.
    // This video is select by order the youtube content per viewCount
    getFeaturedVideo (params = {}) {
      let featuredParams = {
        order: 'viewCount',
        maxResults: '1'
      }

      featuredParams = Object.assign(featuredParams, params)

      this.$VideoService.get(featuredParams).then(res => {
        this.featuredVideo = res.data.items[0]
        // When get the featured video, search for related content
        this.getRelatedVideos()
      })
    },

    // Load related videos
    getRelatedVideos () {
      let relatedParams = {
        relatedToVideoId: this.featuredVideo.id.videoId,
        maxResults: 4
      }

      // Necessary when click the load more button
      if (this.nextPageToken) {
        relatedParams['pageToken'] = this.nextPageToken
      }

      this.$VideoService.get(relatedParams).then(res => {
        this.nextPageToken = res.data.nextPageToken
        res.data.items.forEach((el, idx) => {
          // Insert in video array a view value
          this.relatedVideos.push(Object.assign(el, {views: this.generateRandomViews()}))
        })
      })
    },
    // When select a related video, change the principal video
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
