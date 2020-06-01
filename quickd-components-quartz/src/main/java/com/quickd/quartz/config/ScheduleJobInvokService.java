package com.quickd.quartz.config;

import org.springframework.context.annotation.Configuration;

/**
 * @project: quickd-backend
 * @description: ScheduleJobInvokService
 * @author: caochaofeng
 * @create: 2019-09-27 07:04
 */
@Configuration
public class ScheduleJobInvokService {

   /* @Autowired
    private ScheduleJobService scheduleJobService;

    @Autowired
    private ScheduleJobLogService scheduleJobLogService;

    *//**
     * 发布调度服务
     *
     * @return
     *//*
    @Bean("/scheduleJobService")
    public HessianServiceExporter scheduleJobService() {
        HessianServiceExporter exporter = new HessianServiceExporter();
        exporter.setService(scheduleJobService);
        exporter.setServiceInterface(ScheduleJobService.class);
        return exporter;
    }

    *//**
     * 发布调度服务日志管理
     *
     * @return
     *//*
    @Bean("/scheduleJobLogService")
    public HessianServiceExporter scheduleJobLogService() {
        HessianServiceExporter exporter = new HessianServiceExporter();
        exporter.setService(scheduleJobLogService);
        exporter.setServiceInterface(ScheduleJobLogService.class);
        return exporter;
    }*/
}