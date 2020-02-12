package com.quickd.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.JsonResult;
import com.quickd.core.common.Status;
import com.quickd.core.controller.BaseController;
import com.quickd.core.util.Encryptor;
import com.quickd.sys.dto.UserDto;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.util.YouBianCodeUtil;
import com.quickd.core.validator.group.AddGroup;
import com.quickd.core.validator.group.DefaultGroup;
import com.quickd.sys.entity.*;
import com.quickd.sys.service.*;
import com.quickd.core.util.Encryptor;
import com.quickd.core.util.Base64Util;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.sys.jwt.JwtUtil;
import com.quickd.sys.dto.PasswordDTO;
import io.jsonwebtoken.lang.Collections;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@RestController
@RequestMapping("/sys/user")
@Slf4j
@Api(tags = "用户管理")
public class UserController extends BaseController<IUserService, User, UserDto> {
    @Autowired
    private IUserRoleService userRoleService;
    @Autowired
    private IUserDeptService userDeptService;
    @Autowired
    private IDeptService deptService;
    @Autowired
    private IRoleService roleService;

    @GetMapping("info")
    @ApiOperation("登录用户信息")
    public JsonResult<UserDto> info() {
        UserDto data = JwtUtil.getCurrentUser();
        return new JsonResult<UserDto>().ok(data);
    }
    @GetMapping("userInfo")
    @ApiOperation("登录用户信息")
    public JsonResult<UserDto> userInfo() {
        UserDto data = JwtUtil.getCurrentUser();
        return new JsonResult<UserDto>().ok(data);
    }
    @PostMapping("password")
    @ApiOperation("修改密码")
    @LogOperationAno("修改密码")
    public JsonResult password(@RequestBody PasswordDTO dto) throws Exception {
        //效验数据
        ValidatorUtils.validateEntity(dto);
        String password = Base64Util.decodeNTimes(dto.getPassword(), 3);
        String newPassword = Base64Util.decodeNTimes(dto.getNewPassword(), 3);

        UserDto user = JwtUtil.getCurrentUser();
        //原密码不正确
        if (!user.getPassword().equals(Encryptor.encryptPassword(password, user.getSalt()))) {
            log.warn(user.getRealName() + "修改密码错误，原密码不正确");
            return new JsonResult().error(Status.PASSWORD_ERROR.code());
        }
        user.setPassword(Encryptor.encryptPassword(newPassword, user.getSalt()));
        baseService.updateById(user);
        log.debug(user.getRealName() + "修改密码成功");
        return new JsonResult();
    }


    @ApiOperation("查询用户相关的角色主键值列表")
    @RequestMapping(value = "/queryUserRole", method = RequestMethod.GET)
    public JsonResult<List<String>> queryUserRole(@RequestParam(name = "userId", required = true) String userId) {
        JsonResult<List<String>> result = new JsonResult<>();
        List<String> list = new ArrayList<String>();
        List<UserRole> userRole = userRoleService.list(new QueryWrapper<UserRole>().lambda().eq(UserRole::getUserId, userId));
        if (userRole == null || userRole.size() <= 0) {
            result.error("未找到用户相关角色信息");
        } else {
            for (UserRole sysUserRole : userRole) {
                String roleId = sysUserRole.getRoleId();
                list.add(sysUserRole.getRoleId());
                Role role = roleService.getRoleById(roleId);
                list.add(role.getRoleName());
            }
            result.ok(list);
        }
        return result;
    }

    @ApiOperation("查询指定用户和部门关联的数据")
    @RequestMapping(value = "/userDepartList", method = RequestMethod.GET)
    public JsonResult<List<String>> getUserDepartsList(@RequestParam(name = "userId", required = true) String userId) {
        JsonResult<List<String>> result = new JsonResult<>();
        List<String> list = new ArrayList<String>();
        List<UserDept> userDepts = userDeptService.list(new QueryWrapper<UserDept>().lambda().eq(UserDept::getUserId, userId));
        if (userDepts == null || userDepts.size() <= 0) {
            result.error("未找到用户相关部门信息");
        } else {
            for (UserDept userDept : userDepts) {
                String deptId = userDept.getDepId();
                list.add(userDept.getDepId());
                Dept dept = deptService.getDeptById(deptId);
                list.add(dept.getDeptName());
            }
            result.ok(list);
        }
        return result;
    }

    @ApiOperation("添加用户")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public JsonResult add(@RequestBody UserDto dto) {
        JsonResult<List<String>> result = new JsonResult<>();
        try {
            //效验数据
            ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
            User entity = ConvertUtils.sourceToTarget(dto, User.class);
            //密码加密
            String salt = YouBianCodeUtil.randomGen(8);
            entity.setSalt(salt);
            entity.setPassword(Encryptor.encryptPassword(entity.getPassword(), salt));
            baseService.addUserWithRole(entity, dto.getRoleIdList(),dto.getDeptId());
            result.success();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            result.error("操作失败");
        }
        return result;
    }


}
