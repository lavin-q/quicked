package com.quickd.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import com.quickd.core.dto.BaseDto;

/**
 * <p>
 * 操作日志
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "操作日志", description="操作日志")
public class LogOperationDto extends BaseDto {

     @ApiModelProperty(value = "用户操作")
     private String operation;

     @ApiModelProperty(value = "请求URI")
     private String requestUri;

     @ApiModelProperty(value = "请求方式")
     private String requestMethod;

     @ApiModelProperty(value = "请求参数")
     private String requestParams;

     @ApiModelProperty(value = "请求时长(毫秒)")
     private Integer requestTime;

     @ApiModelProperty(value = "用户代理")
     private String userAgent;

     @ApiModelProperty(value = "操作IP")
     private String ip;

     @ApiModelProperty(value = "状态  0：失败   1：成功")
     private Integer status;


    @ApiModelProperty(value = "用户名")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;


}
