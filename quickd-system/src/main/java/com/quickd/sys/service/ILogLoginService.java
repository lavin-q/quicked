package com.quickd.sys.service;

import com.quickd.core.service.BaseService;
import com.quickd.sys.dto.LogLoginDto;
import com.quickd.sys.entity.LogLogin;

/**
 * <p>
 * 登录日志 服务类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
public interface ILogLoginService extends BaseService<LogLogin> {


    /**
     * 登录日志
     * @param username 账号
     * @param LogContent 操作内容
     * @param operatetype 操作类型
     * @param status 状态  0：失败    1：成功    2：账号已锁定
     */
    void addLoginLog(String username, String LogContent, Integer operatetype, Integer status);
}
