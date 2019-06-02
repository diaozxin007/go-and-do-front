<template>
  <el-form :model="dynamicNoticeTimes" ref="dynamicNoticeTimes" label-width="100px" class="formCustom">
    <el-collapse v-model="activeNames">
      <el-collapse-item title="标题" name="1">
        <div>
          <el-input
            type="textarea"
            :rows="2"
            placeholder="请输入内容"
            v-model="titleArea">
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
          <el-checkbox v-model="lastForFinishchecked">用最后一个动作完成</el-checkbox>
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
          <el-checkbox v-model="canRepeatChecked">重复间隔</el-checkbox>
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
            <el-radio-button label="daysOfMonth" @click.native="beDayOfMonth()">月中的一天</el-radio-button>
            <el-radio-button label="daysOfWeek" @click.native="beDayOdWeek">周中的一天</el-radio-button>
          </el-radio-group>
        </div>
        <div v-if="showMonthOptions">
          <el-checkbox-group v-model="daysOfMonthCheckBox" size="small" style="width: 280px">
            <el-checkbox-button v-for="item in daysOfMonthOptions" :label="item" :key="item">{{item}}
            </el-checkbox-button>
          </el-checkbox-group>
        </div>
        <div v-if="showWeekOptions">
          <el-select v-model="weekDayFirstValue" placeholder="无">
            <el-option
              v-for="item in weekDayFirstOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
          <el-select v-model="weekDaySecondValue" placeholder="无">
            <el-option
              v-for="item in weekDaySecondOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </div>
      </el-collapse-item>
      <el-collapse-item title="通知" name="6">
        <div>
          <el-form-item v-for="(domain,index) in dynamicNoticeTimes.domains"
                        :key="domain.key"
                        :prop="'domains.' + index + '.value'">
            <el-date-picker v-model="domain.value"
                            type="datetime"
                            placeholder="选择日期时间">
            </el-date-picker>
            <el-button @click.prevent="deleteNotice(domain)">删除</el-button>
          </el-form-item>
        </div>
        <div>
          <el-button type="primary" @click="addNotice()">添加通知</el-button>
        </div>
      </el-collapse-item>
      <el-collapse-item title="检查" name="7">
        <div>
          <div>
            <span>下一次检查:</span>
          </div>
          <el-date-picker
            v-model="nextReview"
            type="datetime"
            placeholder="选择日期时间"
            align="right"
          >
          </el-date-picker>
        </div>
        <br>
        <div>
          <div>
            <span>检查间隔:</span>
          </div>
          <el-input-number size="small" style="width: 80px" v-model="reviewIntervalValue" controls-position="right"
                           :min="1"></el-input-number>
          <el-select size="small" v-model="reviewIntervalUnit" placeholder="无">
            <el-option
              v-for="item in reviewIntervalUnitOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </div>
        <br>
        <div>
          <span>上一次检查时间: {{lastReviewTime}}</span>
        </div>
      </el-collapse-item>
      <el-collapse-item title="附注" name="8">
        <div>
          <el-input
            type="textarea"
            autosize
            placeholder="添加附注"
            v-model="titleArea">
          </el-input>
        </div>
      </el-collapse-item>

    </el-collapse>
  </el-form>
</template>

<script type="text/ecmascript-6">
  import moment from 'moment'
  import global from 'common/js/global'

  export default {
    name: 'detail',
    data() {
      return {
        activeNames: ['1', '2', '3', '4', '5', '6', '7', '8'],
        titleArea: '',
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
        lastForFinishchecked: false,
        canRepeatChecked: false,
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
        intervalUnitOptions: global.intervalUnitOptions,
        extTabPosition: 'daysOfMonth',
        daysOfMonthCheckBox: [],
        daysOfMonthOptions: global.daysOfMonthOptions,
        showMonthOptions: true,
        showWeekOptions: false,
        weekDayFirstValue: '',
        weekDayFirstOptions: global.weekDayFirstOptions,
        weekDaySecondValue: '',
        weekDaySecondOptions: global.weekDaySecondOptions,
        noticeTimes: [],
        dynamicNoticeTimes: {
          domains: [{
            value: ''
          }]
        },
        nextReview: '',
        reviewIntervalValue: 1,
        reviewIntervalUnit: global.reviewIntervalUnitOptions[1].label,
        reviewIntervalUnitOptions: global.reviewIntervalUnitOptions,
        lastReviewTime: moment().format('YYYY-MM-DD HH:mm:ss')
      }
    },
    methods: {
      beDayOfMonth() {
        this.showMonthOptions = true
        this.showWeekOptions = false
      },
      beDayOdWeek() {
        this.showMonthOptions = false
        this.showWeekOptions = true
      },
      addNotice() {
        this.dynamicNoticeTimes.domains.push({
          value: '',
          key: Date.now()
        })
      },
      deleteNotice(item) {
        let index = this.dynamicNoticeTimes.domains.indexOf(item)
        if (index !== -1) {
          this.dynamicNoticeTimes.domains.splice(index, 1)
        }
      }
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .formCustom >>> .el-form-item__content {
    margin-left 0px !important;
  }
</style>
