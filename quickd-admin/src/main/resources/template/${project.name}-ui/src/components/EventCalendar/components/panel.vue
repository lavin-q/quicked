<template>
  <div class="event-calendar-wrapper">
    <div class="event-calendar-header">
      <button type="button" title="上一年" class="event-calendar-header__icon-btn event-calendar-header__prev-btn" @click="preYear"><svg-icon icon-class="double-left"/></button>
      <button type="button" title="上个月" class="event-calendar-header__icon-btn event-calendar-header__prev-btn" @click="preMonth"><svg-icon icon-class="left"/></button>
      <span class="event-calendar-header__header-label">{{ curYearMonth }}</span>
      <button type="button" title="下一年" class="event-calendar-header__icon-btn event-calendar-header__next-btn" @click="nextYear"><svg-icon icon-class="double-right"/></button>
      <button type="button" title="下个月" class="event-calendar-header__icon-btn event-calendar-header__next-btn" @click="nextMonth"><svg-icon icon-class="right"/></button>
    </div>
    <div class="event-calendar-body">
      <table cellspacing="0" cellpadding="0" class="event-calendar-date-table" style="">
        <tbody>
          <tr>
            <th
              v-for="(dayName, dayIndex) in i18n[setting.locale].dayNames"
              :key="dayIndex"
            >
              {{ i18n[setting.locale].dayNames[(dayIndex + setting.weekStartOn) % 7] }}
            </th>
          </tr>
          <template v-for="index in dayList.length/7">
            <tr v-if="!(dayList[(index-1)*7].status===0 && dayList[(index-1)*7+6].status===0)" :key="index" class="event-calendar-date-table__row">
              <td
                v-for="j in 7"
                :key="dayList[(index-1)*7+j-1].date"
                :class="[{
                  today: dayList[(index-1)*7+j-1].status ? (today === dayList[(index-1)*7+j-1].date) : false,
                  available:dayList[(index-1)*7+j-1].status,
                  event: dayList[(index-1)*7+j-1].status ? (dayList[(index-1)*7+j-1].title != undefined) : false,
                  [setting.selectedDayClassNm] : selectedDates.indexOf(dayList[(index-1)*7+j-1].date)>=0
                }, ...dayList[(index-1)*7+j-1].customClass]"
                @click="handleChangeSelectedDay(dayList[(index-1)*7+j-1])"
              >
                <div style="position:relative;">
                  <!-- 非当月 -->
                  <span v-if="dayList[(index-1)*7+j-1].status==0" class="item">&nbsp;</span>
                  <!-- 当月，选中的日期且被标记的日期 -->
                  <span
                    v-else-if="selectedDates.indexOf(dayList[(index-1)*7+j-1].date)>=0 && dayList[(index-1)*7+j-1].title != undefined"
                    :style="{backgroundColor:customColor?customColor:'inherit',color:customColor?'#fff':'inherit'}"
                    class="item is-selected is-marked" >
                    {{ dayList[(index-1)*7+j-1].simplifyDate.split('-')[2] }}
                  </span>
                  <!-- 当月，选中的日期，但非标记的日期 -->
                  <span v-else-if="selectedDates.indexOf(dayList[(index-1)*7+j-1].date)>=0" class="item is-selected">
                    {{ dayList[(index-1)*7+j-1].simplifyDate.split('-')[2] }}
                  </span>
                  <!-- 当月，非选中但被标记的日期markDays，即有title的日期-->
                  <span
                    v-else-if="dayList[(index-1)*7+j-1].title != undefined"
                    :style="{color: customColor?customColor:'inherit'}"
                    class="item is-marked" >
                    {{ dayList[(index-1)*7+j-1].simplifyDate.split('-')[2] }}
                  </span>
                  <!-- 当月，非选中但被标记的日期markDays，即有title的日期-->
                  <span v-else-if="today === dayList[(index-1)*7+j-1].date" class="item is-today">
                    {{ dayList[(index-1)*7+j-1].simplifyDate.split('-')[2] }}
                  </span>
                  <!-- 当月，非选中，非标记,非当天的日期 -->
                  <span v-else class="item">
                    {{ dayList[(index-1)*7+j-1].simplifyDate.split('-')[2] }}
                  </span>
                </div>
                <div v-if="dayList[(index-1)*7+j-1].status&&dayList[(index-1)*7+j-1].desc" class="item-desc">
                  {{ dayList[(index-1)*7+j-1].desc }}
                </div>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
      <!-- <div class="weeks">
        <span
          v-for="(dayName, dayIndex) in i18n[setting.locale].dayNames"
          class="item"
          :key="dayIndex"
          >
          {{i18n[setting.locale].dayNames[(dayIndex + setting.weekStartOn) % 7]}}
        </span>
      </div> -->
      <!-- <div class="dates" >
        <div v-for="date in dayList" class="item"
          :class="[{
            today: date.status ? (today == date.date) : false,
            event: date.status ? (date.title != undefined) : false,
            [setting.selectedDayClassNm] : (date.date == selectedDay)
          }, ...date.customClass]"
          :key="date.date"
          >
          <p class="date-num"
            @click="handleChangeSelectedDay(date)"
            :style="{color: date.title != undefined ? ((date.date == selectedDay) ? '#fff' : customColor) : 'inherit'}">
            {{date.status ? date.date.split('-')[2] : '&nbsp;'}}</p>
          <span v-if="date.status ? (today == date.date) : false" class="is-today" :style="{backgroundColor: customColor }" ></span>
          <span v-if="date.status ? (date.title != undefined) : false" class="is-event"
            :style="{borderColor: customColor, backgroundColor: (date.date == selectedDay) ? customColor : 'inherit'}"></span>
        </div>
      </div> -->
    </div>
  </div>
</template>

<script>
import i18n from '../i18n.js'
import { dateTimeFormatter, isEqualDateStr } from '../tools.js'
export default {
  props: {
    setting: {
      type: Object,
      required: true
    },
    onlyTriggerMarkDays: {
      type: Boolean,
      required: true
    },
    calendar: {
      type: Object,
      required: true
    },
    markDays: {
      type: Array,
      required: true
    },
    selectedDates: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      i18n
    }
  },
  computed: {
    dayList() {
      const _this = this
      const firstDay = new Date(this.calendar.selectedYear, this.calendar.selectedMonth, 1)
      let dayOfWeek = firstDay.getDay()
      // 根据当前日期计算偏移量 // Calculate the offset based on the current date
      if (this.setting.weekStartOn > dayOfWeek) {
        dayOfWeek = dayOfWeek - this.setting.weekStartOn + 7
      } else {
        dayOfWeek = dayOfWeek - this.setting.weekStartOn
      }
      const startDate = new Date(firstDay)
      startDate.setDate(firstDay.getDate() - dayOfWeek)
      let item, status, tempItem
      const tempArr = []
      for (let i = 0; i < 42; i++) {
        item = new Date(startDate)
        item.setDate(startDate.getDate() + i)
        if (_this.calendar.selectedMonth === item.getMonth()) {
          status = 1
        } else {
          status = 0
        }
        tempItem = {
          simplifyDate: `${item.getFullYear()}-${item.getMonth() + 1}-${item.getDate()}`,
          date: dateTimeFormatter(item, _this.setting.format),
          status: status,
          customClass: []
        }
        _this.markDays.forEach((markDay) => {
          if (isEqualDateStr(markDay.date, tempItem.date)) {
            tempItem.title = markDay.title || 'markDay'
            tempItem.desc = markDay.desc || null
            tempItem.params = markDay.params || null
            if (markDay.customClass) tempItem.customClass.push(markDay.customClass)
          }
        })
        tempArr.push(tempItem)
      }
      return tempArr
    },
    today() {
      const dateObj = new Date()
      return dateTimeFormatter(dateObj, this.setting.format)
      // return `${dateObj.getFullYear()}-${dateObj.getMonth()+1}-${dateObj.getDate()}`
    },
    curYearMonth() {
      const tempDate = Date.parse(new Date(`${this.calendar.selectedYear}-${this.calendar.selectedMonth + 1}-01`))
      return dateTimeFormatter(tempDate, this.i18n[this.setting.locale].format)
    },
    customColor() {
      return this.setting.color
    }
  },
  methods: {
    preMonth() {
      this.$emit('pre-Month')
    },
    nextMonth() {
      this.$emit('next-Month')
    },
    preYear() {
      this.$emit('pre-Year')
    },
    nextYear() {
      this.$emit('next-Year')
    },
    handleChangeSelectedDay(date) {
      if (this.onlyTriggerMarkDays) {
        if (date.status && date.title !== undefined) {
          this.$emit('selected-day-changed', date.date, true)
        } else {
          this.$emit('selected-day-changed', date.date, false)
        }
      } else {
        this.$emit('selected-day-changed', date.date, true)
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.event-calendar-wrapper{
  .event-calendar-header{
    position:relative;
    margin: 12px;
    text-align: center;
    .event-calendar-header__icon-btn{
      font-size: 12px;
      color: #303133;
      border: 0;
      background: transparent;
      cursor: pointer;
      outline: none;
      margin-top: 8px;
    }
    .event-calendar-header__prev-btn{
      float:left;
    }
    .event-calendar-header__next-btn{
      float:right;
    }
    .event-calendar-header__header-label {
      font-size: 16px;
      font-weight: 500;
      padding: 0 5px;
      line-height: 22px;
      text-align: center;
      cursor: pointer;
      color: #606266;
    }
  }
  .event-calendar-body{
    position: relative;
    margin: 15px;
    .event-calendar-date-table{
      table-layout: fixed;
      width: 100%;
      font-size: 14px;
      user-select: none;
      font-family: Helvetica Neue,Helvetica,PingFang SC,Hiragino Sans GB,Microsoft YaHei,SimSun,sans-serif;
      font-weight: normal;

      td {
        // width: 32px;
        // height: 30px;
        // padding: 4px 0;
        box-sizing: border-box;
        text-align: center;
        position: relative;
        border: 1px solid #f1ebe4;
        border-right: 0;
        border-bottom:0;
        vertical-align: top;

        &.available:hover{
          color: #409eff;
          background-color:#e0ecf9;
        }
        &.event{
          cursor: pointer;
          font-weight: bolder;
        }
        &:last-of-type{
          border-right: 1px solid #f1ebe4;
        }

        .item{
          display: block;
          line-height: 24px;
          width: 24px;
          height: 24px;
          margin: 5px auto;
          // margin:12px auto;
          border-radius: 50%;
        }
        .item-desc{
          font-size:12px;
          font-weight: normal;
          color: rgb(218,217,217);
          line-height: 12px;
          margin-bottom: 2px;
        }
        .is-selected{
          color:#fff;
          background-color: #409eff;
        }
        .is-today{
          color: #409eff;
        }
        .is-marked{

        }
      }

      tr:last-of-type{
        td{
          border-bottom: 1px solid #f1ebe4;
        }
      }
    }
  }

}
</style>
