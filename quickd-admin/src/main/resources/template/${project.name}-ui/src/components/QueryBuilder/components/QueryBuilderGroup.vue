<template>
  <div :class="classObject" class="vqb-group">
    <div :class="{ 'panel-heading': styled }" class="vqb-group-heading">
      <div :class="{ 'form-inline': styled }" class="match-type-container">
        <div :class="{ 'form-group': styled }">
          <label for="vqb-match-type">{{ labels.matchType }}</label>
          <select id="vqb-match-type" :class="{ 'form-control': styled }" v-model="query.logicalOperator">
            <option v-for="(label, index) in labels.matchTypes" :key="index" :value="label.id">{{ label.label }}</option>
          </select>
        </div>
        <button v-if="depth > 1" :class="{ 'close pull-right': styled }" type="button" @click="remove" v-html="labels.removeGroup"/>
      </div>
    </div>

    <div :class="{ 'panel-body': styled }" class="vqb-group-body">
      <div :class="{ 'form-inline': styled }" class="rule-actions">
        <div :class="{ 'form-group': styled }">

          <select v-model="selectedRule" :class="{ 'form-control': styled }">
            <option v-for="(rule, index) in rules" :key="index" :value="rule">{{ rule.label }}</option>
          </select>

          <button :class="{ 'btn btn-default': styled }" type="button" @click="addRule" v-html="labels.addRule"/>
          <!-- <button type="button" :class="{ 'btn btn-default': styled }" v-if="this.depth < this.maxDepth" @click="addGroup" v-html="labels.addGroup"></button> -->
        </div>
      </div>

      <div class="children">
        <component
          v-for="(child, index) in query.children"
          :key="index"
          :is="child.type"
          :type="child.type"
          :query.sync="child.query"
          :rule-types="ruleTypes"
          :rules="rules"
          :rule="ruleById(child.query.rule)"
          :index="index"
          :max-depth="maxDepth"
          :depth="depth + 1"
          :styled="styled"
          :labels="labels"
          @child-deletion-requested="removeChild"/>
      </div>
    </div>
  </div>
</template>

<script>
import QueryBuilderRule from './QueryBuilderRule.vue'
import deepClone from '@/utils/tool'

export default {
  name: 'QueryBuilderGroup',

  components: {
    QueryBuilderRule
  },

  props: ['ruleTypes', 'type', 'query', 'rules', 'index', 'maxDepth', 'depth', 'styled', 'labels'],

  data() {
    return {
      selectedRule: this.rules[0]
    }
  },

  computed: {
    classObject() {
      var classObject = {
        'panel panel-default': this.styled
      }

      classObject['depth-' + this.depth.toString()] = this.styled

      return classObject
    }
  },

  methods: {
    ruleById(ruleId) {
      var rule = null

      this.rules.forEach(function(value) {
        if (value.id === ruleId) {
          rule = value
          return false
        }
      })

      return rule
    },

    addRule() {
      const updated_query = deepClone(this.query)
      const child = {
        type: 'query-builder-rule',
        query: {
          rule: this.selectedRule.id,
          selectedOperator: this.selectedRule.operators[0],
          selectedOperand: typeof this.selectedRule.operands === 'undefined' ? this.selectedRule.label : this.selectedRule.operands[0],
          value: null
        }
      }
      // A bit hacky, but `v-model` on `select` requires an array.
      if (this.ruleById(child.query.rule).type === 'multi-select') {
        child.query.value = []
      }
      updated_query.children.push(child)
      this.$emit('update:query', updated_query)
    },

    addGroup() {
      const updated_query = deepClone(this.query)
      if (this.depth < this.maxDepth) {
        updated_query.children.push({
          type: 'query-builder-group',
          query: {
            logicalOperator: this.labels.matchTypes[0].id,
            children: []
          }
        })
        this.$emit('update:query', updated_query)
      }
    },

    remove() {
      this.$emit('child-deletion-requested', this.index)
    },

    removeChild(index) {
      const updated_query = deepClone(this.query)
      updated_query.children.splice(index, 1)
      this.$emit('update:query', updated_query)
    }
  }
}
</script>
<style scoped src="bootstrap/dist/css/bootstrap.min.css"></style>
