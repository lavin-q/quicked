package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.entity.Role;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
public interface IRoleService extends BaseService<Role> {

    public Role getRoleById (String id);

}
