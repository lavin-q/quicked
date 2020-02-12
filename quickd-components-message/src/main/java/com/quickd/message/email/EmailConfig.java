

package com.quickd.message.email;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 邮件配置信息
 *
 * @author Mark sunlightcs@gmail.com
 */
@ApiModel(value = "邮件配置信息")
@Data
public class EmailConfig implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "SMTP")
    @NotBlank(message="{email.smtp.require}")
    private String smtp;

    @ApiModelProperty(value = "端口号")
    @NotNull(message="{email.port.require}")
    private Integer port;

    @ApiModelProperty(value = "邮箱账号")
    @NotBlank(message="{email.username.require}")
    private String username;

    @ApiModelProperty(value = "邮箱密码")
    @NotBlank(message="{email.password.require}")
    private String password;

}