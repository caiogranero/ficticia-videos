import axios from 'axios'

const Youtube = axios.create({
  baseURL: '/api/youtube',
  timeout: 30000
})

const API_KEY = 'AIzaSyCj_XvlLY9SS0O5Zcut64K-PG6bcernguM'

export default {
  install (Vue) {
    const YoutubeService = {
      name: 'YoutubeService',

      get (params = {}) {
        const defaultParams = {
          key: API_KEY,
          part: 'snippet'
        }

        params = Object.assign(params, defaultParams)

        return Youtube.get('https://www.googleapis.com/youtube/v3/search?', {params})
      }
    }

    Vue.$YoutubeService = YoutubeService
    Vue.prototype.$YoutubeService = YoutubeService
  }
}
