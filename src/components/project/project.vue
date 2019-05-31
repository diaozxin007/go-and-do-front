<template>
  <div class="project">
    <!--    <el-row>-->
    <!--      <el-button @click="testRequest()">测试请求</el-button>-->
    <!--    </el-row>-->

    <el-tabs tab-position="left" class="leftTab">
      <el-tab-pane v-for="(item) in projectList" v-bind:key="item.id" :label="item.title">
        <g-tree></g-tree>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
  import GTree from 'components/base/g-tree/g-tree'

  export default {
    name: 'project',
    components: {
      GTree
    },
    data() {
      return {
        projectList: [
          {
            id: 1,
            title: '长长长长长长项目1'
          },
          {
            id: 2,
            title: '项目2'
          },
          {
            id: 3,
            title: '项目3'
          },
          {
            id: 4,
            title: '项目4'
          },
          {
            id: 5,
            title: '项目6'
          }
        ]
      }
    },
    methods: {
      testRequest() {
        console.log('baseUrl=' + this.baseReqURL)
        this.axios.get('/actions')
          .then((response) => {
            console.log(response)
          })
          .catch((error) => {
            console.log(error)
          })
      }
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .project
    flex 1
    justify-content: center

    .leftTab
      height 100%
</style>
