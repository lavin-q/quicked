package com.jeedcp.online.graphreport.controller;

import com.quickd.core.common.JsonResult;
import com.quickd.core.controller.BaseController;
import com.jeedcp.online.graphreport.dto.OnlGraphreportHeadDto;
import com.jeedcp.online.graphreport.entity.OnlGraphreportHead;
import com.jeedcp.online.graphreport.entity.OnlGraphreportItem;
import com.jeedcp.online.graphreport.service.IOnlGraphreportHeadService;
import com.jeedcp.online.graphreport.service.IOnlGraphreportItemService;
import com.jeedcp.online.graphreport.vo.OnlGraphreportHeadPage;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.quickd.core.common.JsonResult;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/online/graphreport/head")
@Slf4j
public class OnlGraphreportHeadController extends BaseController<IOnlGraphreportHeadService, OnlGraphreportHead, OnlGraphreportHeadDto> {

    @Autowired
    private IOnlGraphreportHeadService onlGraphreportHeadService;
    @Autowired
    private IOnlGraphreportItemService onlGraphreportItemService;
    /**
     * 添加
     *
     * @param onlGraphreportHeadPage
     * @return
     */
    @PostMapping(value = "/add")
    public JsonResult<OnlGraphreportHead> add(@RequestBody OnlGraphreportHeadPage onlGraphreportHeadPage) {
        JsonResult<OnlGraphreportHead> result = new JsonResult<OnlGraphreportHead>();
        try {
            OnlGraphreportHead onlGraphreportHead = new OnlGraphreportHead();
            BeanUtils.copyProperties(onlGraphreportHeadPage, onlGraphreportHead);
            String yaxisField = StringUtils.join(onlGraphreportHeadPage.getYaxisField(), ",");
            String graphType = StringUtils.join(onlGraphreportHeadPage.getGraphType(),",");
            onlGraphreportHead.setYaxisField(yaxisField);
            onlGraphreportHead.setGraphType(graphType);
            System.out.println("onlGraphreportHeadPage:" + onlGraphreportHeadPage);

            onlGraphreportHeadService.saveMain(onlGraphreportHead, onlGraphreportHeadPage.getOnlGraphreportItemList());
            result.success("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            log.info(e.getMessage());
            result.error("操作失败");
        }
        return result;
    }

    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/getInfo")
    public JsonResult<OnlGraphreportHeadPage> getInfo(@RequestParam(name = "id", required = true) String id) {
        JsonResult<OnlGraphreportHeadPage> result = new JsonResult<OnlGraphreportHeadPage>();
        OnlGraphreportHead onlGraphreportHead = (OnlGraphreportHead)onlGraphreportHeadService.getById(id);
        OnlGraphreportHeadPage onlGraphreportHeadPage = new OnlGraphreportHeadPage();
        BeanUtils.copyProperties(onlGraphreportHead, onlGraphreportHeadPage);
        onlGraphreportHeadPage.setYaxisField(onlGraphreportHead.getYaxisField().split(","));
        onlGraphreportHeadPage.setGraphType(onlGraphreportHead.getGraphType().split(","));
        List<OnlGraphreportItem> onlGraphreportItemList = onlGraphreportItemService.selectByMainId(id);
        onlGraphreportHeadPage.setOnlGraphreportItemList(onlGraphreportItemList);
        result.ok(onlGraphreportHeadPage);
        return result;
    }

    /**
     * 修改
     *
     * @param onlGraphreportHeadPage
     * @return
     */
    @PutMapping(value = "/edit")
    public JsonResult<OnlGraphreportHead> edit(@RequestBody OnlGraphreportHeadPage onlGraphreportHeadPage) {
        JsonResult<OnlGraphreportHead> result = new JsonResult<OnlGraphreportHead>();
        OnlGraphreportHead onlGraphreportHead = new OnlGraphreportHead();
        BeanUtils.copyProperties(onlGraphreportHeadPage, onlGraphreportHead);
        String yaxisField = StringUtils.join(onlGraphreportHeadPage.getYaxisField(), ",");
        String graphType = StringUtils.join(onlGraphreportHeadPage.getGraphType(),",");
        onlGraphreportHead.setYaxisField(yaxisField);
        onlGraphreportHead.setGraphType(graphType);
        OnlGraphreportHead onlGraphreportHeadEntity = (OnlGraphreportHead)onlGraphreportHeadService.getById(onlGraphreportHead.getId());
        if (onlGraphreportHeadEntity == null) {
            result.error("未找到对应实体");
        } else {
//            onlGraphreportHeadService.updateById(onlGraphreportHead);
            onlGraphreportHeadService.updateMain(onlGraphreportHead, onlGraphreportHeadPage.getOnlGraphreportItemList());
            result.success("修改成功!");
        }

        return result;
    }

    /**
     * 通过id删除
     *
     * @param id
     * @return
     */
    @DeleteMapping(value = "/delete")
    public JsonResult<OnlGraphreportHead> delete(@RequestParam(name = "id", required = true) String id) {
        JsonResult<OnlGraphreportHead> result = new JsonResult<OnlGraphreportHead>();
        OnlGraphreportHead onlGraphreportHead = (OnlGraphreportHead)onlGraphreportHeadService.getById(id);
        if (onlGraphreportHead == null) {
            result.error("未找到对应实体");
        } else {
            onlGraphreportHeadService.delMain(id);
            result.success("删除成功!");
        }

        return result;
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @DeleteMapping(value = "/deleteBatch")
    public JsonResult<OnlGraphreportHead> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        JsonResult<OnlGraphreportHead> result = new JsonResult<OnlGraphreportHead>();
        if (ids == null || "".equals(ids.trim())) {
            result.error("参数不识别！");
        } else {
            this.onlGraphreportHeadService.delBatchMain(Arrays.asList(ids.split(",")));
            result.success("删除成功!");
        }
        return result;
    }
}
