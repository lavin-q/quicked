package com.quickd.online.graphreport.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class OnlGraphreportItemDto extends BaseDto {
    /** 主表ID */
    @ApiModelProperty(value = "主表ID")
    private String graphreportHeadId;
    /** 字段名 */
    @ApiModelProperty(value = "字段名")
    private String fieldName;
    /** 字段文本 */
    @ApiModelProperty(value = "字段文本")
    private String fieldTxt;
    /** 是否列表显示 */
    @ApiModelProperty(value = "是否列表显示")
    private String isShow;
    /** 是否查询 */
    @ApiModelProperty(value = "是否查询")
    private String searchFlag;
    /** 是否计算 */
    @ApiModelProperty(value = "是否计算")
    private String isTotal;
    /** 查询模式 */
    @ApiModelProperty(value = "查询模式")
    private String searchMode;
    /** 字典Code */
    @ApiModelProperty(value = "字典Code")
    private String dictCode;
    /** 字段href */
    @ApiModelProperty(value = "字段href")
    private String fieldHref;
    /** 字段类型 */
    @ApiModelProperty(value = "字段类型")
    private String fieldType;
    /** 排序 */
    @ApiModelProperty(value = "排序")
    private Integer orderNum;
    /** 取值表达式 */
    @ApiModelProperty(value = "取值表达式")
    private String replaceVal;
}
