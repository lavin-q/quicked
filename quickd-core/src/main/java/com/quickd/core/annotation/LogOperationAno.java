package com.quickd.core.annotation;

import java.lang.annotation.*;

/**
 * @project: jeedcp
 * @description: 操作日志注解
 * @author: caochaofeng
 * @create: 2019-08-16 19:13
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogOperationAno {


    /**
     * 日志内容
     *
     * @return
     */
    String value() default "";


}
