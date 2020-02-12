package com.quickd.gen.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月19日 下午3:32:04
 */
@Mapper
public interface TableMapper {
	@Select("select TABLE_NAME,TABLE_COMMENT from information_schema.TABLES where TABLE_SCHEMA=(select database()) and  TABLE_NAME not like 'sys_%' and TABLE_NAME not like 'qrtz_%' and  TABLE_NAME not like 'ACT_%' ")
	List<Map> listTable();

	@Select("select TABLE_NAME,TABLE_COMMENT from information_schema.TABLES where TABLE_SCHEMA=(select database()) and  TABLE_NAME=#{tableName}")
	List<Map> queryTable(String tableName);

	@Select("select * from information_schema.COLUMNS where TABLE_SCHEMA = (select database()) and TABLE_NAME=#{tableName}  ORDER BY ORDINAL_POSITION")
	List<Map> listTableColumn(String tableName);
}
