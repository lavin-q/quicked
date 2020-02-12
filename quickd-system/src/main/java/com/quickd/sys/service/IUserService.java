package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.entity.User;

import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
public interface IUserService extends BaseService<User> {

    /**
     * 获取用户信息
     * @param username
     * @return
     */
    User  getUserByUsername(String username);


    /**
     * 添加用户和角色信息
     * @param entity
     * @param roleIdList
     */
   void addUserWithRole(User entity, List<String> roleIdList,String deptId);


}
