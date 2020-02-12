package com.quickd.core.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @project: jeedcp
 * @description: 模型转换工具类
 * @author: caochaofeng
 * @create: 2019-08-16 13:45
 */
@Slf4j
public class ConvertUtils {

    /**
     * @param source
     * @param target
     * @param <T>
     * @return
     */
    public static <T> T sourceToTarget(Object source, Class<T> target){
        if(source == null){
            return null;
        }
        T targetObject = null;
        try {
            targetObject = target.newInstance();
            BeanUtils.copyProperties(source, targetObject);
        } catch (Exception e) {
            log.error("convert error ", e);
        }

        return targetObject;
    }

    /**
     * @param sourceList
     * @param target
     * @param <T>
     * @return
     */
    public static <T> List<T> sourceToTarget(Collection<?> sourceList, Class<T> target){
        if(sourceList == null){
            return null;
        }

        List targetList = new ArrayList<>(sourceList.size());
        try {
            for(Object source : sourceList){
                T targetObject = target.newInstance();
                BeanUtils.copyProperties(source, targetObject);
                targetList.add(targetObject);
            }
        }catch (Exception e){
            log.error("convert error ", e);
        }

        return targetList;
    }
}
