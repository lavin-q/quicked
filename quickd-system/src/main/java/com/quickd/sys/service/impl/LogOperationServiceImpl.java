package com.quickd.sys.service.impl;

import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.core.common.Const;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.core.util.HttpContextUtils;
import com.quickd.core.util.IpUtils;
import com.quickd.sys.dto.LogOperationDto;
import com.quickd.sys.entity.LogOperation;
import com.quickd.sys.mapper.LogOperationMapper;
import com.quickd.sys.service.ILogOperationService;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 操作日志 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Service
public class LogOperationServiceImpl extends BaseServiceImpl<LogOperationMapper, LogOperation> implements ILogOperationService {

    @Override
    public void addLog( String LogContent, String params, long time ) {
        //用户信息
        LogOperation log = new LogOperation();
        log.setStatus(Const.OPERATION_SUCCESS);
        log.setRequestTime((int) time);
        //请求相关信息
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        log.setIp(IpUtils.getIpAddr(request));
        log.setUserAgent(request.getHeader(HttpHeaders.USER_AGENT));
        log.setRequestUri(request.getRequestURI());
        log.setRequestMethod(request.getMethod());
        //请求参数
        log.setRequestParams(params);
        baseMapper.insert(log);
    }
}
