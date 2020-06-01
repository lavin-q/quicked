package com.quickd.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 组织机构表
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Setter
@Getter
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_dept")
public class Dept extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 父机构ID
     */
    private String pid;

    /**
     * 机构/部门名称
     */
    private String deptName;

    /**
     * 英文名
     */
    private String deptNameEn;

    /**
     * 缩写
     */
    private String deptNameAbbr;

    /**
     * 排序
     */
    private Integer deptOrder;

    /**
     * 描述
     */
    private String description;

    /**
     * 机构类型 1一级部门 2子部门
     */
    private String orgType;

    /**
     * 机构编码
     */
    private String orgCode;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 传真
     */
    private String fax;

    /**
     * 地址
     */
    private String address;

    /**
     * 备注
     */
    private String memo;

    /**
     * 状态（1启用，0不启用）
     */
    private String status;



}
