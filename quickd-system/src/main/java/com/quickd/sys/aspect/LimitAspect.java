package com.quickd.sys.aspect;

import com.google.common.collect.ImmutableList;
import com.quickd.core.annotation.LimitType;
import com.quickd.core.annotation.RateLimitAno;
import com.quickd.core.exception.BusinessException;
import com.quickd.core.util.HttpContextUtils;
import com.quickd.core.util.IpUtils;
import com.quickd.core.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.data.redis.core.script.RedisScript;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * 接口限流
 * @project: quickd-backend
 * @description: LimitAspect
 * @author: quickd
 * @create: 2019-09-27 16:38
 */
@Aspect
@Component
@Slf4j
public class LimitAspect {
    private final RedisTemplate redisTemplate;

    @Autowired
    public LimitAspect(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }


    @Pointcut("@annotation(com.quickd.core.annotation.RateLimitAno)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method signatureMethod = signature.getMethod();
        RateLimitAno limit = signatureMethod.getAnnotation(RateLimitAno.class);
        LimitType limitType = limit.limitType();
        String key = limit.key();
        if (StringUtil.isEmpty(key)) {
            if (limitType == LimitType.IP) {
                key = IpUtils.getIpAddr(request);
            } else {
                key = signatureMethod.getName();
            }
        }

        ImmutableList keys = ImmutableList.of(StringUtil.join(limit.prefix(), "_", key, "_", request.getRequestURI().replaceAll("/", "_")));

        String luaScript = buildLuaScript();
        RedisScript<Number> redisScript = new DefaultRedisScript<>(luaScript, Number.class);
        Number count = (Number) redisTemplate.execute(redisScript, keys, limit.count(), limit.period());
        if (null != count && count.intValue() <= limit.count()) {
            log.info("第{}次访问key为 {}，描述为 [{}] 的接口", count, keys, limit.name());
            return joinPoint.proceed();
        } else {
            throw new BusinessException("访问次数受限制");
        }
    }

    /**
     * 限流脚本
     */
    private String buildLuaScript() {
        return "local c" +
                "\nc = redis.call('get',KEYS[1])" +
                "\nif c and tonumber(c) > tonumber(ARGV[1]) then" +
                "\nreturn c;" +
                "\nend" +
                "\nc = redis.call('incr',KEYS[1])" +
                "\nif tonumber(c) == 1 then" +
                "\nredis.call('expire',KEYS[1],ARGV[2])" +
                "\nend" +
                "\nreturn c;";
    }
}
