package com.quickd.sys.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 菜单权限表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "菜单权限表")
public class MenuDto extends BaseDto {
    /**
     * 父id
     */
    @ApiModelProperty(value = "父id")
    private String pid;

    /**
     * 菜单标题
     */
    @ApiModelProperty(value = "菜单标题")
    private String name;

    /**
     * 路径
     */
    @ApiModelProperty(value = "路径")
    private String url;

    /**
     * 组件
     */
    @ApiModelProperty(value = "组件")
    private String component;

    /**
     * 组件名字
     */
    @ApiModelProperty(value = "组件名字")
    private String componentName;

    /**
     * 一级菜单跳转地址
     */
    @ApiModelProperty(value = "一级菜单跳转地址")
    private String redirect;

    /**
     * 菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)
     */
    @ApiModelProperty(value = "菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)")
    private Integer type;

    /**
     * 菜单权限编码
     */
    @ApiModelProperty(value = "菜单权限编码")
    private String permissions;

    /**
     * 权限策略1显示2禁用
     */
    @ApiModelProperty(value = "权限策略1显示2禁用")
    private String permsType;

    /**
     * 菜单排序
     */
    @ApiModelProperty(value = "菜单排序")
    private Integer sort;

    /**
     * 聚合子路由: 1是0否
     */
    @ApiModelProperty(value = "聚合子路由: 1是0否")
    private Boolean alwaysShow;

    /**
     * 菜单图标
     */
    @ApiModelProperty(value = "菜单图标")
    private String icon;

    /**
     * 是否路由菜单: 0:不是  1:是（默认值1）
     */
    @ApiModelProperty(value = "是否路由菜单: 0:不是  1:是（默认值1）")
    private Boolean isRoute;

    /**
     * 是否叶子节点:    1:是   0:不是
     */
    @ApiModelProperty(value = "是否叶子节点:    1:是   0:不是")
    private Boolean isLeaf;

    @ApiModelProperty(value = "是否uniapp菜单:    1:是   0:不是")
    private Boolean isUniapp;

    /**
     * 是否缓存该页面:    1:是   0:不是
     */
    @ApiModelProperty(value = "是否缓存该页面:    1:是   0:不是")
    private Boolean keepAlive;

    /**
     * 是否隐藏路由: 0否,1是
     */
    @ApiModelProperty(value = "是否隐藏路由: 0否,1是")
    private Integer hidden;

    /**
     * 描述
     */
    @ApiModelProperty(value = "id")
    private String remarks;


    /**
     * 是否添加数据权限1是0否
     */
    @ApiModelProperty(value = "是否添加数据权限1是0否")
    private Integer ruleFlag;

    /**
     * 按钮权限状态(0无效1有效)
     */
    @ApiModelProperty(value = "按钮权限状态(0无效1有效)")
    private String status;



}
