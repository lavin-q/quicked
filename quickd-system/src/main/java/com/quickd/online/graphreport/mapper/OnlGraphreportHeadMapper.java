package com.jeedcp.online.graphreport.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jeedcp.online.graphreport.entity.OnlGraphreportHead;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OnlGraphreportHeadMapper extends BaseMapper<OnlGraphreportHead> {
	/**
	 * 执行查询SQL语句
	 * 
	 * @param sql
	 * @return
	 */
	List<Map<?, ?>> executeSelete(String sql);
}
