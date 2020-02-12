

package com.quickd.message.controller;


import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.Const;
import com.quickd.core.common.JsonResult;
import com.quickd.core.config.ConfigFactory;
import com.quickd.core.controller.BaseController;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.message.dto.SysMailTemplateDTO;
import com.quickd.message.email.EmailConfig;
import com.quickd.message.entity.SysMailTemplateEntity;
import com.quickd.message.service.SysMailTemplateService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;




/**
 * 邮件模板
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("sys/mailtemplate")
@Api(tags = "邮件模板")
public class MailTemplateController extends BaseController<SysMailTemplateService, SysMailTemplateEntity, SysMailTemplateDTO> {


    private final static String KEY = Const.MAIL_CONFIG_KEY;


    @GetMapping("/config")
    @ApiOperation("获取配置信息")
//    @RequiresPermissions("sys:mail:all")
    public JsonResult<EmailConfig> config() {
        String config = ConfigFactory.getConfig(Const.MAIL_CONFIG_KEY);
        EmailConfig emailConfig =  JSON.parseObject(config, EmailConfig.class);
        return new JsonResult<EmailConfig>().ok(emailConfig);
    }

    @PostMapping("/saveConfig")
    @ApiOperation("保存配置信息")
    @LogOperationAno("保存配置信息")
//    @RequiresPermissions("sys:mail:all")
    public JsonResult saveConfig(@RequestBody EmailConfig config) {
        //校验数据
        ValidatorUtils.validateEntity(config);
        ConfigFactory.updateConfig(Const.MAIL_CONFIG_KEY, JSONObject.toJSON(config).toString(),"邮件配置信息");
        return new JsonResult();
    }


    @PostMapping("/send")
    @ApiOperation("发送邮件")
    @LogOperationAno("发送邮件")
//    @RequiresPermissions("sys:mail:all")
    public JsonResult send(String id, String mailTo, String mailCc, String params) throws Exception {
        boolean flag = baseService.sendMail(id, mailTo, mailCc, params);
        if (flag) {
            return new JsonResult();
        }
        return new JsonResult().error("邮件发送失败");
    }

}