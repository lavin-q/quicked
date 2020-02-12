package com.quickd.core.xss;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @project: jeedcp
 * @description: xss和sql防止注入
 * @author: caochaofeng
 * @create: 2019-08-15 16:12
 */
@WebFilter
@Slf4j
public class XssAndSqlFilter  implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        if(response instanceof HttpServletResponse){
            HttpServletResponse httpServletResponse=(HttpServletResponse)response;
            httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
            httpServletResponse.setHeader("Access-Control-Allow-Methods", "*");
            httpServletResponse.setHeader("Access-Control-Max-Age", "86400");
            httpServletResponse.setHeader("Access-Control-Allow-Headers", "*");
        }
        //sql,xss过滤
        HttpServletRequest httpServletRequest=(HttpServletRequest)request;
        log.info("CrosXssFilter.......orignal url:{},ParameterMap:{}",httpServletRequest.getRequestURI(), JSONObject.toJSONString(httpServletRequest.getParameterMap()));
        XssAndSqlHttpServletRequestWrapper xssHttpServletRequestWrapper=new XssAndSqlHttpServletRequestWrapper(
                httpServletRequest);
        filterChain.doFilter(xssHttpServletRequestWrapper, response);
        log.info("CrosXssFilter..........doFilter url:{},ParameterMap:{}",xssHttpServletRequestWrapper.getRequestURI(), JSONObject.toJSONString(xssHttpServletRequestWrapper.getParameterMap()));

    }

    @Override
    public void destroy() {

    }
}
