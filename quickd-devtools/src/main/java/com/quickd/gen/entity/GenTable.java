package com.quickd.gen.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 业务表
 * </p>
 *
 * @author quickd
 * @since 2019-08-27
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("gen_table")
public class GenTable extends BaseEntity {
    public static final String F_NAME = "name";
    public static final String F_ID = "id";
    /**
     * 名称
     */
    private String tableName;

    /**
     * 描述
     */
    private String comments;

    /**
     * 实体类名称
     */
    private String className;

    /**
     * 关联父表
     */
    private String parentTable;

    /**
     * 关联父表外键
     */
    private String parentTableFk;

    /**
     * 描述
     */
    private String description;

    //类名(第一个字母小写)，如：sys_user => sysUser
    @TableField(exist = false)
    private String lowClassName;
}
