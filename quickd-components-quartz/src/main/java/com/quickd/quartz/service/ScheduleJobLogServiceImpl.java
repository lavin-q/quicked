
package com.quickd.quartz.service;

import com.quickd.core.job.service.ScheduleJobLogService;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.quartz.dao.ScheduleJobLogMapper;
import com.quickd.core.job.entity.ScheduleJobLogEntity;
import org.springframework.stereotype.Service;

@Service
public class ScheduleJobLogServiceImpl extends BaseServiceImpl<ScheduleJobLogMapper, ScheduleJobLogEntity> implements ScheduleJobLogService {


}