package com.quickd.gen.controller;


import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.quickd.core.common.JsonResult;
import com.quickd.core.controller.BaseController;

import com.quickd.core.util.CollectionUtil;
import com.quickd.core.util.DBUtil;
import com.quickd.core.vo.SelectResult;
import com.quickd.gen.dto.DoGenerate;
import com.quickd.gen.dto.GenTableDto;
import com.quickd.gen.entity.GenTable;
import com.quickd.gen.mapper.TableMapper;
import com.quickd.gen.service.IGenTableColumnService;
import com.quickd.gen.service.IGenTableService;
import com.quickd.gen.service.impl.SysGeneratorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 业务表 前端控制器
 * </p>
 *
 * @author quickd
 * @since 2019-08-27
 */
@Controller
@RequestMapping("/gen/table")
@Api(tags = "业务表")
public class GenTableController extends BaseController<IGenTableService, GenTable, GenTableDto> {

    @Autowired
    private SysGeneratorService sysGeneratorService;

    @Autowired
    private TableMapper tableMapper;

    @GetMapping(value = "/select")
    @ApiOperation("表下拉框")
    public JsonResult<List<SelectResult>> select() {
        List<Map> tableColumn = tableMapper.listTable();
        return new JsonResult<List<SelectResult>>().ok(
                CollectionUtil.convertSelectDataList(tableColumn, "TABLE_NAME", "TABLE_NAME"));
    }

    @GetMapping(value = "/tableList")
    @ApiOperation("表列表")
    public JsonResult tableList() {
        List<Map> tableColumn = tableMapper.listTable();
        return new JsonResult().ok(tableColumn);
    }


    /**
     * 生成代码
     *
     * @return
     */
    @PostMapping("/code")
    @ApiOperation("生成代码")
    public JsonResult code(@RequestBody DoGenerate doGenerate) {
        sysGeneratorService.generatorCode(doGenerate);
        return new JsonResult().success("生成代码成功");
    }


//
//    @RequestMapping("/doGenerate")
//    public R getTables(@RequestBody DoGenerate doGenerate) {
//        String[] tableNames=new String[]{doGenerate.getModel().getTable()};
//        String templateName="Common"+"Controller";
//        if (doGenerate.getLayers().size()>0){//生成前端代码的条件
//            templateName=templateName+"View";
//        }
//        String sql3 = "SELECT * from menu where name='" + doGenerate.getMenu().getName() + "' and link='"+'/'+doGenerate.getModel().getTable()+'/'+"'";
//        List<Map<String, Object>> stringList0 = null;
//        try {
//            stringList0 = DBUtil.query(sql3);
//        } catch (SQLException e) {
//            return R.ok("新增菜单失败");
//        }
//        if (stringList0.size() > 0) {
//            return R.ok("菜单已存在！");
//        }
//        String sql1 = "INSERT INTO menu (parent_id, type,application, name,icon,link,sort_id) VALUES ('"+doGenerate.getMenu().getParentId()+"', 'PC', 'MS','"+doGenerate.getMenu().getName()+"','"+doGenerate.getMenu().getIcon()+"','"+'/'+doGenerate.getModel().getTable()+'/'+"','999')";
//        try {
//            DBUtil.executeUpdateFH(sql1);
//        } catch (Exception e) {
//            return R.ok("新增菜单失败");
//        }
//        sysGeneratorService.generatorCode(tableNames,templateName);
//        return R.ok("操作成功: 代码已生成，重新编译运行后生效！");
//    }
}
