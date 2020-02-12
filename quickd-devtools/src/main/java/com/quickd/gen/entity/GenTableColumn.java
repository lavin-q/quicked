package com.quickd.gen.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 业务表字段
 * </p>
 *
 * @author quickd
 * @since 2019-08-27
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("gen_table_column")
public class GenTableColumn extends BaseEntity {

    /**
     * 归属表
     */
    private String tableName;
    /**
     * 表注释
     */
    @TableField(exist = false)
    private String tableComment;
    /**
     * 名称
     */
    private String colName;
    /**
     * 列的数据类型
     */
    private String colType;


    /**
     * 描述备注
     */
    private String fieldLabel;

    /**
     * JAVA类型
     */
    private String attrType;

    /**
     * JAVA字段名
     */
    private String attr;
    /**
     * 是否主键
     */
    private Boolean primaryKey;

    /**
     * 是否唯一（1：是；0：否）
     */
    private Boolean isUnique;

    /**
     * 是否可为空（1：是；0：否）
     */
    private Boolean isNotNull;

    /**
     * 是否为插入字段
     */
    private Boolean isInsert;

    /**
     * 是否编辑字段
     */
    private Boolean isEdit;

    /**
     * 是否列表字段
     */
    private Boolean isList;

    /**
     * 是否查询字段
     */
    private Boolean isQuery;

    /**
     * 查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）
     */
    private String queryType;

    /**
     * 字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）
     */
    private String formType;

    /**
     * 字典类型
     */
    private String dictType;

    /**
     * 其它设置（扩展字段JSON）
     */
    private String settings;

    /**
     * 排序（升序）
     */
    private int sort;

    /**
     * 描述
     */
    private String description;


    //属性名称(第一个字母大写)，如：user_name => UserName
    private String attrName;

    private String refTable;

    private String refColumn;

    @TableField(exist = false)
    private String refPathName;
    @TableField(exist = false)
    private String refClassName;
    @TableField(exist = false)
    private String lowRefClassName;

}
