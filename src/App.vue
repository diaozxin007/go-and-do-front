<template>
  <div>
    <g-header></g-header>
    <Tab></Tab>
    <router-view></router-view>
    <detail></detail>
  </div>
</template>

<script type="text/ecmascript-6">
  import GHeader from 'components/g-header/g-header'
  import Tab from 'components/tab/tab'
  import Detail from 'components/detail/detail'

  export default {
    components: {
      GHeader,
      Tab,
      Detail
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable"
  #app
    color: $color-theme
</style>
