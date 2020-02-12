package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 用户角色表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Data
@Accessors(chain = true)
@TableName("sys_user_role")
public class UserRole implements Serializable {

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
     * 角色id
     */
    private String roleId;


}
