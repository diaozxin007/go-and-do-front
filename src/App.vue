<template>
  <div>
    <g-header></g-header>
    <router-view></router-view>
  </div>
</template>

<script type="text/ecmascript-6">
  import GHeader from 'components/g-header/g-header'

  export default {
    components: {
      GHeader
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable"
  #app
    color: $color-theme
</style>
