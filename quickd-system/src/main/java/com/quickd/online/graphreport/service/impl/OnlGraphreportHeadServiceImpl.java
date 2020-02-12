package com.jeedcp.online.graphreport.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.jeedcp.online.graphreport.entity.OnlGraphreportHead;
import com.jeedcp.online.graphreport.entity.OnlGraphreportItem;
import com.jeedcp.online.graphreport.mapper.OnlGraphreportHeadMapper;
import com.jeedcp.online.graphreport.mapper.OnlGraphreportItemMapper;
import com.jeedcp.online.graphreport.service.IOnlGraphreportHeadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Service
public class OnlGraphreportHeadServiceImpl extends BaseServiceImpl<OnlGraphreportHeadMapper, OnlGraphreportHead> implements IOnlGraphreportHeadService {

    @Autowired
    private OnlGraphreportHeadMapper onlGraphreportHeadMapper;
    @Autowired
    private OnlGraphreportItemMapper onlGraphreportItemMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveMain(OnlGraphreportHead onlGraphreportHead, List<OnlGraphreportItem> onlGraphreportItemList) {
        onlGraphreportHeadMapper.insert(onlGraphreportHead);
        for (OnlGraphreportItem entity : onlGraphreportItemList) {
            // 外键设置
            entity.setGraphreportHeadId(onlGraphreportHead.getId());
            onlGraphreportItemMapper.insert(entity);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateMain(OnlGraphreportHead onlGraphreportHead, List<OnlGraphreportItem> onlGraphreportItemList) {
        onlGraphreportHeadMapper.updateById(onlGraphreportHead);

        // 1.先删除子表数据
        onlGraphreportItemMapper.deleteByMainId(onlGraphreportHead.getId());

        // 2.子表数据重新插入
        for (OnlGraphreportItem entity : onlGraphreportItemList) {
            // 外键设置
            entity.setGraphreportHeadId(onlGraphreportHead.getId());
            onlGraphreportItemMapper.insert(entity);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delMain(String id) {
        onlGraphreportHeadMapper.deleteById(id);
        onlGraphreportItemMapper.deleteByMainId(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delBatchMain(Collection<? extends Serializable> idList) {
        for (Serializable id : idList) {
            onlGraphreportHeadMapper.deleteById(id);
            onlGraphreportItemMapper.deleteByMainId(id.toString());
        }
    }

    /**
     * 执行查询SQL语句
     *
     * @param sql
     * @return
     */
    public List<Map<?, ?>> executeSelete(String sql) {
        return onlGraphreportHeadMapper.executeSelete(sql);
    }
}
