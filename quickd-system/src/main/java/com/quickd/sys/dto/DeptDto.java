package com.quickd.sys.dto;

import com.quickd.core.dto.BaseDto;
import com.quickd.core.validator.group.DefaultGroup;
import com.quickd.core.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 组织机构表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "组织机构", description="组织机构")
public class DeptDto extends BaseDto {

    /**
     * 父机构ID
     */
    @ApiModelProperty(value = "父机构ID")
    private String pid;

    /**
     * 机构/部门名称
     */
    @ApiModelProperty(value = "机构/部门名称")
    @NotBlank(message="机构/部门名称不能为空", groups = DefaultGroup.class)
    private String deptName;

    /**
     * 英文名
     */
    @ApiModelProperty(value = "英文名")
    private String deptNameEn;

    /**
     * 缩写
     */
    @ApiModelProperty(value = "缩写")
    private String deptNameAbbr;

    /**
     * 排序
     */
    @ApiModelProperty(value = "排序")
    private Integer deptOrder;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String description;

    /**
     * 机构类型 1一级部门 2子部门
     */
    @ApiModelProperty(value = "机构类型 1一级部门 2子部门")
    private String orgType;

    /**
     * 机构编码
     */
    @ApiModelProperty(value = "机构编码")
    @NotBlank(message="机构编码不能为空", groups = UpdateGroup.class)
    private String orgCode;

    /**
     * 手机号
     */
    @ApiModelProperty(value = "手机号")
    private String mobile;

    /**
     * 传真
     */
    @ApiModelProperty(value = "传真")
    private String fax;

    /**
     * 地址
     */
    @ApiModelProperty(value = "地址")
    private String address;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注")
    private String memo;

    /**
     * 状态（1启用，0不启用）
     */
    @ApiModelProperty(value = "状态（1启用，0不启用）")
    private String status;



}
