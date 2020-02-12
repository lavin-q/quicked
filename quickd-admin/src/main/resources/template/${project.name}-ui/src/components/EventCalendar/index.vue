<template>
  <div class="el-event-calendar-container">
    <slot name="tips-top"/>
    <panel
      :setting="settingOpts"
      :calendar="calendarOptions"
      :mark-days="markDays"
      :selected-dates="selectedDayEvents.dates"
      :only-trigger-mark-days="onlyTriggerMarkDays"
      @selected-day-changed="handleChangeSelectedDay"
      @pre-Month="preMonth"
      @next-Month="nextMonth"
      @pre-Year="preYear"
      @next-Year="nextYear"
    />
    <slot name="tips-bottom"/>
  </div>
</template>
<script>
import { isEqualDateStr } from './tools.js'
import panel from './components/panel.vue'
export default {
  name: 'EventCalendar',
  components: {
    'panel': panel
  },
  props: {
    onlyTriggerMarkDays: { // 只能触发事件日期,若为true,则只能点击markDays日期才能触发点击事件
      type: Boolean,
      default: true
    },
    setting: { // 配置项
      type: Object,
      default() {
        return {}
      }
    },
    /**
     * markDays是一个对象数组：
     * 对象格式：
        date: '2019-03-26',         （必有）
        title: '有轨迹',            （非必有）
        desc: '有轨迹',             （非必有）
        customClass: 'highlight'    （非必有）
     */
    markDays: {
      type: Array,
      required: true,
      default() {
        return []
      },
      validator(markDays) {
        let validate = true
        markDays.forEach((event, index) => {
          if (!event.date) {
            console.error('Vue-Event-Calendar-Error:' + 'Prop markDays Wrong at index ' + index)
            validate = false
          }
        })
        return validate
      }
    },
    selectedDates: {
      type: String,
      default() {
        return ''
      }
    },
    modelVal: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      calendarOptions: { // 当前日历信息，当前显示的月份，年份，当前显示的日，默认不显示当前显示的日期
        selectedYear: (new Date()).getFullYear(),
        selectedMonth: (new Date()).getMonth()
      }
    }
  },
  computed: {
    settingOpts() {
      return Object.assign(
        {
          format: 'yyyy-MM-dd',
          dateSplitTag: '-',
          locale: 'zh', // 日历显示语种，默认是zh中文，也可以是en英国，us美国
          color: '#FFA500', // markDay's color
          selectedDayClassNm: 'selected-day',
          weekStartOn: 1, // 0 mean sunday 日历显示的起始星期，0指周末，1指周一...
          multiple: false // 是否允许多选
        }, this.setting
      )
    },
    selectedDayEvents() {
      const dates = []
      const details = []
      if (this.selectedDates && this.selectedDates.length > 0) {
        this.selectedDates.split(',').forEach(date => {
          dates.push(date)
          const markDay = this.markDays.filter(function(event) {
            return isEqualDateStr(event.date, date)
          })
          if (markDay.length > 0) {
            details.push({ date: date, details: markDay[0] })
          } else {
            details.push({ date: date, details: null })
          }
        })
        return {
          dates: dates,
          details: details // default show all event
        }
      } else {
        return {
          dates: [],
          details: [] // default show all event
        }
      }
    }
  },
  watch: {
    modelVal() {
      if (this.modelVal) {
        const currentDate = new Date(this.modelVal)
        const currentYear = currentDate.getFullYear()
        const currentMonth = currentDate.getMonth()
        if (currentYear !== this.calendarOptions.selectedYear) {
          this.calendarOptions.selectedYear = currentYear
        }
        if (currentMonth !== this.calendarOptions.selectedMonth) {
          this.calendarOptions.selectedMonth = currentMonth
        }
      }
    }
  },
  methods: {
    // isSelectedTheEventDay用于说明是否选中的是事件日期markDays
    handleChangeSelectedDay(date, isSelectedTheEventDay) {
      if (this.onlyTriggerMarkDays) {
        if (isSelectedTheEventDay) {
          this.changeSelectedDay(date, isSelectedTheEventDay)
        }
      } else {
        this.changeSelectedDay(date, isSelectedTheEventDay)
      }
    },
    changeSelectedDay(date, isSelectedTheEventDay) {
      const index = this.selectedDayEvents.dates.indexOf(date)
      let isNew = index === -1
      if (this.settingOpts.multiple) {
        if (isNew) {
          this.selectedDayEvents.dates.push(date)
        } else {
          this.selectedDayEvents.dates.splice(index, 1)
        }
      } else {
        // 单选日期
        this.selectedDayEvents.dates = []
        this.selectedDayEvents.dates.push(date)
        isNew = true
      }

      let markDay
      this.selectedDayEvents.details = []
      let changedDateDetail
      this.selectedDayEvents.dates.forEach(item => {
        let temp
        markDay = this.markDays.filter(function(event) {
          return isEqualDateStr(event.date, item)
        })
        if (markDay.length > 0) {
          temp = { date: item, details: markDay[0] }
        } else {
          temp = { date: item, details: null }
        }
        if (isEqualDateStr(item, date)) {
          changedDateDetail = temp
        }
        this.selectedDayEvents.details.push(temp)
      })

      if (this.settingOpts.multiple) {
        this.$emit('dayChanged', {
          changedDate: date,
          changedDateDetail: changedDateDetail,
          selectedDates: this.selectedDayEvents.dates,
          selectedDatesDetails: this.selectedDayEvents.details,
          isSelected: isNew
        }, isSelectedTheEventDay)
      } else {
        this.$emit('dayChanged', {
          changedDate: date,
          changedDateDetails: this.selectedDayEvents.details.length > 0 ? this.selectedDayEvents.details[0] : null,
          isSelected: isNew
        }, isSelectedTheEventDay)
      }
    },

    handleYearMonthChanged(year, month) {
      this.$emit('yearMonthChanged', year, month)
    },

    nextMonth() {
      if (this.calendarOptions.selectedMonth < 11) {
        this.calendarOptions.selectedMonth++
      } else {
        this.calendarOptions.selectedYear++
        this.calendarOptions.selectedMonth = 0
      }
      this.handleYearMonthChanged(this.calendarOptions.selectedYear, this.calendarOptions.selectedMonth)
    },
    preMonth() {
      if (this.calendarOptions.selectedMonth > 0) {
        this.calendarOptions.selectedMonth--
      } else {
        this.calendarOptions.selectedYear--
        this.calendarOptions.selectedMonth = 11
      }
      this.handleYearMonthChanged(this.calendarOptions.selectedYear, this.calendarOptions.selectedMonth)
    },
    preYear() {
      this.calendarOptions.selectedYear--
      this.handleYearMonthChanged(this.calendarOptions.selectedYear, this.calendarOptions.selectedMonth)
    },
    nextYear() {
      this.calendarOptions.selectedYear++
      this.handleYearMonthChanged(this.calendarOptions.selectedYear, this.calendarOptions.selectedMonth)
    }

    // toDate (dateString) {
    //   if (dateString === 'all') {
    //     let dateObj = new Date();
    //     this.calendarOptions = {
    //       selectedYear: dateObj.getFullYear(),
    //       selectedMonth: dateObj.getMonth(),
    //       selectedDate: dateObj.getDate(),
    //       // curEventsDate: 'all'
    //     }
    //   } else {
    //     let dateArr = dateString.split('-')
    //     dateArr = dateArr.map((item) => {
    //       return parseInt(item, 10)
    //     })
    //     this.calendarOptions = {
    //       selectedYear: dateArr[0],
    //       selectedMonth: dateArr[1]-1,
    //       selectedDate: dateArr[2],
    //       // curEventsDate: dateString
    //     }
    //   }
    // }
  }
}
</script>
<style lang="scss" scoped>
.el-event-calendar-container{
  color: #606266;
  border: 1px solid #e4e7ed;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
  background: #fff;
  border-radius: 4px;
  line-height: 30px;
  margin: 5px 0;
  width: 322px;
  *{
    box-sizing: border-box;
  }
  ::-webkit-scrollbar{
    width: 8px;
    height: 8px;
  }
  ::-webkit-scrollbar-track {
    box-shadow: inset 0 0 2px rgba(0,0,0,.2);
    border-radius: 5px;
  }
  ::-webkit-scrollbar-thumb {
    border-radius: 5px;
    background: rgba(0,0,0,.2);
  }

  .tips-top{
    padding:12px;
  }
  .tips-bottom{
    padding:12px;
  }
}
</style>
