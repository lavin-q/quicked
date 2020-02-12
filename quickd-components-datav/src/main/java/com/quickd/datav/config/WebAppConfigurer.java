package com.quickd.datav.config;



import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import static com.quickd.datav.utils.Utils.dashboardPath;
import static com.quickd.datav.utils.Utils.rootPath;

/**
 * @project: quickd
 * @description: WebAppConfigurer 资源映射路径
 * @author: caochaofeng
 * @create: 2019-10-15 13:28
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/dashboards/**").addResourceLocations("file:"+rootPath+dashboardPath);
    }
}

