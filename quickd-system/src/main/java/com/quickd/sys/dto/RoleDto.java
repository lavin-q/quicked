package com.quickd.sys.dto;

import com.quickd.core.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "角色表", description="角色表")
public class RoleDto extends BaseDto {
    /**
     * 角色名称
     */
    @ApiModelProperty(value = "角色名称")
    private String roleName;

    /**
     * 角色编码
     */
    @ApiModelProperty(value = "角色编码")
    private String roleCode;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String remarks;



}
