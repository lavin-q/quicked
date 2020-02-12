package com.quickd.sys.controller;


import com.quickd.core.common.JsonResult;
import com.quickd.core.util.CollectionUtil;
import com.quickd.core.vo.SelectResult;
import com.quickd.sys.dto.DeptTreeDto;
import com.quickd.sys.dto.DictDto;
import com.quickd.sys.entity.Dict;
import com.quickd.sys.entity.DictItem;
import com.quickd.sys.service.IDictItemService;
import com.quickd.sys.service.IDictService;
import com.quickd.sys.vo.DictVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.quickd.core.controller.BaseController;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/dict")
@Api(tags = "字典管理")
public class DictController extends BaseController<IDictService, Dict, DictDto> {
    /**
     * 通过查询指定code 获取字典
     *
     * @param dictCode 字典编码
     * @return
     */
    @ApiOperation("通过查询指定code 获取字典项内容")
    @RequestMapping(value = "/queryDictItemByDictCode", method = RequestMethod.GET)
    JsonResult<List<DictVo>> queryDictItemByDictCode(String dictCode) {
        List<DictVo> dictVos = baseService.queryDictItemsByCode(dictCode);
        return new JsonResult<List<DictVo>>().ok(dictVos);
    }

}
