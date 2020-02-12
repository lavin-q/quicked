package ${project.group}.web.config;

import com.quickd.sys.jwt.JwtAuthFilter;
import com.quickd.sys.jwt.JwtRealm;
import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.mgt.DefaultSubjectDAO;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.AnonymousFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * @project: ${project.name}
 * @description: Shiro的配置文件, 他就三个方法，1：securityManager 2：shiroFilter 3:自定义realm
 * @author: ${project.author}
 * @create: 2019-08-17 14:09
 */
@Configuration
public class ShiroConfig {



    @Bean
    public Realm realm() {
        JwtRealm realm = new JwtRealm();
        return realm;
    }

    @Bean
    public DefaultWebSecurityManager  securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(realm());
        /*
         * 关闭shiro自带的session，详情见文档
         * http://shiro.apache.org/session-management.html#SessionManagement-
         * StatelessApplications%28Sessionless%29
         */
        DefaultSubjectDAO subjectDAO = new DefaultSubjectDAO();
        DefaultSessionStorageEvaluator defaultSessionStorageEvaluator = new DefaultSessionStorageEvaluator();
        defaultSessionStorageEvaluator.setSessionStorageEnabled(false);
        subjectDAO.setSessionStorageEvaluator(defaultSessionStorageEvaluator);
        securityManager.setSubjectDAO(subjectDAO);
        return securityManager;
    }


    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager  securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //考虑用LinkedHashMap不用Hashmap原因是 LinkedHashMap的遍历速度只和实际数据有关，和容量无关，而HashMap的遍历速度和他的容量有关
        HashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        // authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问
        // 设置过滤器
        Map<String, Filter> filters = new LinkedHashMap<>();
        filters.put("jwtFilter", new JwtAuthFilter());
        filters.put("anon", new AnonymousFilter());
        shiroFilterFactoryBean.setFilters(filters);
        filterChainDefinitionMap.put("/", "anon");
        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/webjars/**", "anon");
        filterChainDefinitionMap.put("/druid/**", "anon");
        filterChainDefinitionMap.put("/public/**", "anon");
        filterChainDefinitionMap.put("/gen/project/**", "anon");
        filterChainDefinitionMap.put("/webSocket/**", "anon");
        filterChainDefinitionMap.put("/swagger/**", "anon");
        filterChainDefinitionMap.put("/v2/api-docs", "anon");
        filterChainDefinitionMap.put("/swagger-ui.html", "anon");
        filterChainDefinitionMap.put("/swagger-resources/**", "anon");
        filterChainDefinitionMap.put("/service/**", "anon");
        filterChainDefinitionMap.put("/editor-app/**", "anon");
        filterChainDefinitionMap.put("/diagram-viewer/**", "anon");
        filterChainDefinitionMap.put("/modeler.html", "anon");
        filterChainDefinitionMap.put("/captcha", "anon");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/**/*.css", "anon");
        filterChainDefinitionMap.put("/**/*.js", "anon");
        filterChainDefinitionMap.put("/**/*.html", "anon");
        filterChainDefinitionMap.put("/**/*.png", "anon");
        filterChainDefinitionMap.put("/**/*.jpg", "anon");
        filterChainDefinitionMap.put("/**", "jwtFilter");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);

        return shiroFilterFactoryBean;
    }

    @Bean("jwtAuthFilter")
    public JwtAuthFilter jwtAuthFilter() {
        return new JwtAuthFilter();
    }
    /**
     * 下面的代码是添加注解支持
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        // 强制使用cglib，防止重复代理和可能引起代理出错的问题，https://zhuanlan.zhihu.com/p/29161098
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(
            SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(securityManager);
        return advisor;
    }
}
