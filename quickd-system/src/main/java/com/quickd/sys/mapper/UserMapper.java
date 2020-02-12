package com.quickd.sys.mapper;

import com.quickd.sys.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

}
