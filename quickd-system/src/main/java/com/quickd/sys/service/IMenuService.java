package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.dto.MenuTreeDto;
import com.quickd.sys.dto.UserDto;
import com.quickd.sys.entity.Menu;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 菜单权限表 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
public interface IMenuService extends BaseService<Menu> {

    /**
     * 查询用户权限列表
     * @param user  用户
     *
     */
    Set<String> getUserPermissionsList(UserDto user);


    /**
     * 获取菜单项信息
     *
     * @param user 用户
     * @return
     */
    List<Menu> getUserMenus(UserDto user);


    /**
     * 获取菜单树
     * @return
     */
    List<MenuTreeDto> queryTreeList();

}
