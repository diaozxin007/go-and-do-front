import Vue from 'vue'
import Router from 'vue-router'
import Inbox from 'components/inbox/inbox'
import Project from 'components/project/project'
import Tag from 'components/tag/tag'
import Predict from 'components/predict/predict'
import Marked from 'components/marked/marked'
import Review from 'components/review/review'

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
          path: '/tag',
          component: Tag
        },
        {
          path: '/predict',
          component: Predict
        },
        {
          path: '/marked',
          component: Marked
        },
        {
          path: '/review',
          component: Review
        }
  ]
})
