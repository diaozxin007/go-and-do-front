const intervalUnitOptions = [{
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
}]

const daysOfMonthOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, '最后一天']

const weekDayFirstOptions = [
  {
    value: '无',
    label: '无'
  },
  {
    value: '第一个',
    label: '第一个'
  },
  {
    value: '第二个',
    label: '第二个'
  },
  {
    value: '第三个',
    label: '第三个'
  },
  {
    value: '第四个',
    label: '第四个'
  },
  {
    value: '第五个',
    label: '第五个'
  },
  {
    value: '最后一个',
    label: '最后一个'
  }
]

const weekDaySecondOptions = [
  {
    value: '无',
    label: '无'
  },
  {
    value: '星期日',
    label: '星期日'
  },
  {
    value: '星期一',
    label: '星期一'
  },
  {
    value: '星期二',
    label: '星期二'
  },
  {
    value: '星期三',
    label: '星期三'
  },
  {
    value: '星期四',
    label: '星期四'
  },
  {
    value: '星期五',
    label: '星期五'
  },
  {
    value: '星期六',
    label: '星期六'
  },
  {
    value: '工作日',
    label: '工作日'
  },
  {
    value: '周末',
    label: '周末'
  }
]

const reviewIntervalUnitOptions = [
  {
    value: 'day',
    label: '天'
  },
  {
    value: 'week',
    label: '周'
  },
  {
    value: 'month',
    label: '月'
  },
  {
    value: 'year',
    label: '年'
  }
]

export default {
  intervalUnitOptions,
  daysOfMonthOptions,
  weekDayFirstOptions,
  weekDaySecondOptions,
  reviewIntervalUnitOptions
}
