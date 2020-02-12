package com.quickd.gen.dto;

import com.quickd.core.validator.group.DefaultGroup;
import com.quickd.core.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;


/**
 * @project: quickd
 * @description: DoGenerate
 * @author: quickd
 * @create: 2019-09-16 14:16
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "生成方案", description = "生成方案")
public class DoGenerate {
    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "表名")
    @NotNull(message="表名不能为空", groups = DefaultGroup.class)
    private String tableName;
    @ApiModelProperty(value = "生成模块")
    @NotNull(message="生成模块不能为空", groups = DefaultGroup.class)
    private String templateName;
    @ApiModelProperty(value = "父菜单id")
    @NotNull(message="父菜单id不能为空", groups = DefaultGroup.class)
    private String pid;
    @ApiModelProperty(value = "菜单名称")
    @NotNull(message="菜单名称不能为空", groups = DefaultGroup.class)
    private String name;
    //    private String menuName;
    @ApiModelProperty(value = "菜单图标")
    private String icon;
    @ApiModelProperty(value = "生成路径")
    @NotNull(message="生成路径不能为空", groups = DefaultGroup.class)
    private String genPath;
}
