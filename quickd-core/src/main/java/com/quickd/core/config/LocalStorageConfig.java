package com.quickd.core.config;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.URL;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.validation.constraints.NotBlank;

@Setter
@Getter
@ApiModel(value = "本地存储配置信息")
public class LocalStorageConfig implements WebMvcConfigurer {
    @ApiModelProperty(value = "本地上传绑定的域名")
    @NotBlank(message="{local.domain.require}")
    @URL(message = "{local.domain.url}")
    private String localDomain;

    @ApiModelProperty(value = "本地上传路径前缀")
    private String localPrefix;

    @ApiModelProperty(value = "本地上传存储目录")
    @NotBlank(message="{local.path.url}")
    private String localPath;
}
