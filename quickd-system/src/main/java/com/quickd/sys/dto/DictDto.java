package com.quickd.sys.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
@ApiModel(value = "数据字典", description="数据字典")
public class DictDto extends BaseDto {


    /**
     * 字典名称
     */
    @ApiModelProperty(value = "字典名称")
    private String dictName;

    /**
     * 字典编码
     */
    @ApiModelProperty(value = "字典编码")
    private String dictCode;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String description;

    /**
     * 字典类型0为string,1为number
     */
    @ApiModelProperty(value = "字典类型")
    private Integer type;


}
