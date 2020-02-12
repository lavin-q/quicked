package com.quickd.online.graphreport.mapper;



import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.online.graphreport.entity.OnlGraphreportItem;
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
	boolean deleteByMainId(String mainId);

	/**
	 * 根据父id查询子表
	 * 
	 * @param mainId
	 * @return
	 */
	 List<OnlGraphreportItem> selectByMainId(String mainId);
}
