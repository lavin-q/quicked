package com.quickd.sys.service;

import com.quickd.core.exception.BusinessException;
import com.quickd.sys.entity.RedisInfo;

import java.util.List;
import java.util.Map;

/**
 * @project: quickd
 * @description: RedisService
 * @author: quickd
 * @create: 2019-09-20 16:41
 */
public interface RedisService {

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
}
