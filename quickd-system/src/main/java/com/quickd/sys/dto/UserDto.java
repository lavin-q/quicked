package com.quickd.sys.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.quickd.core.annotation.DictAno;
import com.quickd.core.dto.BaseDto;
import com.quickd.core.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "用户表")
public class UserDto extends BaseDto {
    /**
     * 登录账号
     */
    @ApiModelProperty(value = "登录账号", required = true)
    @NotBlank(message="登录账号不能为空", groups = DefaultGroup.class)
    @NotBlank(message="登录账号不能为空")
    @Excel(name = "登录账号", width = 15)
    private String username;

    /**
     * 真实姓名
     */
    @ApiModelProperty(value = "真实姓名" , required = true)
    @NotBlank(message="真实姓名不能为空", groups = DefaultGroup.class)
    @Excel(name = "真实姓名", width = 15)
    private String realName;

    /**
     * 密码
     */
    @ApiModelProperty(value = "密码" , required = true)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    /**
     * md5密码盐
     */
    @ApiModelProperty(value = "md5密码盐")
    private String salt;

    /**
     * 电子邮件
     */
    @ApiModelProperty(value = "电子邮件")
    private String email;

    /**
     * 电话
     */
    @ApiModelProperty(value = "电话")
    private String phone;

    /**
     * 部门code
     */
    @ApiModelProperty(value = "部门code")
    @NotBlank(message="部门code不能为空", groups = DefaultGroup.class)
    private String orgCode;

    /**
     * 管理员类型（0非管理员 1系统管理员  2二级管理员）
     */
    @ApiModelProperty(value = "管理员类型（0非管理员 1系统管理员  2二级管理员）")
    @DictAno(dicCode = "user_type")
    @Excel(name = "管理员类型", replace = {"非管理员_0", "系统管理员_1", "二级管理员_2"})
    private String mgrType;

    /**
     * 状态(1：正常  2：冻结 ）
     */
    @ApiModelProperty(value = "状态(1：正常  2：冻结 ）")
    @Excel(name = "状态", replace = {"停用_0", "正常_1"})
    private Integer status;

    /**
     * 头像路径
     */
    @ApiModelProperty(value = "头像路径")
    private String avatar;

    /**
     * 个性签名
     */
    @ApiModelProperty(value = "个性签名")
    private String sign;

    /**
     * 绑定的微信号
     */
    @ApiModelProperty(value = "绑定的微信号")
    private String wxOpenid;

    /**
     * 绑定的手机串号
     */
    @ApiModelProperty(value = "绑定的手机串号")
    private String mobileImei;

    /**
     * 租户代码
     */
    @ApiModelProperty(value = "租户代码")
    private String corpCode;

    /**
     * 租户名称
     */
    @ApiModelProperty(value = "租户名称")
    private String corpName;

    /**
     * 最后登陆IP
     */
    @ApiModelProperty(value = "最后登陆IP")
    private String lastLoginIp;

    /**
     * 最后登陆时间
     */
    @ApiModelProperty(value = "最后登陆时间")
    private Date lastLoginDate;


    /**
     * 备注信息
     */
    @ApiModelProperty(value = "备注信息")
    private String remarks;

    @ApiModelProperty(value = "版本")
    private Integer version;

    @ApiModelProperty(value = "角色ID列表")
    private List<String> roleIdList;
    @ApiModelProperty(value = "创建日期")
    private Date createTime;

    @ApiModelProperty(value = "部门名")
    private String deptName;

    @ApiModelProperty(value = "部门id")
    private String deptId;
}
