package com.quickd.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.common.Const;
import com.quickd.core.enums.MenuTypeEnum;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.util.TreeUtils;
import com.quickd.sys.dto.MenuTreeDto;
import com.quickd.sys.dto.UserDto;
import com.quickd.sys.entity.*;
import com.quickd.sys.mapper.MenuMapper;
import com.quickd.sys.service.IMenuService;
import com.quickd.sys.service.IRoleMenuService;
import com.quickd.sys.service.IUserRoleService;
import io.jsonwebtoken.lang.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 菜单权限表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Service
public class MenuServiceImpl extends BaseServiceImpl<MenuMapper, Menu> implements IMenuService {
    @Autowired
    private IUserRoleService userRoleService;

    @Autowired
    private IRoleMenuService roleMenuService;

    @Override
    public Set<String> getUserPermissionsList(UserDto user) {
        List<Object> menuList = new ArrayList<>();
        QueryWrapper<Menu> menuQuery = new QueryWrapper<>();
        if(Const.SYS_ADMIN.equals(user.getMgrType())) {
            menuQuery.lambda().eq(Menu::getType, MenuTypeEnum.BUTTON.value()).select(Menu::getPermissions);
            menuList = baseMapper.selectList(menuQuery);
        }else{
            QueryWrapper<UserRole> query = new QueryWrapper<>();
            query.lambda()
                    .eq(UserRole::getUserId, user.getId()).select(UserRole::getRoleId);
            List<Object> roleIdList = userRoleService.listObjs(query);

            QueryWrapper<RoleMenu> roleMenuQuery = new QueryWrapper<>();
            roleMenuQuery.lambda().in(RoleMenu::getRoleId, roleIdList).select(RoleMenu::getMenuId);
            List<Object> menuIdList = roleMenuService.listObjs(roleMenuQuery);
            menuQuery.lambda().in(Menu::getId, menuIdList).select(Menu::getPermissions);
            menuList = baseMapper.selectObjs(menuQuery);
        }
        if (Collections.isEmpty(menuList)) {
            return java.util.Collections.emptySet();
        } else {
            Set<String> permissions = new HashSet(menuList);
            return permissions;
        }
    }

    @Override
    public List<Menu> getUserMenus( UserDto user) {
        QueryWrapper<Menu> menuQuery = new QueryWrapper<>();
        if(Const.SYS_ADMIN.equals(user.getMgrType())){
            menuQuery.lambda().ne(Menu::getType, MenuTypeEnum.BUTTON.value());
        }else{
            QueryWrapper<UserRole> query = new QueryWrapper<>();
            query.lambda()
                    .eq(UserRole::getUserId, user.getId()).select(UserRole::getRoleId);
            List<Object> roleIdList = userRoleService.listObjs(query);

            QueryWrapper<RoleMenu> roleMenuQuery = new QueryWrapper<>();
            roleMenuQuery.lambda().in(RoleMenu::getRoleId, roleIdList).select(RoleMenu::getMenuId);
            List<Object> menuIdList = roleMenuService.listObjs(roleMenuQuery);
            menuQuery.lambda().in(Menu::getId, menuIdList).ne(Menu::getType, MenuTypeEnum.BUTTON.value());

        }
        List<Menu> menuList = baseMapper.selectList(menuQuery);
        return menuList;
    }

    /**
     * 查询菜单
     * @return
     */
    @Override
    public List<MenuTreeDto> queryTreeList() {
        List<Menu> menuList =  this.baseMapper.selectList(new QueryWrapper<Menu>());
        List<MenuTreeDto> menuTreeDtoList = ConvertUtils.sourceToTarget(menuList, MenuTreeDto.class);
        return TreeUtils.build(menuTreeDtoList);
    }

}
