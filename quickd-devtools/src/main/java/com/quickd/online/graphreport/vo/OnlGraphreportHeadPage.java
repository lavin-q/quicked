package com.quickd.online.graphreport.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.quickd.online.graphreport.entity.OnlGraphreportItem;
import lombok.Data;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Data
public class OnlGraphreportHeadPage implements Serializable {

	private static final long serialVersionUID = 1L;
	/** id */
	private String id;
	/** 图表名称 */
	@Excel(name = "图表名称", width = 15)
	private String name;
	/** 图表编码 */
	@Excel(name = "图表编码", width = 15)
	private String code;
	/** 查询数据SQL */
	@Excel(name = "查询数据SQL", width = 15)
	private String cgrSql;
	/** x轴数据字段 */
	@Excel(name = "x轴数据字段", width = 15)
	private String xaxisField;
	/** y轴数据字段 */
	@Excel(name = "y轴数据字段", width = 15)
	private String[] yaxisField;
	/** y轴文字描述 */
	@Excel(name = "y轴文字描述", width = 15)
	private String yaxisText;
	/** 描述 */
	@Excel(name = "描述", width = 15)
	private String content;
	/** 扩展JS */
	@Excel(name = "扩展JS", width = 15)
	private String extendJs;
	/** 图表类型 */
	@Excel(name = "图表类型", width = 15)
	private String[] graphType;
	/** 是否组合 */
	@Excel(name = "是否组合", width = 15)
	private String isCombination;
	/** 展示模板 */
	@Excel(name = "展示模板", width = 15)
	private String displayTemplate;
	/** 数据类型 */
	@Excel(name = "数据类型", width = 15)
	private String dataType;
	/** createTime */
	@Excel(name = "createTime", width = 20, format = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	/** createBy */
	@Excel(name = "createBy", width = 15)
	private String createBy;
	/** updateTime */
	@Excel(name = "updateTime", width = 20, format = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date updateTime;
	/** updateBy */
	@Excel(name = "updateBy", width = 15)
	private String updateBy;

	@ExcelCollection(name = "图表报告项")
	private List<OnlGraphreportItem> onlGraphreportItemList;
}
