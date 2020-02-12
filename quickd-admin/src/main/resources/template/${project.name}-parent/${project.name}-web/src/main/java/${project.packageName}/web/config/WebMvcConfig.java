package ${project.group}.web.config;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.quickd.core.util.DateUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.ResourceHttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

/**
 * @project: ${project.name}
 * @description: MVC服务配置
 * @author: ${project.author}
 * @create: 2019-08-15 15:41
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * 对于前后端分离的项目，一般都需要跨域访问.添加支持CORS跨域访问
     *
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .maxAge(3600);
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new ByteArrayHttpMessageConverter());
        converters.add(new StringHttpMessageConverter());
        converters.add(new ResourceHttpMessageConverter());
        converters.add(new AllEncompassingFormHttpMessageConverter());
        converters.add(new StringHttpMessageConverter());
        converters.add(fastJsonHttpMessageConverters());
    }

    /**
     * JSON转换组件替换为fastJson
     */
    @Bean
    public HttpMessageConverter fastJsonHttpMessageConverters() {
        FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
        //处理中文乱码问题
        List<MediaType> fastMediaTypes = new ArrayList<>();
        fastMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
        converter.setSupportedMediaTypes(fastMediaTypes);
        // 配置转换格式
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
        fastJsonConfig.setDateFormat(DateUtil.DATE_TIME_PATTERN);
        converter.setFastJsonConfig(fastJsonConfig);
        HttpMessageConverter<?> httpMsgConverter = converter;
        return httpMsgConverter;
    }

}
