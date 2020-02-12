package com.quickd.sys.dto;

import java.io.Serializable;

import com.quickd.core.dto.TreeNode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 部门表 封装树结构的部门的名称的实体类
 * <p>
 * 
 * @Author Steve
 * @Since 2019-01-22 
 *
 */
@Data
@EqualsAndHashCode(callSuper=true)
@ApiModel(value = "部门树结构", description="部门树结构")
public class DeptTreeDto extends TreeNode<DeptTreeDto> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ApiModelProperty(value = "ID")
    private String id;


    /**
     * 英文名
     */
    @ApiModelProperty(value = "英文名")
    private String deptNameEn;

    /**
     * 机构/部门名称
     */
    @ApiModelProperty(value = "机构/部门名称")
    private String deptName;

    /**
     * 机构类型 1一级部门 2子部门
     */
    @ApiModelProperty(value = "机构类型 1一级部门 2子部门")
    private String orgType;

    /**
     * 机构编码
     */
    @ApiModelProperty(value = "机构编码")
    private String orgCode;

    /**
     * 状态（1启用，0不启用）
     */
    @ApiModelProperty(value = "状态（1启用，0不启用）")
    private String status;


}
