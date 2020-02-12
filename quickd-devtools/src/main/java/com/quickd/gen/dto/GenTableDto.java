package com.quickd.gen.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

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
@ApiModel(value = "业务表", description="业务表")
public class GenTableDto extends BaseDto {

    /**
     * 制表人
     */
    @ApiModelProperty(value = "制表人")
    private String createBy;
    /**
     * 名称
     */
    @ApiModelProperty(value = "名称")
    private String name;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String comments;

    /**
     * 实体类名称
     */
    @ApiModelProperty(value = "实体类名称")
    private String className;

    /**
     * 关联父表
     */
    @ApiModelProperty(value = "关联父表")
    private String parentTable;

    /**
     * 关联父表外键
     */
    @ApiModelProperty(value = "关联父表外键")
    private String parentTableFk;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String description;
}