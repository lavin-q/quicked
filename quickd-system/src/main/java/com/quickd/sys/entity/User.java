package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;

import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_user")
public class User extends BaseEntity {

    /**
     * 登录账号
     */
    private String username;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 密码
     */
    private String password;

    /**
     * md5密码盐
     */
    private String salt;

    /**
     * 电子邮件
     */
    private String email;

    /**
     * 电话
     */
    private String phone;

    /**
     * 部门code
     */
    private String orgCode;

    /**
     * 管理员类型（0非管理员 1系统管理员  2二级管理员）
     */
    private String mgrType;

    /**
     * 状态(1：正常  2：冻结 ）
     */
    private Integer status;

    /**
     * 头像路径
     */
    private String avatar;

    /**
     * 个性签名
     */
    private String sign;

    /**
     * 绑定的微信号
     */
    private String wxOpenid;

    /**
     * 绑定的手机串号
     */
    private String mobileImei;

    /**
     * 租户代码
     */
    private String corpCode;

    /**
     * 租户名称
     */
    private String corpName;

    /**
     * 最后登陆IP
     */
    private String lastLoginIp;

    /**
     * 最后登陆时间
     */
    private Date lastLoginDate;


    /**
     * 备注信息
     */
    private String remarks;



}
