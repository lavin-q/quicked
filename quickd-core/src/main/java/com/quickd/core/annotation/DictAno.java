package com.quickd.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @project: jeedcp
 * @description: 字典注解
 * @author: caochaofeng
 * @create: 2019-08-16 19:12
 */
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface DictAno {
    /**
     * 方法描述:  数据code
     * 作    者： dangzhenghui
     * 日    期： 2019年03月17日-下午9:37:16
     *
     * @return 返回类型： String
     */
    String dicCode();

    /**
     * 方法描述:  数据Text
     * 作    者： dangzhenghui
     * 日    期： 2019年03月17日-下午9:37:16
     *
     * @return 返回类型： String
     */
    String dicText() default "";

    /**
     * 方法描述: 数据字典表
     * 作    者： dangzhenghui
     * 日    期： 2019年03月17日-下午9:37:16
     *
     * @return 返回类型： String
     */
    String dictTable() default "";
}
