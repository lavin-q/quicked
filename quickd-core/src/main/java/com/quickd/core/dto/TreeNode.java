package com.quickd.core.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
public class TreeNode<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ApiModelProperty(value = "ID")
    private String id;

    /**
     * 父节点
     */
    @ApiModelProperty(value = "父节点")
    private String pid;

    /**
     * 子节点
     */
    @ApiModelProperty(value = "子节点")
    List<T> children = new ArrayList<>();


}
