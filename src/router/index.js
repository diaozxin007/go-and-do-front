import Vue from 'vue'
import Router from 'vue-router'
import Inbox from 'components/inbox/inbox'
import Project from 'components/project/project'
import Label from 'components/label/label'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/inbox',
      component: Inbox
    },
    {
      path: '/project',
      component: Project
    },
    {
      path: '/label',
      component: Label
    }
  ]
})
