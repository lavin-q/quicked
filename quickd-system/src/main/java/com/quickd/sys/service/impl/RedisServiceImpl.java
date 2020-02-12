package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.quickd.core.common.PageUtils;
import com.quickd.sys.dto.RedisDto;
import com.quickd.sys.entity.RedisInfo;
import com.quickd.sys.service.IRedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * Redis 监控信息获取
 *
 * @project: quickd
 * @description: RedisServiceImpl
 * @author: quikcd
 * @create: 2019-09-20 16:42
 */
@Service("redisService")
@Slf4j
public class RedisServiceImpl implements IRedisService {


    @Autowired
    private RedisConnectionFactory redisConnectionFactory;
    @Autowired
    RedisTemplate redisTemplate;

    @Override
    public PageUtils<RedisDto> findByKey(String key, IPage<RedisDto> pageable){
        List<RedisDto> redisVos = new ArrayList<>();
        if(!"*".equals(key)){
            key = "*" + key + "*";
        }
        for (Object s : redisTemplate.keys(key)) {
            // 过滤掉权限的缓存
            if (s.toString().indexOf("role::loadPermissionByUser") != -1 || s.toString().indexOf("user::loadUserByUsername") != -1) {
                continue;
            }
            RedisDto RedisDto = new RedisDto(s.toString(),redisTemplate.opsForValue().get(s.toString()).toString());
            redisVos.add(RedisDto);
        }
        PageUtils<RedisDto> page = new PageUtils<>(redisVos, redisVos.size(), (int) pageable.getSize(), (int) pageable.getCurrent());
        return page;
    }

    @Override
    public void delete(String key) {
        redisTemplate.delete(key);
    }

    @Override
    public void flushdb() {
        redisTemplate.getConnectionFactory().getConnection().flushDb();
    }



    /**
     * Redis详细信息
     */
    @Override
    public List<RedisInfo> getRedisInfo()  {
        Properties info = redisConnectionFactory.getConnection().info();
        List<RedisInfo> infoList = new ArrayList<>();
        RedisInfo redisInfo = null;
        for (Map.Entry<Object, Object> entry : info.entrySet()) {
            redisInfo = new RedisInfo();
            redisInfo.setKey((String)entry.getKey());
            redisInfo.setValue((String)(entry.getValue()));
            infoList.add(redisInfo);
        }
        return infoList;
    }

    @Override
    public Map<String, Object> getKeysSize()  {
        Long dbSize = redisConnectionFactory.getConnection().dbSize();
        Map<String, Object> map = new HashMap<>();
        map.put("create_time", System.currentTimeMillis());
        map.put("dbSize", dbSize);
        log.info("--getKeysSize--: " + map.toString());
        return map;
    }

    @Override
    public Map<String, Object> getMemoryInfo()  {
        Map<String, Object> map = null;
        Properties info = redisConnectionFactory.getConnection().info();
        for (Map.Entry<Object, Object> entry : info.entrySet()) {
            String key = (String)entry.getKey();
            if ("used_memory".equals(key)) {
                map = new HashMap<>();
                map.put("used_memory", entry.getValue());
                map.put("create_time", System.currentTimeMillis());
            }
        }
        log.info("--getMemoryInfo--: " + map.toString());
        return map;
    }



}
