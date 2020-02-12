package com.jeedcp.online.graphreport.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@TableName("onl_graphreport_item")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class OnlGraphreportItem extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;
    /** 主表ID */
    private String graphreportHeadId;
    /** 字段名 */
    private String fieldName;
    /** 字段文本 */
    private String fieldTxt;
    /** 是否列表显示 */
    private String isShow;
    /** 是否查询 */
    private String searchFlag;
    /** 是否计算 */
    private String isTotal;
    /** 查询模式 */
    private String searchMode;
    /** 字典Code */
    private String dictCode;
    /** 字段href */
    private String fieldHref;
    /** 字段类型 */
    private String fieldType;
    /** 排序 */
    private Integer orderNum;
    /** 取值表达式 */
    private String replaceVal;

}
