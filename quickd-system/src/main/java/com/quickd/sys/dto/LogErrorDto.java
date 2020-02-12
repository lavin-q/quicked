package com.quickd.sys.dto;
import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * <p>
 * 异常日志
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "异常日志", description="异常日志")
public class LogErrorDto extends BaseDto {

    @ApiModelProperty(value = "请求URI")
    private String requestUri;

    @ApiModelProperty(value = "请求方式")
    private String requestMethod;

    @ApiModelProperty(value = "请求参数")
    private String requestParams;

    @ApiModelProperty(value = "用户代理")
    private String userAgent;

    @ApiModelProperty(value = "操作IP")
    private String ip;

    @ApiModelProperty(value = "异常信息")
    private String errorInfo;

    @ApiModelProperty(value = "创建者")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;


}
