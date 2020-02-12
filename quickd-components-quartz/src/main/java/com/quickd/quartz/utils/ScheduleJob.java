

package com.quickd.quartz.utils;

import com.baomidou.mybatisplus.core.toolkit.ExceptionUtils;
import com.quickd.core.common.Const;
import com.quickd.core.job.service.ScheduleJobLogService;
import com.quickd.core.util.SpringContextUtil;
import com.quickd.core.job.entity.ScheduleJobEntity;
import com.quickd.core.job.entity.ScheduleJobLogEntity;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.lang.reflect.Method;
import java.util.Date;


/**
 * 定时任务
 *
 */
public class ScheduleJob extends QuartzJobBean {
	private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    protected void executeInternal(JobExecutionContext context) {
        ScheduleJobEntity scheduleJob = (ScheduleJobEntity) context.getMergedJobDataMap().
				get(ScheduleUtils.JOB_PARAM_KEY);

        //数据库保存执行记录
        ScheduleJobLogEntity log = new ScheduleJobLogEntity();
        log.setJobId(scheduleJob.getId());
        log.setBeanName(scheduleJob.getBeanName());
        log.setParams(scheduleJob.getParams());
		log.setCreateTime(new Date());

        //任务开始时间
        long startTime = System.currentTimeMillis();
        
        try {
			//执行任务
			logger.info("任务准备执行，任务ID：{}", scheduleJob.getId());
			Object target = SpringContextUtil.getBean(scheduleJob.getBeanName());
			Method method = target.getClass().getDeclaredMethod("run", String.class);
			method.invoke(target, scheduleJob.getParams());

			//任务执行总时长
			long times = System.currentTimeMillis() - startTime;
			log.setTimes((int)times);
			//任务状态
			log.setStatus(Const.OPERATION_SUCCESS);
			
			logger.info("任务执行完毕，任务ID：{}  总共耗时：{} 毫秒", scheduleJob.getId(), times);
		} catch (Exception e) {
			logger.error("任务执行失败，任务ID：{}", scheduleJob.getId(), e);
			
			//任务执行总时长
			long times = System.currentTimeMillis() - startTime;
			log.setTimes((int)times);
			
			//任务状态
			log.setStatus(Const.OPERATION_FAIL);
			log.setError(ExceptionUtils.mpe(e).getMessage());
			log.setCreateTime(new Date());
			log.setDelFlag(Const.DEL_FLAG_0);
			log.setVersion(Const.VERSION);
			log.setCreateBy("scheduleJob");
		}finally {
			//获取spring bean
			ScheduleJobLogService scheduleJobLogService = SpringContextUtil.getBean(ScheduleJobLogService.class);
			scheduleJobLogService.save(log);
		}
    }
}