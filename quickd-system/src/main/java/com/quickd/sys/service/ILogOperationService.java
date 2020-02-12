package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.entity.LogOperation;

/**
 * <p>
 * 操作日志 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
public interface ILogOperationService extends BaseService<LogOperation> {


    /**
     * 添加操作日志
     * @param LogContent 操作内容
     * @param param 参数
     * @param time 时长
     */
    void addLog( String LogContent, String param, long time );
}
