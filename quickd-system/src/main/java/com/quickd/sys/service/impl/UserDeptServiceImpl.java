package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quickd.sys.entity.UserDept;
import com.quickd.sys.mapper.UserDeptMapper;
import com.quickd.sys.service.IUserDeptService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户部门表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Service
public class UserDeptServiceImpl extends ServiceImpl<UserDeptMapper, UserDept> implements IUserDeptService {

}
