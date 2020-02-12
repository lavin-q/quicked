package com.jeedcp.online.graphreport.controller;

import com.quickd.core.common.JsonResult;
import com.jeedcp.online.graphreport.entity.OnlGraphreportHead;
import com.jeedcp.online.graphreport.entity.OnlGraphreportItem;
import com.jeedcp.online.graphreport.service.IOnlGraphreportHeadService;
import com.jeedcp.online.graphreport.service.IOnlGraphreportItemService;
import com.jeedcp.online.graphreport.vo.OnlGraphreportHeadPage;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/online/graphreport/api")
public class OnlGraphreportApiController {
    @Autowired
    private IOnlGraphreportHeadService onlGraphreportHeadService;
    @Autowired
    private IOnlGraphreportItemService onlGraphreportItemService;

    /**
     * 获取图表数据
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/getChartsData")
    public JsonResult<?> getChartsData(@RequestParam(name = "id", required = true) String id) {
        OnlGraphreportHead onlGraphreportHead = (OnlGraphreportHead)onlGraphreportHeadService.getById(id);
        JsonResult<Map<String, Object>> result = new JsonResult<Map<String, Object>>();
        if (onlGraphreportHead == null) {
            return result.error("实体不存在");
        } else {
            Map<String, Object> resultMap = new HashMap<String, Object>();
            OnlGraphreportHeadPage onlGraphreportHeadPage = new OnlGraphreportHeadPage();
            BeanUtils.copyProperties(onlGraphreportHead, onlGraphreportHeadPage);
            onlGraphreportHeadPage.setYaxisField(onlGraphreportHead.getYaxisField().split(","));
            onlGraphreportHeadPage.setGraphType(onlGraphreportHead.getGraphType().split(","));
            List<OnlGraphreportItem> onlGraphreportItemList = onlGraphreportItemService.selectByMainId(id);
            onlGraphreportHeadPage.setOnlGraphreportItemList(onlGraphreportItemList);
            resultMap.put("info",onlGraphreportHeadPage);
            String dataType = "SQL";
            if (dataType.equals(onlGraphreportHead.getDataType())) {
                String sql = onlGraphreportHead.getCgrSql();
                // 执行SQL语句
                List<Map<?, ?>> listMap = onlGraphreportHeadService.executeSelete(sql);
                resultMap.put("data", listMap);
            }
            return result.ok(resultMap);
        }
    }
}
