package com.quickd.sys.service;

import com.quickd.sys.entity.RoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 角色权限表 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
public interface IRoleMenuService extends IService<RoleMenu> {

    void saveRolePermission(String roleId, String permissionIds);
}
