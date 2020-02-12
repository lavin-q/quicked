package com.quickd.sys.controller;


import com.quickd.sys.dto.LogOperationDto;
import com.quickd.sys.entity.LogOperation;
import com.quickd.sys.service.ILogOperationService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.quickd.core.controller.BaseController;
/**
 * <p>
 * 操作日志 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/logOperation")
@Api(tags="操作日志")
public class LogOperationController extends BaseController<ILogOperationService, LogOperation,LogOperationDto> {

}
