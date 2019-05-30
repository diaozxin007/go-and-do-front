<template>
  <div id="app" class="appBody" >
    <el-container class="appBody">
      <el-header>
        <GHeader></GHeader>
      </el-header>
      <el-container>
        <el-aside width="200px">
          <Tab></Tab>
        </el-aside>
        <el-main style="padding: 0 0 0 0; margin-left: -50px">
          <div class="mainArea">
            <router-view></router-view>
            <main-show></main-show>
            <Detail></Detail>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script type="text/ecmascript-6">
  import GHeader from 'components/g-header/g-header'
  import Tab from 'components/tab/tab'
  import MainShow from 'components/mainShow/mainShow'
  import Detail from 'components/detail/detail'

  export default {
    components: {
      GHeader,
      Tab,
      MainShow,
      Detail
    }
  }
</script>

<style  scoped lang="stylus" rel="stylesheet/stylus">
  .appBody
    height 100%
    .mainArea
      display: flex
      justify-content space-between
      height 100%
</style>
