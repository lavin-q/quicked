package com.quickd.online.graphreport.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class OnlGraphreportHeadDto extends BaseDto {

    /** 图表名称 */
    @ApiModelProperty(value = "图表名称")
    private String name;
    /** 图表编码 */
    @ApiModelProperty(value = "图表编码")
    private String code;
    /** 查询数据SQL */
    @ApiModelProperty(value = "查询数据SQL")
    private String cgrSql;
    /** x轴数据字段 */
    @ApiModelProperty(value = "x轴数据字段")
    private String xaxisField;
    /** y轴文字描述 */
    @ApiModelProperty(value = "y轴文字描述")
    private String yaxisText;
    /** 描述 */
    @ApiModelProperty(value = "描述")
    private String content;
    /** 扩展JS */
    @ApiModelProperty(value = "扩展JS")
    private String extendJs;
    /** 图表类型 */
    @ApiModelProperty(value = "图表类型")
    private String graphType;
    /** isCombination */
    @ApiModelProperty(value = "isCombination")
    private String isCombination;
    /** displayTemplate */
    @ApiModelProperty(value = "displayTemplate")
    private String displayTemplate;
    /** dataType */
    @ApiModelProperty(value = "dataType")
    private String dataType;
}
