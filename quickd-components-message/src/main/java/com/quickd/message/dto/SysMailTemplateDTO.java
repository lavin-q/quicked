

package com.quickd.message.dto;

import com.quickd.core.dto.BaseDto;
import com.quickd.core.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;


/**
 * 邮件模板
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@ApiModel(value = "邮件模板")
public class SysMailTemplateDTO extends BaseDto {



    @ApiModelProperty(value = "模板名称")
    @NotBlank(message="{mail.name.require}", groups = DefaultGroup.class)
    private String name;

    @ApiModelProperty(value = "邮件主题")
    @NotBlank(message="{mail.subject.require}", groups = DefaultGroup.class)
    private String subject;

    @ApiModelProperty(value = "邮件正文")
    @NotBlank(message="{mail.content.require}", groups = DefaultGroup.class)
    private String content;



}