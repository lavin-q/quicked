

package com.quickd.message.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * 短信
 */
@Data
@ApiModel(value = "短信")
public class SysSmsDTO extends BaseDto {


    @ApiModelProperty(value = "平台类型")
    private Integer platform;

    @ApiModelProperty(value = "手机号")
    private String mobile;

    @ApiModelProperty(value = "参数1")
    private String params1;

    @ApiModelProperty(value = "参数2")
    private String params2;

    @ApiModelProperty(value = "参数3")
    private String params3;

    @ApiModelProperty(value = "参数4")
    private String params4;

    @ApiModelProperty(value = "发送状态  0：失败   1：成功")
    private Integer status;

}
