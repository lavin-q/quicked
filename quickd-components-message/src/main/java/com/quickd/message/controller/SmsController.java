

package com.quickd.message.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.Const;
import com.quickd.core.common.JsonResult;
import com.quickd.core.config.AliyunStorageConfig;
import com.quickd.core.config.ConfigFactory;
import com.quickd.core.config.SmsConfig;
import com.quickd.core.controller.BaseController;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.message.entity.SysSmsEntity;

import com.quickd.message.dto.SysSmsDTO;
import com.quickd.message.service.SysSmsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;


/**
 * 短信服务
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("sys/sms")
@Api(tags = "短信服务")
public class SmsController extends BaseController<SysSmsService, SysSmsEntity, SysSmsDTO> {


    @GetMapping("/config")
    @ApiOperation("获取配置短信")
    //@RequiresPermissions("sys:sms:all")
    public JsonResult<SmsConfig> config() {
        String config = ConfigFactory.getConfig(Const.SMS_CONFIG_KEY);
        SmsConfig smsConfig = JSON.parseObject(config, SmsConfig.class);

        return new JsonResult<SmsConfig>().ok(smsConfig);
    }

    @PostMapping("/saveConfig")
    @ApiOperation("保存配置短信")
    @LogOperationAno("保存配置短信")
    //@RequiresPermissions("sys:sms:all")
    public JsonResult saveConfig(@RequestBody SmsConfig config) {
        //校验类型
        ValidatorUtils.validateEntity(config);
        ConfigFactory.updateConfig(Const.SMS_CONFIG_KEY, JSONObject.toJSON(config).toString(), "短信配置信息");
        return new JsonResult();
    }

    @PostMapping("/send")
    @ApiOperation("发送短信")
    @LogOperationAno("发送短信")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "mobile", value = "手机好号", paramType = "query", required = true, dataType = "String"),
            @ApiImplicitParam(name = "params", value = "参数", paramType = "query", required = true, dataType = "String"),
            @ApiImplicitParam(name = "templateCode", value = "短信模板", paramType = "query", required = true, dataType = "String")
    })
    //@RequiresPermissions("sys:sms:all")
    public JsonResult send(@RequestParam(required = true, value = "mobile") String mobile, @RequestParam(required = true, value = "params") String params,
                           @RequestParam(required = true, value = "templateCode") String templateCode) {
        baseService.send(mobile, params, templateCode);
        return new JsonResult();
    }

}