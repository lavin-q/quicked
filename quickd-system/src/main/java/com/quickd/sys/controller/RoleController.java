package com.quickd.sys.controller;

import com.quickd.sys.dto.RoleDto;
import com.quickd.sys.entity.Role;
import com.quickd.sys.service.IRoleService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import com.quickd.core.controller.BaseController;
import org.springframework.stereotype.Controller;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Controller
@RequestMapping("/sys/role")
@Api(tags="角色管理")
public class RoleController extends BaseController<IRoleService, Role,RoleDto> {

}
