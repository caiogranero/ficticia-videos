import moment from 'moment'
moment.locale('pt-br')

const mixins = {
  methods: {
    generateRandomViews () {
      return Math.floor((Math.random() * 1000) + 1)
    },
    convertDateTime (date) {
      return `${moment(date).format('DD')} de 
              ${moment(date).format('MMMM')} de 
              ${moment(date).format('YYYY')}`
    }
  }
}

export default mixins
