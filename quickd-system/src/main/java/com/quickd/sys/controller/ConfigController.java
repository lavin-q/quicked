package com.quickd.sys.controller;


import com.quickd.core.common.JsonResult;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.core.validator.group.AddGroup;
import com.quickd.sys.entity.Config;
import com.quickd.sys.service.IConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

/**
 * <p>
 * 参数配置表 前端控制器
 * </p>
 *
 * @author quickd
 * @since 2019-09-29
 */
@RestController
@RequestMapping("/sys/config")
@Api(value = "系统配置接口", tags = "包含系统配制一系列操作")
public class ConfigController {
    @Autowired
    private IConfigService sysConfigService;

    @GetMapping("/getConfig")
    @ApiOperation(value = "查询配置信息", notes = "根据key查询对应的配置信息")
    public JsonResult getConfigList( String key) {
        return new JsonResult().ok(sysConfigService.getSysConfigByKey(key));
    }

    @PostMapping("/saveOrUpdate")
    @ApiOperation(value = "保存或者修改系统配置", notes = "保存或者修改系统配置并且使用")
    public JsonResult saveOrUpdate(@RequestBody Config sysConfig) {
        ValidatorUtils.validateEntity(sysConfig, AddGroup.class);
        sysConfigService.saveOrUpdate(sysConfig);
        return new JsonResult();
    }

}
