package com.quickd.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.sys.entity.UserDept;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 用户部门表 Mapper 接口
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Mapper
@Repository
public interface UserDeptMapper extends BaseMapper<UserDept> {

}
