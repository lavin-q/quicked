package com.quickd.gen.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 项目生成表
 * </p>
 *
 * @author quickd
 * @since 2019-08-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("gen_project")
public class GenProject extends BaseEntity {

    private static final long serialVersionUID = 1L;


    /**
     * 项目名称
     */
    private String project;

    /**
     * 项目分组
     */
    private String groupName;

    /**
     * 系统名称
     */
    private String sysName;

    /**
     * 项目版权
     */
    private String copyright;

    /**
     * 项目作者
     */
    private String author;

    /**
     * 数据库地址
     */
    private String dbUrl;

    /**
     * 数据库端口
     */
    private String dbPort;

    /**
     * 数据库名
     */
    private String dbName;

    /**
     * 数据库用户名
     */
    private String dbUsername;

    /**
     * 数据库密码
     */
    private String dbPassword;


}
