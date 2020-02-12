package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * <p>
 * 异常日志
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@Accessors(chain = true)
@TableName("sys_log_error")
public class LogError  {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId
    private String id;

    /**
     * 请求URI
     */
    private String requestUri;

    /**
     * 请求方式
     */
    private String requestMethod;

    /**
     * 请求参数
     */
    private String requestParams;

    /**
     * 用户代理
     */
    private String userAgent;

    /**
     * 操作IP
     */
    private String ip;

    /**
     * 异常信息
     */
    private String errorInfo;

    /**
     * 制表人
     */
    @TableField(value="create_by",fill = FieldFill.INSERT)
    private String createBy;
    /**
     * 制表时间
     */
    @TableField(value="create_time",fill = FieldFill.INSERT)
    private Date createTime;


}
