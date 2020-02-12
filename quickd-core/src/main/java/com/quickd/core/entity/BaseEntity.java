/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.quickd.core.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;


/**
 * @project: jeedcp
 * @description: 基础实体类，所有实体都需要继承
 * @author: caochaofeng
 * @create: 2019-08-15 09:01
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public abstract class BaseEntity implements Serializable {
    /**
     * id
     */
    @TableId
    private String id;
    /**
     * 制表人
     */
    @TableField(value="create_by",fill = FieldFill.INSERT)
    private String createBy;
    /**
     * 制表时间
     */
    @TableField(value="create_time",fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
     * 更新人
     */
    @TableField(value="update_by",fill = FieldFill.INSERT_UPDATE)
    private String updateBy;
    /**
     * 更新时间
     */
    @TableField(value="update_time",fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
    /**
     * 是否删除
     */
    @TableField(value = "del_flag", fill = FieldFill.INSERT)
    @TableLogic
    private String delFlag;

    @Version
    @TableField(value="version",fill = FieldFill.INSERT)
    private Integer version;
}