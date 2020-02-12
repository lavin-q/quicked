package com.quickd.gen.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.quickd.core.common.JsonResult;
import com.quickd.core.controller.BaseController;
import com.quickd.core.util.CollectionUtil;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.vo.SelectResult;
import com.quickd.gen.dto.GenTableColumnDto;
import com.quickd.gen.entity.GenTableColumn;
import com.quickd.gen.mapper.TableMapper;
import com.quickd.gen.service.IGenTableColumnService;
import io.swagger.annotations.Api;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 业务表字段 前端控制器
 * </p>
 *
 * @author quickd
 * @since 2019-08-27
 */
@RestController
@RequestMapping("/gen/tableColumn")
@Api(tags = "业务表字段")
public class GenTableColumnController extends BaseController<IGenTableColumnService, GenTableColumn, GenTableColumnDto> {
    @Autowired
    private TableMapper tableMapper;

    /**
     * @param tableName
     * @return
     */
    @GetMapping(value = "/listTableColumn")
    public JsonResult listTableColumn(String tableName) {
        List<GenTableColumn> result = baseService.queryGenTableColumn(tableName);
        List<GenTableColumnDto> targetList = ConvertUtils.sourceToTarget(result, getDClass());
        return new JsonResult().ok(targetList);
    }

    /**
     * @param tableName
     * @return
     */
    @GetMapping(value = "/select")
    public JsonResult<List<SelectResult>> select(String tableName) {
        List<Map> tableColumn = tableMapper.listTableColumn(tableName);
        return new JsonResult<List<SelectResult>>().ok(
                CollectionUtil.convertSelectDataList(tableColumn, "COLUMN_NAME", "COLUMN_NAME"));
    }


    @PutMapping(value = "/updateColumn")
    public JsonResult updateColumn(@RequestBody List<GenTableColumn> genTableColumnList) {
        for (GenTableColumn genTableColumn : genTableColumnList) {
            genTableColumn.setId(IdWorker.getIdStr());
            if (genTableColumn.getColName().equals("")) {
                return new JsonResult().error("请输入字段名称");
            }
            if(genTableColumn.getAttrName()!=null) {
                genTableColumn.setAttrName(genTableColumn.getAttrName());
            }else{
                genTableColumn.setAttrName(genTableColumn.getAttr());
            }
            genTableColumn.setAttr(StringUtils.uncapitalize(genTableColumn.getAttr()));
        }
        String tableName = genTableColumnList.get(0).getTableName();
        baseService.remove((new QueryWrapper<GenTableColumn>().eq("table_name", tableName)));
        boolean flag = baseService.saveBatch(genTableColumnList, 500);
        if (flag) {
            return new JsonResult().ok("成功添加一组数据");
        }
        return new JsonResult().error("添加一组数据失败");
    }
}
