package com.quickd.sys.aspect;

import cn.hutool.core.lang.Assert;
import com.quickd.core.annotation.NoRepeatSubmit;
import com.quickd.core.common.Status;
import com.quickd.core.exception.BusinessException;
import com.quickd.core.util.HttpContextUtils;
import com.quickd.sys.jwt.JwtUtil;
import com.quickd.core.util.RedisLock;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * @project: quickd
 * @description: RepeatSubmitAspect 参考地址 https://blog.csdn.net/justlpf/article/details/96423590
 * @NoRepeatSubmit(lockTime = 30)
 * @author: caochaofeng
 * @create: 2019-10-08 22:00
 */
@Aspect
@Component
@Slf4j
public class RepeatSubmitAspect {

    @Autowired
    private RedisLock redisLock;

    @Pointcut("@annotation(noRepeatSubmit)")
    public void pointCut(NoRepeatSubmit noRepeatSubmit) {
    }

    @Around("pointCut(noRepeatSubmit)")
    public Object around(ProceedingJoinPoint pjp, NoRepeatSubmit noRepeatSubmit) throws Throwable {
        int lockSeconds = noRepeatSubmit.lockTime();
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        Assert.notNull(request, "request can not null");

        // 此处可以用token或者JSessionId
        String token = request.getHeader(JwtUtil.AUTH_HEADER);
        String path = request.getServletPath();
        String key = getKey(token, path);
        String clientId = getClientId();

        boolean isSuccess = redisLock.tryLock(key, clientId, lockSeconds);
        log.info("tryLock key = [{}], clientId = [{}]", key, clientId);

        if (isSuccess) {
            log.info("tryLock success, key = [{}], clientId = [{}]", key, clientId);
            // 获取锁成功
            Object result;

            try {
                // 执行进程
                result = pjp.proceed();
            } finally {
                // 解锁
                redisLock.releaseLock(key, clientId);
                log.info("releaseLock success, key = [{}], clientId = [{}]", key, clientId);
            }

            return result;

        } else {
            // 获取锁失败，认为是重复提交的请求
            log.info("tryLock fail, key = [{}]", key);
            return new BusinessException(Status.ACCOUNT_PASSWORD_ERROR.code());
        }

    }

    private String getKey(String token, String path) {
        return token + path;
    }

    private String getClientId() {
        return UUID.randomUUID().toString();
    }
}
