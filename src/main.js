// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'babel-polyfill'
import axios from 'axios'
import qs from 'qs'
import Vue from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App'
import router from './router'

import 'common/stylus/index.styl'

import fastclick from 'fastclick'

fastclick.attach(document.body)

Vue.config.productionTip = false
Vue.prototype.axios = axios
axios.defaults.baseURL = process.env.API_ROOT
Vue.prototype.qs = qs
Vue.prototype.baseReqURL = process.env.API_ROOT

Vue.use(ElementUI)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: h => h(App),
  router
  // components: { App },
  // template: '<App/>'
})
