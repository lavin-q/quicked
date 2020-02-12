package com.quickd.sys.service.impl;

import com.quickd.core.common.Const;
import com.quickd.core.service.impl.BaseServiceImpl;
import com.quickd.core.util.HttpContextUtils;
import com.quickd.core.util.IpUtils;
import com.quickd.sys.entity.LogLogin;
import com.quickd.sys.mapper.LogLoginMapper;
import com.quickd.sys.service.ILogLoginService;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 登录日志 服务实现类
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Service
public class LogLoginServiceImpl extends BaseServiceImpl<LogLoginMapper, LogLogin> implements ILogLoginService {

    @Override
    public void addLoginLog(String username, String LogContent, Integer operatetype, Integer status) {

        //用户信息
        LogLogin log = new LogLogin();
        log.setOperation(operatetype);
        //请求的方法名
        //请求的参数
        try {
            //获取request
            HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
            //设置IP地址
            log.setIp(IpUtils.getIpAddr(request));
            log.setUserAgent(request.getHeader(HttpHeaders.USER_AGENT));
        } catch (Exception e) {
            log.setIp("127.0.0.1");
        }
        log.setStatus(Const.OPERATION_SUCCESS);
        log.setCreateBy(username);
        baseMapper.insert(log);
    }
}
