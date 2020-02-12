package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import com.quickd.core.entity.BaseEntity;
/**
 * <p>
 * 
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dict")
public class Dict extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 字典名称
     */
    private String dictName;

    /**
     * 字典编码
     */
    private String dictCode;

    /**
     * 描述
     */
    private String description;

    /**
     * 字典类型0为string,1为number
     */
    private Integer type;



}
