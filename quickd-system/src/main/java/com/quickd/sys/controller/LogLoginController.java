package com.quickd.sys.controller;

import com.quickd.sys.dto.LogLoginDto;
import com.quickd.sys.entity.LogLogin;
import com.quickd.sys.service.ILogLoginService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.quickd.core.controller.BaseController;
/**
 * <p>
 * 登录日志 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/logLogin")
@Api(tags="登录日志")
public class LogLoginController extends BaseController<ILogLoginService,LogLogin,LogLoginDto> {

}
