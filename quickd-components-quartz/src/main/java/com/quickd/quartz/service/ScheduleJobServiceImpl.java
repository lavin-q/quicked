
package com.quickd.quartz.service;

import org.quartz.Scheduler;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ScheduleJobServiceImpl  {

	//extends BaseServiceImpl<ScheduleJobMapper, ScheduleJobEntity> implements ScheduleJobService
	@Resource
	private Scheduler scheduler;



	/*@Override
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
    }*/
    
}