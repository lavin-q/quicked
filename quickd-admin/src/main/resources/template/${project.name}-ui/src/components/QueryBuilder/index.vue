<template>
  <div :class="{ 'vue-query-builder-styled': styled }" class="vue-query-builder">
    <query-builder-group
      :index="0"
      :query.sync="query"
      :rule-types="ruleTypes"
      :rules="mergedRules"
      :max-depth="maxDepth"
      :depth="depth"
      :styled="styled"
      :labels="mergedLabels"
      type="query-builder-group"
    />
  </div>
</template>

<script>
import QueryBuilderGroup from './components/QueryBuilderGroup.vue'
import deepClone from '@/utils/tool'
// import 'bootstrap/dist/css/bootstrap.min.css'
var defaultLabels = {
  matchType: 'Match Type',
  matchTypes: [
    { 'id': 'all', 'label': 'All' },
    { 'id': 'any', 'label': 'Any' }
  ],
  addRule: 'Add Rule',
  removeRule: '&times;',
  addGroup: 'Add Group',
  removeGroup: '&times;',
  textInputPlaceholder: 'value'
}

export default {
  name: 'VueQueryBuilder',

  components: {
    QueryBuilderGroup
  },

  props: {
    rules: Array,
    labels: {
      type: Object,
      default() {
        return defaultLabels
      }
    },
    styled: {
      type: Boolean,
      default: true
    },
    maxDepth: {
      type: Number,
      default: 3,
      validator: function(value) {
        return value >= 1
      }
    },
    value: Object
  },

  data() {
    return {
      depth: 1,
      query: {
        logicalOperator: this.labels.matchTypes[0].id,
        children: []
      },
      ruleTypes: {
        'text': {
          operators: ['等于/eq', '不等于/ne', '包含/cn', '不包含/nc', '为空/nu', '不为空/nn', '开头是/bw', '结尾是/en'],
          inputType: 'text',
          id: 'text-field'
        },
        'numeric': {
          operators: ['等于/eq', '不等于/ne', '小于/lt', '小于等于/le', '大于/gt', '大于等于/ge'],
          inputType: 'number',
          id: 'number-field'
        },
        'custom': {
          operators: ['等于/eq', '不等于/ne'],
          inputType: 'text',
          id: 'custom-field'
        },
        'radio': {
          operators: ['等于/eq', '不等于/ne'],
          choices: [],
          inputType: 'radio',
          id: 'radio-field'
        },
        'checkbox': {
          operators: ['等于/eq', '不等于/ne'],
          choices: [],
          inputType: 'checkbox',
          id: 'checkbox-field'
        },
        'select': {
          operators: ['等于/eq', '不等于/ne'],
          choices: [],
          inputType: 'select',
          id: 'select-field'
        },
        'multi-select': {
          operators: ['等于/eq', '不等于/ne'],
          choices: [],
          inputType: 'select',
          id: 'multi-select-field'
        },
        'date-picker': {
          operators: ['区间/bt'],
          inputType: 'date-picker',
          id: 'date-picker-field'
        }
      }
    }
  },

  computed: {
    mergedLabels() {
      return Object.assign({}, defaultLabels, this.labels)
    },

    mergedRules() {
      var mergedRules = []
      var vm = this

      vm.rules.forEach(function(rule) {
        if (typeof vm.ruleTypes[rule.type] !== 'undefined') {
          mergedRules.push(Object.assign({}, vm.ruleTypes[rule.type], rule))
        } else {
          mergedRules.push(rule)
        }
      })

      return mergedRules
    }
  },

  mounted() {
    this.$watch(
      'query',
      newQuery => {
        if (JSON.stringify(newQuery) !== JSON.stringify(this.value)) {
          this.$emit('input', deepClone(newQuery))
        }
      }, {
        deep: true
      })

    this.$watch(
      'value',
      newValue => {
        if (JSON.stringify(newValue) !== JSON.stringify(this.query)) {
          this.query = deepClone(newValue)
        }
      }, {
        deep: true
      })

    if (typeof this.$options.propsData.value !== 'undefined') {
      this.query = Object.assign(this.query, this.$options.propsData.value)
    }
  }
}
</script>
<style scoped src="bootstrap/dist/css/bootstrap.min.css"></style>
<style>
.panel .panel-body {
    padding: 15px!important;
}
  /* .vue-query-builder-styled .vqb-group .rule-actions {
    margin-bottom: 20px;
  } */

  .vue-query-builder-styled .vqb-rule {
    margin-top: 15px;
    margin-bottom: 15px;
    background-color: #f5f5f5;
    border-color: #ddd;
    padding: 15px;
  }

  .vue-query-builder-styled .vqb-rule label {
    margin-right: 10px;
  }

  .vue-query-builder-styled .vqb-group.depth-1 .vqb-rule,
  .vue-query-builder-styled .vqb-group.depth-2 {
    border-left: 2px solid #8bc34a;
  }

  .vue-query-builder-styled .vqb-group.depth-2 .vqb-rule,
  .vue-query-builder-styled .vqb-group.depth-3 {
    border-left: 2px solid #00bcd4;
  }

  .vue-query-builder-styled .vqb-group.depth-3 .vqb-rule,
  .vue-query-builder-styled .vqb-group.depth-4 {
    border-left: 2px solid #ff5722;
  }

  .vue-query-builder-styled .close {
    opacity: 1;
    color: rgb(150,150,150);
  }

  @media (min-width: 768px) {
    .vue-query-builder-styled .vqb-rule.form-inline .form-group {
      display: block;
    }
  }
</style>
