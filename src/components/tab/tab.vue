<template>
      <el-row class="tac" style="height: 100%">
        <el-col :span="18" style="height: 100%">
          <el-menu class="el-menu-vertical-demo" default-active="project" background-color="#545c64" text-color="#fff"
                   active-text-color="#ffd04b" style="height: 100%" router>
            <el-menu-item index="inbox">
              <i class="el-icon-box"></i>
              <span slot="title">收件箱</span>
            </el-menu-item>
            <el-menu-item index="project">
              <i class="el-icon-menu"></i>
              <span slot="title">项目</span>
            </el-menu-item>
            <el-menu-item index="tag">
              <i class="el-icon-collection-tag"></i>
              <span slot="title">标签</span>
            </el-menu-item>
            <el-menu-item index="predict">
              <i class="el-icon-timer"></i>
              <span slot="title">预测</span>
            </el-menu-item>
            <el-menu-item index="marked">
              <i class="el-icon-s-flag"></i>
              <span slot="title">已标注</span>
            </el-menu-item>
            <el-menu-item index="review">
              <i class="el-icon-coffee-cup"></i>
              <span slot="title">检查</span>
            </el-menu-item>
          </el-menu>
        </el-col>
      </el-row>
</template>

<script type="text/ecmascript-6">
    export default {
      name: 'tab'
    }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
