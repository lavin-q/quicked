package com.quickd.sys.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.sys.entity.Dict;
import com.quickd.sys.mapper.DictMapper;
import com.quickd.sys.service.IDictService;
import com.quickd.sys.vo.DictVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Service
@Slf4j
public class DictServiceImpl extends BaseServiceImpl<DictMapper, Dict> implements IDictService {

    /**
     * 通过查询指定code 获取字典
     * @param code
     * @return
     */
    @Override
    @Cacheable(value = "dictCache",key = "#code")
    public List<DictVo> queryDictItemsByCode(String code) {
        log.info("无缓存dictCache的时候调用这里！");
        return baseDao.queryDictItemsByCode(code);
    }

    /**
     * 通过查询指定code 获取字典值text
     * @param code
     * @param key
     * @return
     */

    @Override
    @Cacheable(value = "dictCache")
    public String queryDictTextByKey(String code, String key) {
        log.info("无缓存dictText的时候调用这里！");
        return baseDao.queryDictTextByKey(code, key);
    }

    /**
     * 通过查询指定table的 text code 获取字典
     * dictTableCache采用redis缓存有效期10分钟
     * @param table
     * @param text
     * @param code
     * @return
     */
    @Override
    //@Cacheable(value = "dictTableCache")
    public List<DictVo> queryTableDictItemsByCode(String table, String text, String code) {
        log.info("无缓存dictTableList的时候调用这里！");
        return baseDao.queryTableDictItemsByCode(table,text,code);
    }

    /**
     * 通过查询指定table的 text code 获取字典值text
     * dictTableCache采用redis缓存有效期10分钟
     * @param table
     * @param text
     * @param code
     * @param key
     * @return
     */
    @Override
    @Cacheable(value = "dictTableCache")
    public String queryTableDictTextByKey(String table,String text,String code, String key) {
        log.info("无缓存dictTable的时候调用这里！");
        return baseDao.queryTableDictTextByKey(table,text,code,key);
    }

}
