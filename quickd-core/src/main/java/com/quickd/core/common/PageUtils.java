package com.quickd.core.common;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * 分页工具类
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月4日 下午12:59:00
 */
@ApiModel(value = "分页数据")
@Setter
@Getter
public class PageUtils<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	//总记录数
	@ApiModelProperty(value = "总记录数")
	private int totalCount;
	//每页记录数
	@ApiModelProperty(value = "每页记录数")
	private int pageSize;
	//总页数
	@ApiModelProperty(value = "总页数")
	private int totalPage;
	//当前页数
	@ApiModelProperty(value = "当前页数")
	private int currPage;
	//列表数据
	@ApiModelProperty(value = "列表数据")
	private List<T> list;
	
	/**
	 * 分页
	 * @param list        列表数据
	 * @param totalCount  总记录数
	 * @param pageSize    每页记录数
	 * @param currPage    当前页数
	 */
	public PageUtils(List<T> list, int totalCount, int pageSize, int currPage) {
		this.list = list;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.currPage = currPage;
		this.totalPage = (int)Math.ceil((double)totalCount/pageSize);
	}


	
}
