import request from '@/utils/request'

/**
 * 数据字典接口
 * @param {*要查询的数据字典名称} name
 */
export function getDict(dictCode) {
  return request({
    url: '/sys/dict/queryDictItemByDictCode',
    method: 'get',
    params: { dictCode: dictCode }
  })
}
