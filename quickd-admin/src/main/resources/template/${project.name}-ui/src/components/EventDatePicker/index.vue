<template>
  <div
    :style="{display:inline?'inline-block':'block'}"
    class="event-date-picker-container"
    @mouseenter="showCalender=true"
    @mouseleave="showCalender=false"
    @mouseover="showDelBtn"
    @mouseout="isShowDelBtn=false">
    <div :class="['event-date-picker-input--'+size]" class="event-date-picker-input">
      <input
        :value="modelVal"
        :title="modelVal"
        type="text"
        autocomplete="off"
        placeholder="请选择日期"
        class="event-date-picker-input__inner">
      <span class="event-date-picker-input__prefix"><svg-icon icon-class="date"/></span>
      <span v-show="isShowDelBtn" class="event-date-picker-input__suffix">
        <span class="event-date-picker-input__suffix-inner" style="cursor:pointer;" @click="clear"><svg-icon icon-class="close"/></span>
      </span>
    </div>
    <div v-show="showCalender" class="dropdown-calendar">
      <event-calendar
        :setting="setting"
        :mark-days="markDays"
        :only-trigger-mark-days="onlyTriggerMarkDays"
        :selected-dates="modelVal"
        :model-val="modelVal"
        class="event-calendar-custom"
        @dayChanged="eventDayChanged"
        @yearMonthChanged="eventYearMonthChanged">
        <template v-slot:tips-top>
          <slot name="tips-top"/>
        </template>
        <template v-slot:tips-bottom>
          <slot name="tips-bottom"/>
        </template>
      </event-calendar>
      <div v-if="loading" class="loading-wape">
        <div class="loading-spinner">
          <svg-icon icon-class="loading" class-name="loading-svg"/>
          <div class="loading-text">正在加载中，请稍等.....</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import EventCalendar from '@/components/EventCalendar'
export default {
  name: 'EventDatePicker',
  components: {
    EventCalendar
  },
  model: {
    prop: 'modelVal',
    event: 'input'
  },
  props: {
    size: {
      type: String,
      default: 'small'
    },
    inline: {
      type: Boolean,
      default: true
    },
    modelVal: {
      type: String,
      default: null
    },
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
        params:传递的参数            （非必有）
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
    loading: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      showCalender: false,
      isShowDelBtn: false
    }
  },
  methods: {
    eventDayChanged(data, isSelectedTheEventDay) {
      if (this.setting.multiple) { // 多选
        if ((this.onlyTriggerMarkDays && isSelectedTheEventDay) || !this.onlyTriggerMarkDays) { // 只允许事件日期触发
          this.$emit('input', data.selectedDates.join(','))
          this.$emit('dayChanged', data.selectedDates, data.selectedDatesDetails)
        }
      } else {
        if ((this.onlyTriggerMarkDays && isSelectedTheEventDay) || !this.onlyTriggerMarkDays) {
          this.$emit('input', data.changedDate)
          this.$emit('dayChanged', data.changedDate, data.changedDateDetails)
        }
        this.showCalender = false
      }
    },
    eventYearMonthChanged(year, month) {
      this.$emit('yearMonthChanged', year, month)
    },
    showDelBtn() {
      if (this.modelVal) {
        this.isShowDelBtn = true
      }
    },
    clear() {
      this.$emit('input', null)
      this.$emit('dayChanged', null)
    }
  }
}
</script>
<style lang="scss" scoped>
.event-date-picker-container{
  position:relative;

  .event-date-picker-input {
    position: relative;
    font-size: 14px;
    display: inline-block;
    width: 100%;

    .event-date-picker-input__inner {
      -webkit-appearance: none;
      background-color: #fff;
      background-image: none;
      border-radius: 4px;
      border: 1px solid #dcdfe6;
      box-sizing: border-box;
      color: #606266;
      display: inline-block;
      font-size: inherit;
      height: 40px;
      line-height: 40px;
      outline: none;
      padding: 0 15px;
      padding-left:20px;
      transition: border-color .2s cubic-bezier(.645,.045,.355,1);
      width: 100%;

      &:focus {
        outline: none;
        border-color: #409eff;
      }

      &::-webkit-input-placeholder {
        color: #aab2bd;
      }
    }
    .event-date-picker-input__prefix{
      position: absolute;
      left: 5px;
      top: 0;
      color: #c0c4cc;
      height: 100%;
      text-align: center;
      transition: all .3s;
      line-height:40px;
    }
    .event-date-picker-input__suffix{
      position: absolute;
      height: 100%;
      right: 5px;
      top: 0;
      text-align: center;
      color: #c0c4cc;
      transition: all .3s;
      pointer-events: none;
      .event-date-picker-input__suffix-inner{
        pointer-events: all;
        &:hover{
          color:#777676;
        }
      }
    }
    &.event-date-picker-input--mini {
      font-size: 12px;
      .event-date-picker-input__inner {
        height: 28px;
        line-height: 28px;
      }
      .event-date-picker-input__prefix{
        line-height:28px;
      }
      .event-date-picker-input__suffix{
        line-height:28px;
      }
    }
    &.event-date-picker-input--small {
      font-size: 13px;
      .event-date-picker-input__inner {
        height: 32px;
        line-height: 32px;
      }
      .event-date-picker-input__prefix{
        line-height:32px;
      }
      .event-date-picker-input__suffix{
        line-height:32px;
      }
    }
    &.event-date-picker-input--medium{
      .event-date-picker-input__inner {
        height: 36px;
        line-height: 36px;
      }
      .event-date-picker-input__prefix{
        line-height:36px;
      }
      .event-date-picker-input__suffix{
        line-height:36px;
      }
    }
  }
  .dropdown-calendar{
    position: absolute;
    top:99%;
    z-index:999;
  }
  .loading-wape{
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    background-color: hsla(0,0%,100%,.9);
    color:#409EFF;

    .loading-spinner{
      position: absolute;
      top: 50%;
      margin-top: -33px;
      width: 100%;
      text-align: center;

      .loading-svg{
        margin-right:10px;
        font-size:38px;
        animation: loading-rotate 1s linear infinite;
      }

      .loading-text{
        font-size:12px;
        line-height:28px;
      }
    }
  }

  @keyframes loading-rotate {
    to{transform:rotate(1turn)}
  }
}

</style>
