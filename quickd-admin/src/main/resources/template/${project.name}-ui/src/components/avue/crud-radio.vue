<template>
  <el-radio-group :disabled="disabled" v-model="text" @change="handleChange">
    <el-radio v-for="(item,index) in dataList" :key="index" :label="item.value">{{ item.label }}</el-radio>
  </el-radio-group>
</template>

<script>
export default {
  name: 'AvueCrudRadio',
  props: {
    value: {
      default: ''
    },
    disabled: {
      type: Boolean,
      default: false
    },
    dataList: {
      type: Array,
      default: () => {
        return []
      }
    }
  },
  data() {
    return {
      text: ''
    }
  },
  watch: {
    value: function(n, o) {
      this.text = this.value
    }
  },
  created() {
    this.text = this.value
  },
  mounted() {
  },
  methods: {
    handleChange(value) {
      this.$emit('input', value)
    }
  }
}
</script>

<style>

</style>
