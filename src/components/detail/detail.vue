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
      <div>
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
      <div>
        <el-select
          v-model="tagValue"
          multiple
          filterable
          allow-create
          default-first-option
          placeholder="请选择标签">
          <el-option
            v-for="item in tagOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </div>
    </el-collapse-item>
    <el-collapse-item title="日期" name="4">
      <div>
        <span>预计持续时间:</span>
        <el-input v-model="expectDurationInput" placeholder="请输入内容"></el-input>
      </div>
      <br>
      <div>
        <div>
          <span>推迟至:</span>
        </div>
        <el-date-picker
          v-model="delayToTime"
          type="datetime"
          placeholder="选择日期时间"
          align="right"
          :picker-options="pickerOptions">
        </el-date-picker>
      </div>
      <br>
      <div>
        <div>
          <span>截止:</span>
        </div>
        <el-date-picker
          v-model="upToTime"
          type="datetime"
          placeholder="选择日期时间"
          align="right"
          :picker-options="pickerOptions">
        </el-date-picker>
      </div>
      <br>
      <div>
        <div>
          <span>已完成:</span>
        </div>
        <el-date-picker
          v-model="finishedTime"
          type="datetime"
          placeholder="选择日期时间"
          align="right"
        >
        </el-date-picker>
      </div>
      <div>
        <span>已添加: {{createTime}}</span>
        <br>
        <span>已更改: {{updateTime}}</span>
      </div>
    </el-collapse-item>
    <el-collapse-item title="重复" name="5">
      <div>
        <br>
        <el-checkbox v-model="checked">重复间隔</el-checkbox>
        <el-input
          v-model="intervalValue"
          style="width: 40px">
        </el-input>
        <el-select v-model="intervalUnit" placeholder="请选择">
          <el-option
            v-for="item in intervalUnitOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </div>
      <div>
        <br>
        <el-radio-group v-model="extTabPosition" style="margin-bottom: 30px;">
          <el-radio-button label="daysOfMonth">月中的一天</el-radio-button>
          <el-radio-button label="daysOfWeek">周中的一天</el-radio-button>
        </el-radio-group>
      </div>
    </el-collapse-item>
  </el-collapse>
</template>

<script type="text/ecmascript-6">
  import moment from 'moment'

  export default {
    name: 'detail',
    data() {
      return {
        activeNames: ['1', '2', '3', '4', '5'],
        statusRadio: '活跃',
        switchValue: true,
        typeRadio: '平行',
        tagOptions: [{
          value: 'HTML',
          label: 'HTML'
        }, {
          value: 'CSS',
          label: 'CSS'
        }, {
          value: 'JavaScript',
          label: 'JavaScript'
        }],
        tagValue: [],
        expectDurationInput: '',
        pickerOptions: {
          shortcuts: [{
            text: '+1天',
            onClick(picker) {
              const date = new Date()
              date.setTime(date.getTime() + 3600 * 1000 * 24)
              picker.$emit('pick', date)
            }
          }, {
            text: '+1周',
            onClick(picker) {
              const date = new Date()
              date.setTime(date.getTime() + 3600 * 1000 * 24 * 7)
              picker.$emit('pick', date)
            }
          }, {
            text: '+1月',
            onClick(picker) {
              picker.$emit('pick', moment().add(1, 'month').calendar())
            }
          }]
        },
        delayToTime: '',
        upToTime: '',
        finishedTime: '',
        createTime: moment().format('YYYY-MM-DD HH:mm:ss'),
        updateTime: moment().format('YYYY-MM-DD HH:mm:ss'),
        intervalValue: '1',
        intervalUnit: '',
        intervalUnitOptions: [{
          value: 'minute',
          label: '分钟'
        }, {
          value: 'hour',
          label: '小时'
        }, {
          value: 'day',
          label: '天'
        }, {
          value: 'week',
          label: '周'
        }, {
          value: 'month',
          label: '月'
        }, {
          value: 'year',
          label: '年'
        }],
        extTabPosition: 'daysOfMonth'
      }
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
</style>
