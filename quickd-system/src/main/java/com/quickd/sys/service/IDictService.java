package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.dto.DictDto;
import com.quickd.sys.entity.Dict;
import com.quickd.sys.vo.DictVo;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
public interface IDictService extends BaseService<Dict> {

    List<DictVo> queryDictItemsByCode(String code);

    List<DictVo> queryTableDictItemsByCode(String table, String text, String code);

    String queryDictTextByKey(String code, String key);

    String queryTableDictTextByKey(String table, String text, String code, String key);
}
