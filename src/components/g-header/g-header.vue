<template>
    <div class="g-header">
      <div class="icon"></div>
      <h1 class="text">Go and do</h1>
    </div>
<!--  <el-row>-->
<!--    <el-col :span="24">-->
<!--    <div class="head-wrap">Go and do</div>-->
<!--    </el-col>-->
<!--  </el-row>-->
</template>

<script type="text/ecmascript-6">
    export default {}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable"
  .g-header
    position relative
    height: 100%
    margin 0 -40px 0 -40px
    text-align: center
    color: $color-theme
    background-color $color-highlight-background
    .icon
      display: inline-block
      vertical-align: top
      margin-top: 12px
      width: 30px
      height: 32px
      margin-right: 9px
    .text
      display: inline-block
      vertical-align: center
      line-height: 60px
      font-size: $font-size-large
</style>
