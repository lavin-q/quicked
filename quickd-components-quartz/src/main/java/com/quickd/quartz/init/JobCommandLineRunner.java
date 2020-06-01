

package com.quickd.quartz.init;

import com.quickd.quartz.dao.ScheduleJobMapper;
import org.quartz.Scheduler;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 初始化定时任务数据
 *
 * @author Mark sunlightcs@gmail.com
 */
@Component
public class JobCommandLineRunner implements CommandLineRunner {
    @Resource
    private Scheduler scheduler;
    @Resource
    private ScheduleJobMapper scheduleJobMapper;

    @Override
    public void run(String... args) throws Exception {

    }

    /*@Override
    public void run(String... args) {
        List<ScheduleJobEntity> scheduleJobList = scheduleJobMapper.selectList(null);
        for(ScheduleJobEntity scheduleJob : scheduleJobList){
            CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(scheduler, scheduleJob.getId());
            //如果不存在，则创建
            if(cronTrigger == null) {
                ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
            }else {
                ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
            }
        }
    }*/
}