package com.quickd.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quickd.core.common.PageUtils;
import com.quickd.sys.dto.RedisDto;
import com.quickd.sys.entity.RedisInfo;

import java.util.List;
import java.util.Map;
/**
 * @project: quickd
 * @description: RedisService
 * @author: quikcd
 * @create: 2019-09-20 16:41
 */
public interface IRedisService {

    /**
     * 获取 redis 的详细信息
     *
     * @return List
     */
    List<RedisInfo> getRedisInfo() ;

    /**
     * 获取 redis key 数量
     *
     * @return Map
     */
    Map<String, Object> getKeysSize() ;

    /**
     * 获取 redis 内存信息
     *
     * @return Map
     */
    Map<String, Object> getMemoryInfo() ;

    /**
     * findById
     * @param key
     * @return
     */
    PageUtils<RedisDto> findByKey(String key, IPage<RedisDto> page);


    /**
     * delete
     * @param key
     */
    void delete(String key);

    /**
     * 清空所有缓存
     */
    void flushdb();
}
