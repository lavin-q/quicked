

package com.quickd.core.config;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 短信配置信息
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@ApiModel(value = "短信配置信息")
public class SmsConfig implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "阿里云AccessKeyId")
    @NotBlank(message="{aliyun.accesskeyid.require}")
    private String aliyunAccessKeyId;

    @ApiModelProperty(value = "阿里云AccessKeySecret")
    @NotBlank(message="{aliyun.accesskeysecret.require}")
    private String aliyunAccessKeySecret;

    @ApiModelProperty(value = "阿里云短信签名")
    @NotBlank(message="{aliyun.signname.require}")
    private String aliyunSignName;

    @ApiModelProperty(value = "阿里云短信模板")
    @NotBlank(message="{aliyun.templatecode.require}")
    private String aliyunTemplateCode;


}