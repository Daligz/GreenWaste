import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
//import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
//import axios from 'axios'


Vue.config.productionTip = false
//const app = createApp(App)
//app.use(axios)
//Vue.use(BootstrapVue)
//Vue.use(IconsPlugin)


//import 'bootstrap/dist/css/bootstrap.css'
//import 'bootstrap-vue/dist/bootstrap-vue.css'

new Vue({
  router,
  store,
  vuetify,
  render: function (h) { return h(App) }
}).$mount('#app')
