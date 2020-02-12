package com.quickd.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @project: quickd
 * @description: NoRepeatSubmit 防止重复提交
 * @author: caochaofeng
 * @create: 2019-10-08 21:58
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface NoRepeatSubmit {
    /**
     * 设置请求锁定时间秒
     */
    int lockTime() default 10;
}
