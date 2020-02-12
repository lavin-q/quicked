package com.jeedcp.online.graphreport.mapper;



import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jeedcp.online.graphreport.entity.OnlGraphreportItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OnlGraphreportItemMapper extends BaseMapper<OnlGraphreportItem> {

	/**
	 * 根据父id删除子表
	 * 
	 * @param mainId
	 * @return
	 */
	public boolean deleteByMainId(String mainId);

	/**
	 * 根据父id查询子表
	 * 
	 * @param mainId
	 * @return
	 */
	public List<OnlGraphreportItem> selectByMainId(String mainId);
}
