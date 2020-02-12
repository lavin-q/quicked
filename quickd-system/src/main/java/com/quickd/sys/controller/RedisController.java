package com.quickd.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.JsonResult;
import com.quickd.sys.dto.RedisDto;
import com.quickd.sys.service.IRedisService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @project: quickd-backend
 * @description: RedisController
 * @author: quickd
 * @create: 2019-09-29 06:49
 */
@RestController
@RequestMapping("api")
public class RedisController {

    @Autowired
    private IRedisService redisService;

    @LogOperationAno("查询Redis缓存")
    @GetMapping(value = "/redis")
    @RequiresPermissions("hasAnyRole('ADMIN','REDIS_ALL','REDIS_SELECT')")
    public JsonResult getRedis(String key, IPage<RedisDto> iPage){
        return new JsonResult().ok(redisService.findByKey(key,iPage));
    }

    @LogOperationAno("删除Redis缓存")
    @DeleteMapping(value = "/redis")
    @RequiresPermissions("hasAnyRole('ADMIN','REDIS_ALL','REDIS_DELETE')")
    public JsonResult delete(@RequestBody RedisDto resources){
        redisService.delete(resources.getKey());
        return new JsonResult<>();
    }

    @LogOperationAno("清空Redis缓存")
    @DeleteMapping(value = "/redis/all")
    @RequiresPermissions("hasAnyRole('ADMIN','REDIS_ALL','REDIS_DELETE')")
    public JsonResult deleteAll(){
        redisService.flushdb();
        return new JsonResult<>();
    }
}
