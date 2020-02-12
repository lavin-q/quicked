package com.quickd.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @project: quickd-backend
 * @description: RateLimitAno
 * @author: quickd
 * @create: 2019-09-27 16:39
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RateLimitAno {

    // 资源名称，用于描述接口功能
    String name() default "";

    // 资源 key
    String key() default "";

    // key prefix
    String prefix() default "";

    // 时间的，单位秒
    int period();

    // 限制访问次数
    int count();

    // 限制类型
    LimitType limitType() default LimitType.CUSTOMER;
}
