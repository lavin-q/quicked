package com.quickd.sys.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 菜单权限表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Data
@ApiModel(value = "Uniapp菜单")
public class UniappMenuDto  implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 菜单标题
     */
    @ApiModelProperty(value = "菜单标题")
    private String title;

    /**
     * 路径
     */
    @ApiModelProperty(value = "路径")
    private String name;


    /**
     * 菜单背景色
     */
    @ApiModelProperty(value = "菜单背景色")
    private String color;

    /**
     * 菜单图标
     */
    @ApiModelProperty(value = "菜单图标")
    private String cuIcon;




}
