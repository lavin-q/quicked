package com.quickd.web.config;

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
 * @project: demo
 * @description: Shiro的配置文件, 他就三个方法，1：securityManager 2：shiroFilter 3:自定义realm
 * @author: quikcd
 * @create: 2019-08-14 09:30
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
        //websocket
        filterChainDefinitionMap.put("/websocket/**", "anon");
        filterChainDefinitionMap.put("/webSocketApi/**", "anon");
        filterChainDefinitionMap.put("/public/**", "anon");
        filterChainDefinitionMap.put("/gen/project/**", "anon");
        filterChainDefinitionMap.put("/swagger/**", "anon");
        filterChainDefinitionMap.put("/v2/api-docs", "anon");
        filterChainDefinitionMap.put("/swagger-ui.html", "anon");
        filterChainDefinitionMap.put("/swagger-resources/**", "anon");
        filterChainDefinitionMap.put("/editor-app/**", "anon");
        filterChainDefinitionMap.put("/diagram-viewer/**", "anon");
        filterChainDefinitionMap.put("/modeler.html", "anon");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/**/*.css", "anon");
        filterChainDefinitionMap.put("/**/*.js", "anon");
        filterChainDefinitionMap.put("/**/*.html", "anon");
        filterChainDefinitionMap.put("/**/*.png", "anon");

        filterChainDefinitionMap.put("/**/*.ico", "anon");
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
     * 开启Shiro的注解(如@RequiresRoles,@RequiresPermissions)
     * 配置以下两个bean(DefaultAdvisorAutoProxyCreator和AuthorizationAttributeSourceAdvisor)即可实现此功能
     * @return
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator(){
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;
    }
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}
