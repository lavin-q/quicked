package com.quickd.sys.controller;


import com.quickd.core.controller.BaseController;
import com.quickd.sys.dto.LogErrorDto;
import com.quickd.sys.dto.LogLoginDto;
import com.quickd.sys.entity.LogError;
import com.quickd.sys.entity.LogLogin;
import com.quickd.sys.service.ILogErrorService;
import com.quickd.sys.service.ILogLoginService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

/**
 * <p>
 * 异常日志 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/logError")
@Api(tags="异常日志")
public class LogErrorController extends BaseController<ILogErrorService, LogError, LogErrorDto> {

}
