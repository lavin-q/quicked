package com.quickd.sys.mapper;

import com.quickd.sys.entity.Dict;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.sys.vo.DictVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Mapper
public interface DictMapper extends BaseMapper<Dict> {


    List<DictVo> queryDictItemsByCode(@Param("code") String code);

    List<DictVo> queryTableDictItemsByCode(@Param("table") String table, @Param("text") String text, @Param("code") String code);


    String queryDictTextByKey(@Param("code") String code, @Param("key") String key);

    String queryTableDictTextByKey(@Param("table") String table, @Param("text") String text, @Param("code") String code, @Param("key") String key);


}
