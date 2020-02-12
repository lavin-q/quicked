package com.quickd.sys.mapper;

import com.quickd.sys.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 菜单权限表 Mapper 接口
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Mapper
@Repository
public interface MenuMapper extends BaseMapper<Menu> {

}
