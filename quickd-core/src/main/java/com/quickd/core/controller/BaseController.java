package com.quickd.core.controller;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.quickd.core.annotation.LogOperationAno;
import com.quickd.core.common.JsonResult;
import com.quickd.core.common.PageUtils;
import com.quickd.core.dto.BaseDto;
import com.quickd.core.query.QueryViewVo;
import com.quickd.core.service.BaseService;
import com.quickd.core.util.ConvertUtils;
import com.quickd.core.util.ExcelUtils;
import com.quickd.core.validator.Assert;
import com.quickd.core.validator.ValidatorUtils;
import com.quickd.core.validator.group.AddGroup;
import com.quickd.core.validator.group.DefaultGroup;
import com.quickd.core.validator.group.UpdateGroup;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @project: jeedcp
 * @description: 增删改查通用管理功能-父类
 * @author: caochaofeng
 * @create: 2019-08-15 09:03
 */
@RestController
@Slf4j
public abstract class BaseController<Service extends BaseService<T>, T, D extends BaseDto> {

    @Autowired
    protected Service baseService;


    protected Class<D> getDClass() {
        Class<D> dc = (Class<D>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[2];
        return dc;
    }

    protected Class<T> getTClass() {
        Class<T> tClass = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
        return tClass;
    }


    @GetMapping("/list")
    @ApiOperation("高级分页")
    public JsonResult<PageUtils<D>> list(QueryViewVo<T> queryViewVo) {
        IPage<T> iPage = baseService.queryPage(queryViewVo);
        List<D> targetList = ConvertUtils.sourceToTarget(iPage.getRecords(), getDClass());
        PageUtils<D> page = new PageUtils<D>(targetList, (int) iPage.getTotal(), (int) iPage.getSize(), (int) iPage.getCurrent());
        return new JsonResult<PageUtils<D>>().ok(page);
    }

    /**
     * 获取所有的数据
     *
     * @return 返回前端json数据
     */
    @GetMapping("getList")
    public JsonResult<List<D>> getList() {
        List<T> list = baseService.list();
        List<D> targetList = ConvertUtils.sourceToTarget(list, getDClass());
        return new JsonResult<List<D>>().ok(targetList);
    }


    @GetMapping("{id}")
    @ApiOperation("信息")
    public JsonResult<D> get(@PathVariable("id") String id) {
        T entity = (T) baseService.getById(id);
        D data = ConvertUtils.sourceToTarget(entity, getDClass());
        return new JsonResult<D>().ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperationAno("保存")
    public JsonResult save(@RequestBody D dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class);
        T entity = ConvertUtils.sourceToTarget(dto, getTClass());
        baseService.save(entity);
        return new JsonResult().ok("成功添加数据");
    }

    @PostMapping("addDataBatch")
    @ApiOperation("添加一组数据")
    @LogOperationAno("添加一组数据")
    public JsonResult addDataBatch(@RequestBody Collection<D> dtos) {
        List<T> targetList = ConvertUtils.sourceToTarget(dtos, getTClass());
        boolean flag = baseService.saveBatch(targetList, 500);
        if (flag) {
            return new JsonResult().ok("成功添加一组数据");
        }
        return new JsonResult().error("添加一组数据失败");
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperationAno("修改")
    public JsonResult update(@RequestBody D dto) {
        JsonResult result = new JsonResult();
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        T entity = (T) baseService.getById(dto.getId());
        if (entity == null) {
            result.error("未找到对应实体");
        } else {
            T data =   ConvertUtils.sourceToTarget(dto,getTClass());
            boolean ok =    baseService.updateById(data);
            if (ok) {
                result.ok("修改成功!");
            }
        }
        return result;
    }

    /**
     * 根据其他属性字段修改一条数据
     *
     * @param pojo   任意类型实体类
     * @param column 具体字段
     * @param value  具体字段的值
     * @return 返回前端json数据
     */
    @PostMapping("updateByColumn")
    @ApiOperation("根据其他属性字段修改一条数据")
    @LogOperationAno("根据其他属性字段修改一条数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "column", value = "具体字段", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "value", value = "字段的值", required = true, dataType = "string", paramType = "query")})
    public JsonResult updateByColumn(@RequestBody T pojo, @RequestParam("column") String column, @RequestParam(name = "value") String value) {
        Wrapper<T> wrapper = Wrappers.<T>update().eq(column, value);
        boolean flag = baseService.update(pojo, wrapper);
        if (flag) {
            return new JsonResult().ok("成功修改一条数据");
        }
        return new JsonResult().error("修改失败");
    }

    /**
     * 要根据哪个字段删除一条数据
     *
     * @param column 要根据哪个字段删除
     * @param value  字段的值
     * @return 返回前端json数据
     */
    @DeleteMapping("deleteByColumn")
    @ApiOperation("要根据哪个字段删除一条数据")
    @LogOperationAno("要根据哪个字段删除一条数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "column", value = "要根据哪个字段删除", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "value", value = "字段的值", required = true, dataType = "string", paramType = "query")})
    public JsonResult deleteByColumn(@RequestParam("column") String column, @RequestParam("value") String value) {
        Assert.isBlank(column, "删除字段为空");
        Assert.isBlank(value, "字段的值为空");
        Wrapper<T> ew = Wrappers.<T>query().eq(column, value);
        JsonResult result = new JsonResult();
        List<T> list = ( List<T>) baseService.list(ew);
        if (list.size() == 0) {
            result.error("未找到对应实体");
        } else {
            boolean flag = baseService.remove(ew);
            if (flag) {
                result.ok("删除成功!");
            }
        }
        return result;
    }


    @DeleteMapping
    @ApiOperation("根据一组id删除数据")
    @LogOperationAno("根据一组id删除数据")
    public JsonResult delete(@RequestBody String[] ids) {
        //效验数据
        Assert.isArrayEmpty(ids, "主键为空");
        baseService.removeByIds(Arrays.asList(ids));
        return new JsonResult().ok("批量删除成功");
    }

    /**
     * 根据id删除一条数据
     *
     * @param id 传入的id值
     * @return 返回前端json数据
     */
    @DeleteMapping("deleteById")
    @ApiOperation("根据id删除一条数据")
    @LogOperationAno("根据id删除一条数据")
    public JsonResult delete(@RequestParam("id") String id) {
        JsonResult result = new JsonResult();
        T entity = (T) baseService.getById(id);
        if (entity == null) {
            result.error("未找到对应实体");
        } else {
            boolean ok = baseService.removeById(id);
            if (ok) {
                result.ok("删除成功!");
            }
        }
        return result;

    }

    @GetMapping("export")
    @ApiOperation("导出excel")
    @LogOperationAno("导出excel")
    public void export(QueryViewVo<T> queryViewVo, HttpServletResponse response) throws Exception {
        IPage<T> page = baseService.queryPage(queryViewVo);
        ExcelUtils.exportExcelToTarget(response, null, page.getRecords(), getDClass());
    }


    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    @ApiOperation("通过excel导入数据")
    @LogOperationAno("通过excel导入数据")
    public JsonResult importExcel(HttpServletRequest request, HttpServletResponse response) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            MultipartFile file = entity.getValue();// 获取上传文件对象
            ImportParams importParams = new ImportParams();
            // 数据处理
            importParams.setHeadRows(1);
            importParams.setTitleRows(1);
            // 需要验证
            importParams.setNeedSave(true);
            try {
                List<D> list = ExcelImportUtil.importExcel(file.getInputStream(), getDClass(), importParams);
                for (D obj : list) {
                    baseService.save(obj);
                }
                return new JsonResult().ok("文件导入成功！数据行数：" + list.size());
            } catch (Exception e) {
                log.error(e.getMessage(), e);
                return new JsonResult().error("抱歉! 您导入的数据中用户名已经存在.");
            } finally {
                try {
                    file.getInputStream().close();
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                }
            }


        }
        return new JsonResult().error("文件导入失败！");
    }


}
