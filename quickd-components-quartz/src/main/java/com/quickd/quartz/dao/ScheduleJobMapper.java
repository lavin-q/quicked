
package com.quickd.quartz.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.quickd.core.job.entity.ScheduleJobEntity;
import org.apache.ibatis.annotations.Mapper;


/**
 * 定时任务
 */
@Mapper
public interface ScheduleJobMapper extends BaseMapper<ScheduleJobEntity> {

}
