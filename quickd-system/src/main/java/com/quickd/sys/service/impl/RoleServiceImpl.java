package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.sys.entity.Role;
import com.quickd.sys.mapper.RoleMapper;
import com.quickd.sys.service.IRoleService;
import io.jsonwebtoken.lang.Collections;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements IRoleService {

    @Override
    public Role getRoleById(String id) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper();
        queryWrapper.lambda().eq(Role::getId, id);
        List<Role> roleList = baseMapper.selectList(queryWrapper);
        if (Collections.isEmpty(roleList)) {
            return null;
        }
        return roleList.get(0);
    }

}
