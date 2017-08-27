<template>
  <div id="video-details">
    <md-dialog ref="video-details-dialog" id="video-details-dialog">
      <md-dialog-title>
        <md-layout md-align="end">
          <md-layout md-flex="10" md-align="center">
            <div @click="closeDialog()">
              <md-icon class="md-size-1x icon-pointer close-icon" >close</md-icon> 
            </div>
          </md-layout>
        </md-layout>
      </md-dialog-title>
      <md-dialog-content>
        <video-frame :videoId="data.id.videoId"></video-frame>
        <video-description :data="data"></video-description>
      </md-dialog-content>  
    </md-dialog>
  </div>
</template>

<script>
import VideoFrame from '@/components/video/VideoFrame'
import VideoDescription from '@/components/video/VideoDescription'

export default {
  name: 'VideoDetails',
  props: {
    open: Boolean,
    data: Object
  },
  components: { VideoFrame, VideoDescription },
  watch: {
    open () {
      this.$refs['video-details-dialog'].open()
    }
  },
  methods: {
    closeDialog () {
      this.$refs['video-details-dialog'].close()
    }
  }
}
</script>

<style lang="sass">

.detail-title
  color: #B0135A
  font-size: 16px
  font-weight: 500

.md-dialog
  max-width: 560px

.close-icon
  display: inline-block
  border-radius: 50px
  background-color: #d60000
  box-shadow: 0px 0px 2px #d60000
  padding-top: 1px
  width: 2px
  height: 2px
  color: white
  font-size: 14px
  font-weight: bold
  min-width: 15px
  min-height: 15px 

#video-details-dialog 
  .md-dialog-title
    padding: 10px 0px 10px
    margin-bottom: 0px

.detail-action-icon
  color: #7AC6DE

</style>
