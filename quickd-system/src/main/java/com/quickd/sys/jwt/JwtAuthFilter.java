package com.quickd.sys.jwt;

import com.alibaba.fastjson.JSON;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.quickd.core.common.JsonResult;
import com.quickd.core.common.Status;
import com.quickd.core.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @project: demo
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-14 09:48
 */
@Slf4j
public class JwtAuthFilter extends BasicHttpAuthenticationFilter {

    /**
     * Shiro权限拦截核心方法 返回true允许访问，这里使用JWT进行认证
     *
     * @param request
     * @param response
     * @param mappedValue
     * @return
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {


        // 判断用户是否想要登入
        if (this.isLoginAttempt(request, response)) {
            try {
                // 进行Shiro的登录UserRealm
                this.executeLogin(request, response);
            } catch (Exception e) {
                // 认证出现异常，传递错误信息msg
                String msg = e.getMessage();
                // 获取应用异常(该Cause是导致抛出此throwable(异常)的throwable(异常))
                Throwable throwable = e.getCause();
                if (throwable != null && throwable instanceof SignatureVerificationException) {
                    // 该异常为JWT的AccessToken认证失败(Token或者密钥不正确)
                    msg = "token或者密钥不正确(" + throwable.getMessage() + ")";
                } else if (throwable != null && throwable instanceof TokenExpiredException) {
                    // 该异常为JWT的AccessToken已过期，判断RefreshToken未过期就进行AccessToken刷新
                    msg = "token已过期(" + throwable.getMessage() + ")";
                } else {
                    // 应用异常不为空
                    if (throwable != null) {
                        // 获取应用异常msg
                        msg = throwable.getMessage();
                    }
                }
                /**
                 * 错误两种处理方式 1. 将非法请求转发到/401的Controller处理，抛出自定义无权访问异常被全局捕捉再返回Response信息 2.
                 * 无需转发，直接返回Response信息 一般使用第二种(更方便)
                 */
                // 直接返回Response信息
                this.response401(request, response, msg);
                return false;
            }
        } else {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            String jwtToken = JwtUtil.getRequestToken(httpRequest);
            if (StringUtils.isBlank(jwtToken)) {
                log.warn("Token为空！url=" + httpRequest.getRequestURL());
                return false;
            }
            //获取username
            String username = JwtUtil.getUserNameByToken(jwtToken);
            if (StringUtils.isNotBlank(username)) {
                log.debug("Token 认证成功!username=" + username);
                return true;
            }
            log.debug("Token 认证失败！");
            return false;
        }
        return true;


    }

    /**
     * 检测Header里面是否包含Authorization字段，有就进行Token登录认证授权
     */
    @Override
    protected boolean isLoginAttempt(ServletRequest request, ServletResponse response) {
        // 拿到当前Header中Authorization的AccessToken(Shiro中getAuthzHeader方法已经实现)
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String token = JwtUtil.getRequestToken(httpRequest);
        return token != null;
    }


    /**
     * 进行AccessToken登录认证授权
     */
    @Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String token = JwtUtil.getRequestToken(httpRequest);
        if (StringUtils.isBlank(token)) {
            log.warn("Token为空！url=" + httpRequest.getRequestURL());
            return false;
        }
        JwtToken jwtToken = new JwtToken(token);
        // 提交给realm进行登入，如果错误他会抛出异常并被捕获
        getSubject(request, response).login(jwtToken);
        // 如果没有抛出异常则代表登入成功，返回true
        return true;
    }


    /**
     * 当访问拒绝时是否已经处理了；如果返回true表示需要继续处理；如果返回false表示该拦截器实例已经处理
     *
     * @param
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        log.debug("Token认证： onAccessDenied");
        JsonResult jsonResult = new JsonResult().error(Status.FAIL_INVALID_TOKEN.code());
        this.responseJson((HttpServletResponse) response, jsonResult);
        return false;
    }

    /***
     * 返回json格式错误信息
     * @param response
     * @param jsonResult
     */
    protected void responseJson(HttpServletResponse response, JsonResult jsonResult) {
        // 处理异步请求
        PrintWriter pw = null;
        try {
            response.setStatus(HttpStatus.OK.value());
            response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
            pw = response.getWriter();
            pw.write(JSON.toJSONString(jsonResult));
            pw.flush();
        } catch (IOException e) {
            log.error("处理异步请求异常", e);
        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }


    /**
     * 无需转发，直接返回Response信息
     */
    private void response401(ServletRequest req, ServletResponse resp, String msg) {
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
        httpServletResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json; charset=utf-8");
        PrintWriter out = null;
        try {
            out = httpServletResponse.getWriter();
            JsonResult jsonResult = new JsonResult().error(Status.FAIL_INVALID_TOKEN.code());
            String data = JSON.toJSONString(jsonResult);
            out.append(data);
        } catch (IOException e) {
            log.error("直接返回Response信息出现IOException异常:" + e.getMessage());
            throw new BusinessException("直接返回Response信息出现IOException异常:" + e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    /**
     * 对跨域提供支持
     */
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Access-control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers",
                httpServletRequest.getHeader("Access-Control-Request-Headers"));
        // 跨域时会首先发送一个OPTIONS请求，这里我们给OPTIONS请求直接返回正常状态
        if (httpServletRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            httpServletResponse.setStatus(HttpStatus.OK.value());
            return false;
        }
        return super.preHandle(request, response);
    }


}
