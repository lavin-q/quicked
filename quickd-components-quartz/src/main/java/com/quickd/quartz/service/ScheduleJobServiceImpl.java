
package com.quickd.quartz.service;

import com.quickd.core.enums.ScheduleEnum;
import com.quickd.core.job.entity.ScheduleJobEntity;
import com.quickd.core.job.service.ScheduleJobService;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.quartz.dao.ScheduleJobMapper;
import com.quickd.quartz.utils.ScheduleUtils;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ScheduleJobServiceImpl extends BaseServiceImpl<ScheduleJobMapper, ScheduleJobEntity> implements ScheduleJobService {
	@Autowired
	private Scheduler scheduler;

	@Override
	@Transactional
    public void updateBatch(String[] ids, int status){
    	Map<String, Object> map = new HashMap<>(2);
    	map.put("ids", ids);
    	map.put("status", status);
		for(String id : ids){
			ScheduleJobEntity scheduleJobEntity = new ScheduleJobEntity();
			scheduleJobEntity.setId(id);
			scheduleJobEntity.setStatus(status);
			baseMapper.updateById(scheduleJobEntity);
		}
    }
    
	@Override
	@Transactional(rollbackFor = Exception.class)
    public void run(String[] ids) {
    	for(String id : ids){
    		ScheduleUtils.run(scheduler, baseMapper.selectById(id));
    	}
    }

	@Override
	@Transactional(rollbackFor = Exception.class)
    public void pause(String[] ids) {
        for(String id : ids){
    		ScheduleUtils.pauseJob(scheduler, id);
    	}
        
    	updateBatch(ids, ScheduleEnum.PAUSE.getValue());
    }

	@Override
	@Transactional(rollbackFor = Exception.class)
    public void resume(String[] ids) {
    	for(String id : ids){
    		ScheduleUtils.resumeJob(scheduler, id);
    	}
    	updateBatch(ids, ScheduleEnum.NORMAL.getValue());
    }
    
}