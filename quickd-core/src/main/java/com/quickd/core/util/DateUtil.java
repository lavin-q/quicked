package com.quickd.core.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @project: jeedcp
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-15 15:47
 */
@Slf4j
public class DateUtil extends DateUtils {
    /** 时间格式(yyyy-MM-dd) */
    public final static String DATE_PATTERN = "yyyy-MM-dd";
    /** 时间格式(yyyy-MM-dd HH:mm:ss) */
    public final static String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * 日期格式化 日期格式为：yyyy-MM-dd
     * @param date  日期
     * @param pattern  格式，如：DateUtils.DATE_TIME_PATTERN
     * @return  返回yyyy-MM-dd格式日期
     */
    public static String format(Date date, String pattern) {
        if(date != null){
            SimpleDateFormat df = new SimpleDateFormat(pattern);
            return df.format(date);
        }
        return null;
    }
    /***
     * 当前的日期时间
     * @return format指定格式的日期时间
     */
    public static String now(String format){
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(cal.getTime());
    }
    /***
     * 转换字符串为日期date
     * @param datetime
     * @param fmt
     * @return
     */
    public static Date convert2FormatDate(String datetime, String fmt){
        if (StringUtils.isBlank(datetime)){
            return null;
        }
        SimpleDateFormat format =  new SimpleDateFormat(fmt);
        try {
            Date date = format.parse(datetime);
            return date;
        }
        catch (ParseException e) {
            log.warn("日期格式转换异常");
        }
        return null;
    }
    /**
     * 获取月份
     * @return
     */
    public static String getMonth(){
        return now(DATE_TIME_PATTERN);
    }

    /***
     * 获取今天的日期
     * @return yyyyMMdd
     */
    public static String today(){
        return now(DATE_TIME_PATTERN);
    }

    /**
     * 毫秒数转date
     * @param timeMillis
     * @return
     */
    public static Date timeMillis2Date(Long timeMillis){
        return new Date(timeMillis);
    }


}
