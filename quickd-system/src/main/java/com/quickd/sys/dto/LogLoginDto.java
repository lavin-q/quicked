package com.quickd.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import com.quickd.core.dto.BaseDto;
/**
 * <p>
 * 登录日志
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "登录日志", description="登录日志")
public class LogLoginDto  extends BaseDto {

    @ApiModelProperty(value = "用户操作  0：用户登录   1：用户退出")
    private Integer operation;

    @ApiModelProperty(value = "状态  0：失败    1：成功    2：账号已锁定")
    private Integer status;

    @ApiModelProperty(value = "用户代理")
    private String userAgent;

    @ApiModelProperty(value = "操作IP")
    private String ip;

    @ApiModelProperty(value = "用户名")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;


}
