/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package com.quickd.sys.aspect;

import com.alibaba.fastjson.JSON;

import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.Const;
import com.quickd.sys.service.ILogOperationService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 操作日志，切面处理类
 *
 * @author Mark sunlightcs@gmail.com
 */
@Aspect
@Component
public class LogOperationAspect {
    @Autowired
    private ILogOperationService logOperationService;

    @Pointcut("@annotation( com.quickd.core.annotation.LogOperationAno)")
    public void logPointCut() {

    }
    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        try {
            //执行方法
            Object result = point.proceed();
            //执行时长(毫秒)
            long time = System.currentTimeMillis() - beginTime;
            //保存日志
            saveLog(point, time, Const.OPERATION_SUCCESS);
            return result;
        } catch (Exception e) {
            //执行时长(毫秒)
            long time = System.currentTimeMillis() - beginTime;
            //保存日志
            saveLog(point, time, Const.OPERATION_FAIL);
            throw e;
        }
    }

    private void saveLog(ProceedingJoinPoint joinPoint, long time, Integer status) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        LogOperationAno annotation = method.getAnnotation(LogOperationAno.class);
        //请求参数
        Object[] args = joinPoint.getArgs();
        String params = JSON.toJSONString(args[0]);
        //保存到DB
        logOperationService.addLog(annotation.value(), params, time);


    }
}