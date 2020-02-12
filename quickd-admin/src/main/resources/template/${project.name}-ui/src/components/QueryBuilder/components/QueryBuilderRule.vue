<template>
  <div :class="{ 'panel panel-default form-inline': styled }" class="vqb-rule">
    <div :class="{ 'form-group': styled }">
      <label>{{ rule.label }}</label>

      <select v-if="typeof rule.operands !== 'undefined'" v-model="query.selectedOperand" :class="{ 'form-control': styled }">
        <option v-for="(operand,index) in rule.operands" :key="index">{{ operand }}</option>
      </select>

      <select v-if="typeof rule.operators !== 'undefined' && rule.operators.length > 1" v-model="query.selectedOperator" :class="{ 'form-control': styled }">
        <option v-for="(operator,index) in rule.operators" :value="operator" :key="index">
          {{ operator }}
        </option>
      </select>

      <input v-if="rule.inputType === 'text'" :class="{ 'form-control': styled }" v-model="query.value" :placeholder="labels.textInputPlaceholder" type="text">
      <input v-if="rule.inputType === 'number'" :class="{ 'form-control': styled }" v-model="query.value" type="number">
      <input v-if="rule.inputType === 'date'" :class="{ 'form-control': styled }" v-model="query.value" type="date">

      <template v-if="isCustomComponent">
        <component :value="query.value" :is="rule.component" @input="updateQuery"/>
      </template>

      <div v-if="rule.inputType === 'checkbox'" class="checkbox">
        <label v-for="(choice,index) in rule.choices" :key="index">
          <input :value="choice.value" v-model="query.value" type="checkbox"> {{ choice.label }}
        </label>
      </div>

      <div v-if="rule.inputType === 'radio'" class="radio">
        <label v-for="(choice,index) in rule.choices" :key="index">
          <input :value="choice.value" v-model="query.value" type="radio"> {{ choice.label }}
        </label>
      </div>

      <select
        v-if="rule.inputType === 'select'"
        :class="{ 'form-control': styled }"
        :multiple="rule.type === 'multi-select'"
        v-model="query.value">

        <template v-for="(option, option_key) in selectOptions">
          <option v-if="!Array.isArray(option)" :value="option.value">
            {{ option.label }}
          </option>
          <optgroup v-if="Array.isArray(option)" :label="option_key">
            <option v-for="sub_option in option" :value="sub_option.value">{{ sub_option.label }}</option>
          </optgroup>
        </template>

      </select>
      <el-date-picker
        v-if="rule.inputType === 'date-picker'"
        v-model="dateValue"
        :class="{ 'form-control': styled }"
        size="small"
        type="daterange"
        align="right"
        unlink-panels
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        value-format="yyyy-MM-dd HH:mm:ss"
        @change="pickerChange"/>
      <button :class="{ 'close pull-right': styled }" type="button" @click="remove" v-html="labels.removeRule"/>
    </div>
  </div>
</template>

<script>
import deepClone from '@/utils/tool'

export default {
  name: 'QueryBuilderRule',

  props: ['query', 'index', 'rule', 'styled', 'labels'],
  data() { return { dateValue: '' } },

  computed: {
    isCustomComponent() {
      return this.rule.type === 'custom-component'
    },

    selectOptions() {
      if (typeof this.rule.choices === 'undefined') {
        return {}
      }

      return this.rule.choices.reduce(function(groups, item, index) {
        const key = item['group']
        if (typeof key !== 'undefined') {
          groups[key] = groups[key] || []
          groups[key].push(item)
        } else {
          groups[index] = item
        }

        return groups
      }, {})
    }
  },
  beforeMount() {
    if (this.rule.type === 'custom-component') {
      this.$options.components[this.id] = this.rule.component
    }
  },

  mounted() {
    const updated_query = deepClone(this.query)

    // Set a default value for these types if one isn't provided already
    if (this.query.value === null) {
      if (this.rule.inputType === 'checkbox') {
        updated_query.value = []
      }
      if (this.rule.type === 'select') {
        updated_query.value = this.rule.choices[0].value
      }
      if (this.rule.type === 'custom-component') {
        updated_query.value = null
        if (typeof this.rule.default !== 'undefined') {
          updated_query.value = deepClone(this.rule.default)
        }
      }
      this.$emit('update:query', updated_query)
    }
  },

  methods: {
    remove: function() {
      this.$emit('child-deletion-requested', this.index)
    },
    updateQuery(value) {
      const updated_query = deepClone(this.query)
      updated_query.value = value
      this.$emit('update:query', updated_query)
    },
    pickerChange(e) {
      const updated_query = deepClone(this.query)
      if (this.rule.type === 'date-picker') {
        updated_query.value = this.dateValue
        console.log(this.dateValue)
      }
      this.$emit('update:query', updated_query)
    }
  }
}
</script>
<style scoped src="bootstrap/dist/css/bootstrap.min.css"></style>

