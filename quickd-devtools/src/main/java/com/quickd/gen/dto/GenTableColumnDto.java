package com.quickd.gen.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.dto.BaseDto;
import com.quickd.core.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

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
@ApiModel(value = "业务表列信息", description="业务表列信息")
public class GenTableColumnDto extends BaseDto {


    @ApiModelProperty(value = "归属表")
    private String tableName;

    /**
     * 列名
     */
    @ApiModelProperty(value = "列名")
    private String colName;

    /**
     * 列名备注
     */
    @ApiModelProperty(value = "列名备注")
    private String fieldLabel;

    /**
     * 列的数据类型的字节长度
     */
    @ApiModelProperty(value = "列的数据类型")
    private String colType;

    @ApiModelProperty(value = "列的数据类型的字节长度")
    private String colLength;

    /**
     * JAVA类型
     */
    @ApiModelProperty(value = "JAVA类型")
    private String attrType;

    /**
     * JAVA字段名
     */
    @ApiModelProperty(value = "JAVA字段名")
    private String attr;

    /**
     * 是否主键
     */
    @ApiModelProperty(value = "是否主键")
    private Boolean primaryKey;

    /**
     * 是否唯一（1：是；0：否）
     */
    @ApiModelProperty(value = "是否唯一（1：是；0：否）")
    private Boolean isUnique;

    /**
     * 是否可为空
     */
    @ApiModelProperty(value = "是否可为空")
    private Boolean isNotNull;

    /**
     * 是否为插入字段
     */
    @ApiModelProperty(value = "是否为插入字段")
    private Boolean isInsert;

    /**
     * 是否编辑字段
     */
    @ApiModelProperty(value = "是否编辑字段")
    private Boolean isEdit;

    /**
     * 是否列表字段
     */
    @ApiModelProperty(value = "是否列表字段")
    private Boolean isList;

    /**
     * 是否查询字段
     */
    @ApiModelProperty(value = "是否查询字段")
    private Boolean isQuery;

    /**
     * 字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）
     */
    @ApiModelProperty(value = "字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）")
    private String formType;
    /**
     * 查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）
     */
    @ApiModelProperty(value = "查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）")
    private String queryType;

    /**
     * 字典类型
     */
    @ApiModelProperty(value = "字典类型")
    private String dictType;

    /**
     * 其它设置（扩展字段JSON）
     */
    @ApiModelProperty(value = "其它设置（扩展字段JSON）")
    private String settings;

    /**
     * 排序（升序）
     */
    @ApiModelProperty(value = "排序（升序）")
    private int sort;

    /**
     * 描述
     */
    @ApiModelProperty(value = "描述")
    private String description;


    //属性名称(第一个字母大写)，如：user_name => UserName
    @TableField(exist = false)
    @ApiModelProperty(value = "属性名称(第一个字母大写)，如：user_name => UserName")
    private String attrName;


}
