
package ${project.group}.config;

import com.quickd.sys.jwt.JwtUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

/**
 * @project: ${project.name}
 * @description: Swagger配置
 * @author: ${project.author}
 * @create: 2019-08-17 14:09
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
            .apiInfo(apiInfo())
            .select()
            //加了ApiOperation注解的类，生成接口文档
            .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
            //包下的类，生成接口文档
            .paths(PathSelectors.any())
            .build()
            .directModelSubstitute(java.util.Date.class, String.class)
            .securitySchemes(security());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
            .title("quickd")
            .description("quickd")
            .termsOfServiceUrl("https://zhatu.dacyun.com")
            .version("1.0.0")
            .build();
    }

    private List<ApiKey> security() {
        return newArrayList(
            new ApiKey(JwtUtil.AUTH_HEADER, JwtUtil.AUTH_HEADER, "header")
        );
    }
}