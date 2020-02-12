package com.jeedcp.online.graphreport.service;

import com.quickd.core.service.BaseService;
import com.jeedcp.online.graphreport.entity.OnlGraphreportItem;

import java.util.List;

public interface IOnlGraphreportItemService extends BaseService<OnlGraphreportItem> {
    /**
     * 根据父id查询子表
     *
     * @param mainId
     * @return
     */
    public List<OnlGraphreportItem> selectByMainId(String mainId);
}
