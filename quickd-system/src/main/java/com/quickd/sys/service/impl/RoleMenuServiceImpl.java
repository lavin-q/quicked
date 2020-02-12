package com.quickd.sys.service.impl;

import com.quickd.core.util.StringUtil;
import com.quickd.sys.entity.RoleMenu;
import com.quickd.sys.mapper.RoleMenuMapper;
import com.quickd.sys.service.IRoleMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 角色权限表 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {

    @Override
    public void saveRolePermission(String roleId, String permissionIds) {
        String arr[] = permissionIds.split(",");
        List<RoleMenu> list = new ArrayList<RoleMenu>();
        for (String p : arr) {
            if(StringUtil.isNotEmpty(p)) {
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setMenuId(p);
                roleMenu.setRoleId(roleId);
                list.add(roleMenu);
            }
        }
        this.saveBatch(list);
    }
}
