<template>
    <div class="tab">
      <router-link tag="div" class="tab-item" to="/inbox">
        <span class="tab-link">收件箱</span>
      </router-link>
      <router-link tag="div" class="tab-item" to="/project">
        <span class="tab-link">项目</span>
      </router-link>
      <router-link tag="div" class="tab-item" to="/tag">
        <span class="tab-link">标签</span>
      </router-link>
      <router-link tag="div" class="tab-item" to="/predict">
        <span class="tab-link">预测</span>
      </router-link>
      <router-link tag="div" class="tab-item" to="/marked">
        <span class="tab-link">已标注</span>
      </router-link>
      <router-link tag="div" class="tab-item" to="/review">
        <span class="tab-link">检查</span>
      </router-link>
    </div>
</template>

<script type="text/ecmascript-6">
    export default {
        name: 'tab'
    }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable"
  .tab
    display: flex
    flex-direction: column
    height: 44px
    line-height: 44px
    font-size: $font-size-medium
    .tab-item
      flex: 1
      text-align: center
      width: 100px
      .tab-link
        padding-bottom: 5px
        color: $color-text-l
      &.router-link-active
        .tab-link
          color: $color-theme
          border-bottom: 2px solid $color-theme
</style>
