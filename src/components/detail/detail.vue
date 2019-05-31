<template>
  <el-collapse v-model="activeNames" @change="handleChange">
    <el-collapse-item title="标题" name="1">
      <div>
        <el-input
          type="textarea"
          :rows="2"
          placeholder="请输入内容"
          v-model="textarea">
        </el-input>
      </div>
    </el-collapse-item>
    <el-collapse-item title="项目" name="2">
      <span>状态：{{statusRadio}}</span>
      <div>
        <el-radio-group v-model="statusRadio" size="small">
          <el-radio-button label="活跃"></el-radio-button>
          <el-radio-button label="暂停"></el-radio-button>
          <el-radio-button label="已完成"></el-radio-button>
          <el-radio-button label="已丢弃"></el-radio-button>
        </el-radio-group>
        <span>标注</span>
        <el-switch
          v-model="switchValue"
          active-color="#13ce66"
          inactive-color="#ff4949"
          >
        </el-switch>
      </div>
      <br>
      <span>类型：{{typeRadio}}</span>
      <div >
        <el-radio-group v-model="typeRadio" size="small">
          <el-radio-button label="平行"></el-radio-button>
          <el-radio-button label="顺序"></el-radio-button>
          <el-radio-button label="单个动作"></el-radio-button>
        </el-radio-group>
      </div>
      <div>
        <br>
        <el-checkbox v-model="checked">用最后一个动作完成</el-checkbox>
      </div>
    </el-collapse-item>
    <el-collapse-item title="标签" name="3">
      <div>简化流程：设计简洁直观的操作流程；</div>
      <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
      <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
    </el-collapse-item>
    <el-collapse-item title="日期" name="4">
      <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
      <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
    </el-collapse-item>
  </el-collapse>
</template>

<script>
  export default {
    name: 'detail',
    data() {
      return {
        statusRadio: '活跃',
        switchValue: true,
        typeRadio: '平行'
      }
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
</style>
