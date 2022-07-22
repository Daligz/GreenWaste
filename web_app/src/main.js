import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'// in Vue 3
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.config.productionTip = false


new Vue({
  router,
  store,
  vuetify,
  render: function (h) { return h(App) }
}).$mount('#app')
