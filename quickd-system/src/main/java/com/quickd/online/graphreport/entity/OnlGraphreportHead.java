package com.jeedcp.online.graphreport.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.quickd.core.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@TableName("onl_graphreport_head")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class OnlGraphreportHead extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;
    /** 图表名称 */
    private String name;
    /** 图表编码 */
    private String code;
    /** 查询数据SQL */
    private String cgrSql;
    /** x轴数据字段 */
    private String xaxisField;
    /** y轴数据字段 */
    private String yaxisField;
    /** y轴文字描述 */
    private String yaxisText;
    /** 描述 */
    private String content;
    /** 扩展JS */
    private String extendJs;
    /** 图表类型 */
    private String graphType;
//    /** isCombination */
//    private String isCombination;
    /** 展示模板 */
    private String displayTemplate;
    /** 数据类型 */
    private String dataType;
}
