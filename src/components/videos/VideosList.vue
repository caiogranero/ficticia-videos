<template>
  <div id="video-list">
    <md-layout class="outside-space">
      <md-layout md-flex="70">
        <h3 class="page-title">
          Todos os vídeos do Canal
        </h3>
      </md-layout>
      <md-layout md-flex="70">
        <md-layout class="md-videos-custom" md-flex-xsmall="100" md-flex-small="100" md-flex-medium="60" md-flex-large="33" v-for="video in videos" :key="video.id">
          <md-card class="md-card-custom">
            <md-card-header>
              <md-card-media md-big>
                <img :src="video.thumbnails" alt="People">
              </md-card-media>

              <div class="video-info">
                <md-card-header-text>
                  <div class="md-title-videos">{{video.title}}</div>
                  <div class="md-views-videos"><md-icon class="md-size-1x">remove_red_eye</md-icon> {{video.views}} views</div>
                </md-card-header-text>
              </div>
            </md-card-header>
          </md-card>
        </md-layout>
      </md-layout>
    </md-layout>

    <md-layout md-align="center" md-gutter="16">
      <md-layout md-flex="35">
        <span>center</span>
      </md-layout>

      <md-layout md-flex="35">
        <span>center</span>
      </md-layout>
    </md-layout>
      <md-layout md-flex="100">
        <md-button class="md-raised md-primary">Default</md-button>
        <spinner v-show="isLoading"></spinner>
      </md-layout>
  </div>
</template>

<script>
import Spinner from '@/components/Spinner'

export default {
  name: 'Header',
  data () {
    return {
      videos: [],
      isLoading: false
    }
  },
  components: {Spinner},
  created () {
    this.$YoutubeService.get({q: 'EACH-USP'}).then(res => {
      console.log(res.data.items)
      res.data.items.forEach((el) => {
        this.videos.push({
          title: this.maxTitleSize(el.snippet.title),
          views: 100,
          thumbnails: el.snippet.thumbnails.medium.url,
          id: el.id.videoId
        })
      })
    })
  },
  methods: {
    maxTitleSize (title) {
      if (title.length > 32) {
        return title.substring(0, 32) + '...'
      } else {
        return title
      }
    }
  }
}
</script>

<style scoped>
.md-card-custom {
  box-shadow: none;
}

.video-info {
  margin-left: 10px;
  position: relative;
}

.md-title-videos {
  color: #B0135A;
}

.page-title {
  color: #B0135A;
  font-size: 35px;
  font-weight: 300;
}

.md-card .md-card-header .md-card-media.md-big {
  flex: 0 0 180px;
  height: 100px;
}

.md-views-videos {
  position: absolute;
  bottom: 0;
  color: #C8C8C8;
}

.md-videos-custom {
  opacity: 0.7;
}

.md-videos-custom:hover {
  opacity: 1;
  cursor: pointer;
}
</style>
