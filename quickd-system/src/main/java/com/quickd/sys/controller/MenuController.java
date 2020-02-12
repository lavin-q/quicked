package com.quickd.sys.controller;

import com.quickd.core.enums.MenuTypeEnum;
import com.quickd.core.util.CollectionUtil;
import com.quickd.core.util.ConvertUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.quickd.core.common.JsonResult;
import com.quickd.core.vo.SelectResult;
import com.quickd.sys.dto.MenuDto;
import com.quickd.sys.dto.MenuTreeDto;
import com.quickd.sys.dto.UniappMenuDto;
import com.quickd.sys.dto.UserDto;
import com.quickd.sys.entity.Menu;
import com.quickd.sys.entity.RoleMenu;
import com.quickd.sys.jwt.JwtUtil;
import com.quickd.sys.service.IMenuService;
import com.quickd.sys.service.IRoleMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import com.quickd.core.controller.BaseController;

import java.util.*;

/**
 * <p>
 * 菜单权限表 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-15
 */
@Controller
@RequestMapping("/sys/menu")
@Slf4j
@Api(tags = "菜单管理")
public class MenuController extends BaseController<IMenuService, Menu, MenuDto> {
    @Autowired
    private IRoleMenuService roleMenuService;

    /**
     * 获取所有菜单
     */
    @GetMapping("/all")
    @ApiOperation("获取所有菜单")
    public JsonResult<HashMap<String, Object>> all() {
        UserDto user = JwtUtil.getCurrentUser();
        List<Menu> menuList = baseService.getUserMenus(user);
        List<MenuDto> menuDtoList = ConvertUtils.sourceToTarget(menuList, getDClass());
        Set<String> permissions = baseService.getUserPermissionsList(user);
        HashMap map = new HashMap<String, Object>();
        map.put("menuList", menuDtoList);
        map.put("permissions", permissions);
        return new JsonResult<HashMap<String, Object>>().ok(map);
    }

    /**
     * 获取所有菜单
     */
    @GetMapping("/listTopMenu")
    @ApiOperation("获取顶级菜单")
    public JsonResult<List<SelectResult>> listTopMenu() {
        QueryWrapper<Menu> menuQuery = new QueryWrapper<>();
        menuQuery.lambda().eq(Menu::getType, MenuTypeEnum.TOPMENU.value());
        List<Menu> menuList = baseService.list(menuQuery);
        return new JsonResult<List<SelectResult>>().ok(
                CollectionUtil.convertSelectDataList(menuList, "id", "name"));
    }

    /**
     * 获取所有菜单
     */
    @GetMapping("/listUniappMenu")
    @ApiOperation("获取Uniapp菜单")
    public JsonResult<List<UniappMenuDto>> listUniappMenu() {
        List<UniappMenuDto> uniappMenuDtos = new ArrayList<>();
        QueryWrapper<Menu> menuQuery = new QueryWrapper<>();
        menuQuery.lambda().eq(Menu::getIsUniapp, true);
        List<Menu> menuList = baseService.list(menuQuery);
        menuList.forEach((Menu menu) -> {
            UniappMenuDto uniappMenuDto = new UniappMenuDto();
            uniappMenuDto.setName(menu.getUrl());
            uniappMenuDto.setTitle(menu.getName());
            uniappMenuDto.setCuIcon(randomIcon());
            uniappMenuDto.setColor(randomColor());
            uniappMenuDtos.add(uniappMenuDto);
        });
        return new JsonResult<List<UniappMenuDto>>().ok(uniappMenuDtos);
    }

    /**
     * 用户角色授权功能，查询菜单权限树
     *
     * @return
     */
    @ApiOperation("用户角色授权功能，查询菜单权限树")
    @RequestMapping(value = "/queryTreeList", method = RequestMethod.GET)
    public JsonResult<List<MenuTreeDto>> queryIdTree() {
        JsonResult<List<MenuTreeDto>> result = new JsonResult<List<MenuTreeDto>>();
        try {
            List<MenuTreeDto> departTree = baseService.queryTreeList();
            return result.ok(departTree);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return result.error();
        }
    }


    @ApiOperation("查询角色授权")
    @RequestMapping(value = "/queryRolePermission", method = RequestMethod.GET)
    public JsonResult<List<String>> queryRolePermission(@RequestParam(name = "roleId", required = true) String roleId) {
        JsonResult<List<String>> result = new JsonResult<>();
        List<String> list = new ArrayList<String>();
        List<RoleMenu> roleMenus = roleMenuService.list(new QueryWrapper<RoleMenu>().lambda().eq(RoleMenu::getRoleId, roleId));
        if (roleMenus == null || roleMenus.size() <= 0) {
            result.error("未找到角色相关菜单信息");
        } else {
            for (RoleMenu roleMenu : roleMenus) {
                list.add(roleMenu.getMenuId());
            }
            result.ok(list);
        }
        return result;
    }


    /**
     * 保存角色授权
     *
     * @return
     */
    @RequestMapping(value = "/saveRoleMenus", method = RequestMethod.POST)
//    @RequiresRoles({ "admin" })
    public JsonResult<String> saveRoleMenus(@RequestParam(name = "roleId", required = true) String roleId, @RequestParam(name = "menuIds", required = true) String menuIds) {
        long start = System.currentTimeMillis();
        JsonResult<String> result = new JsonResult<>();
        try {
            roleMenuService.saveRolePermission(roleId, menuIds);
            result.ok("保存成功！");
            log.info("======角色授权成功=====耗时:" + (System.currentTimeMillis() - start) + "毫秒");
        } catch (Exception e) {
            result.error("授权失败！");
            log.error(e.getMessage(), e);
        }
        return result;
    }

    private static String randomColor() {
        String[] arr = new String[]{
                "cyan", "blue", "purple", "mauve", "pink", "brown", "red", "orange", "olive", "green"
        };
        Random random = new Random();
        int number = random.nextInt(arr.length);
        return arr[number];
    }

    private static String randomIcon() {
        String[] arr = new String[]{
                "newsfill", "colorlens", "font", "cuIcon", "btn", "tagfill", "myfill", "copy"
        };
        Random random = new Random();
        int number = random.nextInt(arr.length);
        return arr[number];
    }

}
