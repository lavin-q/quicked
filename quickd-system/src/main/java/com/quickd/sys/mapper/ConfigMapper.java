package com.quickd.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.sys.entity.Config;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 参数配置表 Mapper 接口
 * </p>
 *
 * @author quickd
 * @since 2019-09-29
 */
@Mapper
public interface ConfigMapper extends BaseMapper<Config> {

}
