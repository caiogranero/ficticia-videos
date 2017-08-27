<template>
  <div id="video-description">
    <md-layout md-align="start">
      <md-layout md-flex="85" md-align="start">
        <h3 class="detail-title">{{data.snippet.title}}</h3>
      </md-layout>
      <md-layout md-flex="7" md-align="end">
        <md-icon v-tooltip="{ 
          content: views, 
          class: 'custom-white' 
        }" class="md-size-1x icon-pointer detail-action-icon">remove_red_eye</md-icon> 
      </md-layout>
      <md-layout md-flex="8" md-align="end">
        <md-icon v-tooltip="{ 
            content: convertDateTime(data.snippet.publishedAt), 
            class: 'custom-white' 
          }" 
          class="md-size-1x icon-pointer detail-action-icon">access_time</md-icon> 
      </md-layout>
    </md-layout>
    <p>{{data.snippet.description}}</p> 
  </div>
</template>

<script>
import mixin from '@/components/mixins'

export default {
  name: 'VideoDescription',
  mixins: [mixin],
  props: {
    data: Object
  },
  data () {
    return {
      createdAt: '',
      views: ''
    }
  },
  created () {
    this.createdAt = this.convertDateTime(this.data.snippet.publishedAt)
    this.views = this.generateRandomViews() + ' views'
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

.md-dialog 
  iframe
    height: 320px

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
