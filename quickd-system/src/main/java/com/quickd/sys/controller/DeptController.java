package com.quickd.sys.controller;


import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.JsonResult;
import com.quickd.core.controller.BaseController;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.core.validator.group.AddGroup;
import com.quickd.core.validator.group.DefaultGroup;
import com.quickd.sys.dto.DeptTreeDto;
import com.quickd.sys.dto.DeptDto;
import com.quickd.sys.entity.Dept;
import com.quickd.sys.service.IDeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * <p>
 * 组织机构表 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/dept")
@Slf4j
@Api(tags="组织机构管理")
public class DeptController extends BaseController<IDeptService, Dept, DeptDto> {


    /**
     * 查询数据 添加或编辑页面对该方法发起请求,以树结构形式加载所有部门的名称,方便用户的操作
     *
     * @return
     */
    @RequestMapping(value = "/queryTreeList", method = RequestMethod.GET)
    public JsonResult<List<DeptTreeDto>> queryIdTree() {
        JsonResult<List<DeptTreeDto>> result = new JsonResult<List<DeptTreeDto>>();
        try {
            List<DeptTreeDto> departTree = baseService.queryIdTree();
            return result.ok(departTree);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return result.error();
        }
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation("新增部门（save接口废除）" )
    @LogOperationAno("新增部门" )
    public JsonResult add(@RequestBody DeptDto dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        Dept entity = ConvertUtils.sourceToTarget(dto, getTClass());
        baseService.saveDeptData(entity);
        return new JsonResult();
    }
}
