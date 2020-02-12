package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.sys.entity.User;
import com.quickd.sys.entity.UserDept;
import com.quickd.sys.entity.UserRole;
import com.quickd.sys.mapper.UserMapper;
import com.quickd.sys.service.IUserDeptService;
import com.quickd.sys.service.IUserRoleService;
import com.quickd.sys.service.IUserService;
import io.jsonwebtoken.lang.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements IUserService {
    @Autowired
    private IUserRoleService userRoleService;
    @Autowired
    private IUserDeptService userDeptService;

    @Override
    public User getUserByUsername(String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper();
        queryWrapper.lambda().eq(User::getUsername, username);
        List<User> userList = baseMapper.selectList(queryWrapper);
        if (Collections.isEmpty(userList)) {
            return null;
        }
        return userList.get(0);
    }

    @Override
    @Transactional
    public void addUserWithRole(User entity, List<String> roleIdList,String deptId) {

        baseMapper.insert(entity);
        //保存角色用户关系
        String userId = entity.getId();
        //先删除角色用户关系
        userRoleService.remove(new QueryWrapper<UserRole>().eq("user_id",userId));

        //用户没有一个角色权限的情况
        if (Collections.isEmpty(roleIdList)) {
            return;
        }
        //保存角色用户关系
        for (String roleId : roleIdList) {
            UserRole sysRoleUserEntity = new UserRole();
            sysRoleUserEntity.setUserId(userId);
            sysRoleUserEntity.setRoleId(roleId);
            //保存
            userRoleService.save(sysRoleUserEntity);
        }

        //先删除部门用户关系
        userDeptService.remove(new QueryWrapper<UserDept>().eq("user_id",userId));

        //保存部门用户关系
        UserDept sysDeptUserEntity = new UserDept();
        sysDeptUserEntity.setUserId(userId);
        sysDeptUserEntity.setDepId(deptId);
        userDeptService.save(sysDeptUserEntity);
    }


}
