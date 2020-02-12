package com.quickd.web.controller.login;

import com.quickd.core.common.Const;
import com.quickd.core.common.JsonResult;
import com.quickd.core.common.Status;
import com.quickd.core.exception.BusinessException;
import com.quickd.sys.service.ILogLoginService;
import com.quickd.core.util.Base64Util;
import com.quickd.core.util.RedisUtil;
import com.quickd.sys.jwt.JwtToken;
import com.quickd.sys.jwt.JwtUtil;
import com.quickd.sys.dto.LoginDto;
import com.quickd.sys.entity.User;
import com.quickd.sys.service.IUserService;
import com.quickd.core.util.Encryptor;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @project: ${project.name}
 * @description: 用户登录管理
 * @author: ${project.author}
 * @create: 2019-08-17 14:09
 */
@Api(value = "用户登录管理", tags = "用户登录管理")
@RestController
@Slf4j
public class LoginController {
    @Autowired
    private IUserService userService;
    @Autowired
    private ILogLoginService loginService;

    @Autowired
    private RedisUtil redisUtil;
    @PostMapping("login")
    @ApiOperation(value = "登录", tags = "登录")
    public JsonResult login(@RequestBody LoginDto login) throws Exception {
        String username = Base64Util.decodeNTimes(login.getUsername(),3);
        String password = Base64Util.decodeNTimes(login.getPassword(),3);
        // 校验用户名密码是否一致
        User user = userService.getUserByUsername(username);
        //用户不存在
        if (user == null) {
            throw new BusinessException(Status.ACCOUNT_PASSWORD_ERROR.code());
        }
        // 校验
        if (user.getPassword().equals(Encryptor.encryptPassword(password, user.getSalt()))) {
            // 非正常用户
            if (user.getStatus() == 0) {
                // 停用账号
                throw new LockedAccountException("账号: " + username + " 已被锁定！");
            }
            log.debug("用户[" + username + "]登录认证通过！");
        } else {
            // 验证失败，返回登录页
            throw new BusinessException(Status.ACCOUNT_PASSWORD_ERROR.code());
        }


        // 生成认证token
        JwtToken authToken = new JwtToken(JwtUtil.generateToken(username, user.getPassword()));
        //获取当前的Subject
        Subject subject = SecurityUtils.getSubject();
        String errorMsg = null;
        try {
            subject.login(authToken);
            //验证是否登录成功
            if (subject.isAuthenticated()) {
                log.debug("用户[" + username + "]申请token成功！authtoken=" + authToken.getCredentials());
                String token = (String) authToken.getCredentials();
                // 跳转到首页
                Map<String, Object> map = new HashMap<>(2);
                map.put(JwtUtil.AUTH_HEADER, token);
                map.put("username", user.getUsername());
                map.put("id", user.getId());
                map.put("name", user.getRealName());
                map.put("expire", authToken.getExpiresInMinutes());
                redisUtil.set(Const.PREFIX_USER_TOKEN + token, token);
                //设置超时时间
                redisUtil.expire(Const.PREFIX_USER_TOKEN + token, JwtUtil.EXPIRE_TIME);

                loginService.addLoginLog(user.getUsername(),
                        "用户名: "+user.getRealName()+",登录成功！", Const.LOGIN_OPERATION_LOGIN,Const.OPERATION_SUCCESS);
                return new JsonResult().ok(map);
            }
        } catch (UnknownAccountException uae) {
            errorMsg = "用户[" + username + "]登录验证失败: 未知账户!";
            log.warn("用户[" + username + "]登录验证失败: 未知账户!", uae);

        } catch (IncorrectCredentialsException ice) {
            errorMsg = "用户[" + username + "]登录验证失败: 错误的用户名密码!";
            log.warn("用户[" + username + "]登录验证失败: 错误的用户名密码!", ice);
        } catch (LockedAccountException lae) {
            errorMsg = "用户[" + username + "]登录验证失败: 账号已锁定!";
            log.warn("用户[" + username + "]登录验证失败: 账号已锁定!", lae);
        } catch (ExcessiveAttemptsException eae) {
            errorMsg = "用户[" + username + "]登录验证失败: 失败尝试次数过多!";
            log.warn("用户[" + username + "]登录验证失败: 失败尝试次数过多!", eae);
        } catch (AuthenticationException ae) {
            errorMsg = "用户[" + username + "]登录验证失败: 错误的用户名密码!";
            log.warn("用户[" + username + "]登录验证失败: 错误的用户名密码!", ae);
        }
        // 验证失败，添加日志
        loginService.addLoginLog(user.getUsername(),
                errorMsg, Const.LOGIN_OPERATION_LOGIN,Const.OPERATION_FAIL);
        return new JsonResult().error(Status.FAIL_INVALID_TOKEN.code(), errorMsg);
    }


    /**
     * 退出
     * @param request
     * @param response
     * @return
     */
    @ApiOperation(value = "退出", tags = "主页")
    @PostMapping("/logout")
    public JsonResult logout(HttpServletRequest request, HttpServletResponse response){
        //用户退出逻辑
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        User sysUser = (User)subject.getPrincipal();
        String token = request.getHeader(JwtUtil.AUTH_HEADER);
        //清空用户Token缓存
        redisUtil.del(Const.PREFIX_USER_TOKEN + token);
//        //清空用户权限缓存：权限Perms和角色集合
//        redisUtil.del(Const.LOGIN_USER_CACHERULES_ROLE + sysUser.getUsername());
//        redisUtil.del(Const.LOGIN_USER_CACHERULES_PERMISSION + sysUser.getUsername());
        loginService.addLoginLog(sysUser.getUsername(),
                "用户名: "+sysUser.getRealName()+",退出成功！", Const.LOGIN_OPERATION_LOGOUT,Const.OPERATION_SUCCESS);
        return new JsonResult().ok("退出成功!");
    }
}
