/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.quickd.core.exception;


import com.quickd.core.common.JsonResult;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;



/**
 * 异常处理器
 *
 * @author Mark sunlightcs@gmail.com
 * @since 1.0.0
 */
@RestControllerAdvice
@Slf4j
public class BussinessExceptionHandler {

	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(BusinessException.class)
	public JsonResult handleBusinessException(BusinessException ex){
		JsonResult JsonResult = new JsonResult();
		JsonResult.error(ex.getCode(), ex.getMsg());

		return JsonResult;
	}

	@ExceptionHandler(Exception.class)
	public JsonResult handleException(Exception ex){
		log.error(ex.getMessage(), ex);

//		saveLog(ex);

		return new JsonResult().error();
	}

//	/**
//	 * 保存异常日志
//	 */
//	private void saveLog(Exception ex){
//		SysLogErrorEntity log = new SysLogErrorEntity();
//
//		//请求相关信息
//		HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
//		log.setIp(IpUtils.getIpAddr(request));
//		log.setUserAgent(request.getHeader(HttpHeaders.USER_AGENT));
//		log.setRequestUri(request.getRequestURI());
//		log.setRequestMethod(request.getMethod());
//		Map<String, String> params = HttpContextUtils.getParameterMap(request);
//		if(MapUtil.isNotEmpty(params)){
//			log.setRequestParams(JSON.toJSONString(params));
//		}
//
//		//异常信息
//		log.setErrorInfo(ExceptionUtils.getErrorStackTrace(ex));
//
//		//保存
//		sysLogErrorService.save(log);
//	}
}