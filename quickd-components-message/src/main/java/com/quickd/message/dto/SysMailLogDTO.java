

package com.quickd.message.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * 邮件发送记录
 *
 */
@Data
@ApiModel(value = "邮件发送记录")
public class SysMailLogDTO extends BaseDto {

    @ApiModelProperty(value = "邮件模板ID")
    private String templateId;

    @ApiModelProperty(value = "发送者")
    private String mailFrom;

    @ApiModelProperty(value = "收件人")
    private String mailTo;

    @ApiModelProperty(value = "抄送者")
    private String mailCc;

    @ApiModelProperty(value = "邮件主题")
    private String subject;

    @ApiModelProperty(value = "邮件正文")
    private String content;

    @ApiModelProperty(value = "发送状态  0：失败  1：成功")
    private Integer status;


}
