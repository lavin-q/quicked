package com.quickd.sys.jwt;

import com.quickd.core.common.Const;
import com.quickd.core.util.RedisUtil;
import com.quickd.sys.dto.UserDto;
import com.quickd.sys.entity.User;
import com.quickd.sys.service.IMenuService;
import com.quickd.sys.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * @project: demo
 * @description: 用户登录鉴权和获取用户授权
 * @author: caochaofeng
 * @create: 2019-08-14 16:08
 */
@Component
@Slf4j
public class JwtRealm extends AuthorizingRealm {

    @Autowired
    private IUserService userService;

    @Autowired
    private IMenuService menuService;

    @Autowired
    @Lazy
    private RedisUtil redisUtil;

    @Override
    public Class<?> getAuthenticationTokenClass() {
        return JwtToken.class;
    }
    /**
     * 用来进行身份认证，也就是说验证用户输入的账号和密码是否正确，获取身份验证信息，错误抛出异常(登录时调用)
     *
     * @param authenticationToken 用户身份信息 token
     * @return 返回封装了用户信息的 AuthenticationInfo 实例
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        log.debug("————身份认证————");
        String token = (String) authenticationToken.getCredentials();
        UserDto loginUser = this.checkUserTokenIsEffect(token);
        return new SimpleAuthenticationInfo(loginUser, token, this.getName());
    }


    /**
     * 授权(验证权限时调用) 获取用户权限信息，包括角色以及权限。只有当触发检测用户权限时才会调用此方法，例如checkRole,checkPermission
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        UserDto user = (UserDto)  principalCollection.getPrimaryPrincipal();
        // 整理所有权限许可列表
        Set<String> permissions =  menuService.getUserPermissionsList(user);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        // 将权限许可授权给用户比如“sys:role:add,sys:user:add”
        info.setStringPermissions(permissions);
        return info;
    }

    /**
     * 校验token的有效性
     *
     * @param token
     */
    public UserDto checkUserTokenIsEffect(String token) throws AuthenticationException {
        // 解密获得username，用于和数据库进行对比
        String username = JwtUtil.getUserNameByToken(token);
        if (username == null) {
            throw new AuthenticationException("token非法无效!");
        }

        // 查询用户信息
        UserDto loginUser = new UserDto();
        User sysUser = userService.getUserByUsername(username);
        if (sysUser == null) {
            throw new AuthenticationException("用户不存在!");
        }

        // 校验token是否超时失效 & 或者账号密码是否错误
        if (!jwtTokenRefresh(token, username, sysUser.getPassword())) {
            throw new AuthenticationException("Token失效，请重新登录!");
        }

        // 判断用户状态
        if (sysUser.getStatus() != 1) {
            throw new AuthenticationException("账号已被锁定,请联系管理员!");
        }
        BeanUtils.copyProperties(sysUser, loginUser);
        return loginUser;
    }

    /**
     * JWTToken刷新生命周期 （解决用户一直在线操作，提供Token失效问题）
     * 1、登录成功后将用户的JWT生成的Token作为k、v存储到cache缓存里面(这时候k、v值一样)
     * 2、当该用户再次请求时，通过JWTFilter层层校验之后会进入到doGetAuthenticationInfo进行身份验证
     * 3、当该用户这次请求JWTToken值还在生命周期内，则会通过重新PUT的方式k、v都为Token值，缓存中的token值生命周期时间重新计算(这时候k、v值一样)
     * 4、当该用户这次请求jwt生成的token值已经超时，但该token对应cache中的k还是存在，则表示该用户一直在操作只是JWT的token失效了，程序会给token对应的k映射的v值重新生成JWTToken并覆盖v值，该缓存生命周期重新计算
     * 5、当该用户这次请求jwt在生成的token值已经超时，并在cache中不存在对应的k，则表示该用户账户空闲超时，返回用户信息已失效，请重新登录。
     * 6、每次当返回为true情况下，都会给Response的Header中设置Authorization，该Authorization映射的v为cache对应的v值。
     * 7、注：当前端接收到Response的Header中的Authorization值会存储起来，作为以后请求token使用
     * 参考方案：https://blog.csdn.net/qq394829044/article/details/82763936
     *
     * @param userName
     * @param passWord
     * @return
     */
    public boolean jwtTokenRefresh(String token, String userName, String passWord) {
        String cacheToken = String.valueOf(redisUtil.get(Const.PREFIX_USER_TOKEN + token));
        if (StringUtils.isNotEmpty(cacheToken)) {
            // 校验token有效性
            if (!JwtUtil.verify(token, userName, passWord)) {
                String newAuthorization = JwtUtil.generateToken(userName, passWord);
                redisUtil.set(Const.PREFIX_USER_TOKEN + token, newAuthorization);
                // 设置超时时间
                redisUtil.expire(Const.PREFIX_USER_TOKEN + token, JwtUtil.EXPIRE_TIME);
            } else {
                redisUtil.set(Const.PREFIX_USER_TOKEN + token, cacheToken);
                // 设置超时时间
                redisUtil.expire(Const.PREFIX_USER_TOKEN + token, JwtUtil.EXPIRE_TIME );
            }
            return true;
        }
        return false;
    }

}
