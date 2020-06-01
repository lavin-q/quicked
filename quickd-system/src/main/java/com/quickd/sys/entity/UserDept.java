package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 用户部门表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Setter
@Getter
@Accessors(chain = true)
@TableName("sys_user_dept")
public class UserDept implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId
    private String id;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 部门id
     */
    private String depId;


}
