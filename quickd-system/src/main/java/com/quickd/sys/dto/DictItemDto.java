package com.quickd.sys.dto;

import com.quickd.core.dto.BaseDto;
import com.quickd.core.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 * <p>
 * 
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "数据字典项", description="数据字典项")
public class DictItemDto  extends BaseDto {

    /**
     * 字典id
     */
    @ApiModelProperty(value = "字典id",required = true)
    @NotNull(message="字典id不能为空", groups = DefaultGroup.class)
    private String dictId;

    /**
     * 字典项文本
     */
    @ApiModelProperty(value = "字典项文本",required = true)
    @NotNull(message="字典项文本不能为空", groups = DefaultGroup.class)
    private String itemText;

    /**
     * 字典项值
     */
    @ApiModelProperty(value = "字典项值",required = true)
    @NotNull(message="字典项值不能为空", groups = DefaultGroup.class)
    private String itemValue;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String description;

    /**
     * 排序
     */
    @ApiModelProperty(value = "排序")
    private Integer sortOrder;

    /**
     * 状态（1启用 0不启用）
     */
    @ApiModelProperty(value = "状态（1启用 0不启用）")
    private Integer status;


}
