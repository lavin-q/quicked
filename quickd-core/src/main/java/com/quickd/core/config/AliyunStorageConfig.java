package com.quickd.core.config;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.NotBlank;

@Data
@ApiModel(value = "阿里云存储配置信息")
public class AliyunStorageConfig {
    @ApiModelProperty(value = "阿里云绑定的域名")
    @NotBlank(message="{aliyun.domain.require}")
    @URL(message = "{aliyun.domain.url}")
    private String aliyunDomain;

    @ApiModelProperty(value = "阿里云路径前缀")
    private String aliyunPrefix;

    @ApiModelProperty(value = "阿里云EndPoint")
    @NotBlank(message="{aliyun.endPoint.require}")
    private String aliyunEndPoint;

    @ApiModelProperty(value = "阿里云AccessKeyId")
    @NotBlank(message="{aliyun.accesskeyid.require}")
    private String aliyunAccessKeyId;

    @ApiModelProperty(value = "阿里云AccessKeySecret")
    @NotBlank(message="{aliyun.accesskeysecret.require}")
    private String aliyunAccessKeySecret;

    @ApiModelProperty(value = "阿里云BucketName")
    @NotBlank(message="{aliyun.bucketname.require}")
    private String aliyunBucketName;

}
