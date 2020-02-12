package com.quickd.online.graphreport.service.impl;


import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.online.graphreport.entity.OnlGraphreportItem;
import com.quickd.online.graphreport.mapper.OnlGraphreportItemMapper;
import com.quickd.online.graphreport.service.IOnlGraphreportItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OnlGraphreportItemServiceImpl extends BaseServiceImpl<OnlGraphreportItemMapper, OnlGraphreportItem> implements IOnlGraphreportItemService {

    @Autowired
    private OnlGraphreportItemMapper onlGraphreportItemMapper;

    @Override
    public List<OnlGraphreportItem> selectByMainId(String mainId) {
       return onlGraphreportItemMapper.selectByMainId(mainId);
    }
}