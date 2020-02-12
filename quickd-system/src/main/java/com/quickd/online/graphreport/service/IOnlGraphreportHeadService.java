package com.jeedcp.online.graphreport.service;

import com.quickd.core.service.BaseService;
import com.jeedcp.online.graphreport.entity.OnlGraphreportHead;
import com.jeedcp.online.graphreport.entity.OnlGraphreportItem;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public interface IOnlGraphreportHeadService  extends BaseService<OnlGraphreportHead> {
    /**
     * 添加一对多、
     *
     * @param onlGraphreportHead
     * @param onlGraphreportItemList
     */
    public void saveMain(OnlGraphreportHead onlGraphreportHead, List<OnlGraphreportItem> onlGraphreportItemList);

    /**
     * 修改一对多
     *
     * @param onlGraphreportHead
     * @param onlGraphreportItemList
     */
    public void updateMain(OnlGraphreportHead onlGraphreportHead, List<OnlGraphreportItem> onlGraphreportItemList);

    /**
     * 删除一对多
     *
     * @param id
     */
    public void delMain(String id);

    /**
     * 批量删除一对多
     *
     * @param idList
     */
    public void delBatchMain(Collection<? extends Serializable> idList);

    /**
     * 执行查询SQL语句
     *
     * @param sql
     * @return
     */
    List<Map<?, ?>> executeSelete(String sql);
}
