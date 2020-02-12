package com.quickd.sys.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.quickd.sys.dto.UserDto;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

/**
 * @project: demo
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-14 10:31JwtToken
 */
@Slf4j
public class JwtUtil {
    public static final String AUTH_HEADER = "token";
    private static final String TOKEN_PREFIX = "Jeedcp ";
    public static final String SIGN_KEY = "JEEDCP2019CCF";
    private static final String ISSUER =  "jeedcp.com";


    // 默认过期时间 2小时
    public static final int EXPIRE_TIME =  2 * 60 * 60 ;

    /***
     * 从请求头中获取客户端发来的token
     * @param request
     * @return
     */
    public static String getRequestToken(HttpServletRequest request) {
        String authHeader = request.getHeader(AUTH_HEADER);
        if(authHeader != null){
            if(authHeader.startsWith(TOKEN_PREFIX)){
                return authHeader.substring(7);
            }
            return authHeader.trim();
        }
        return null;
    }

    /**
     * 从token中获取用户账号信息
     * @param token
     * @return
     */
    public  static  String getUserNameByToken(String token){
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("username").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 获取token
     * @param token
     * @return
     */
    private static Claims getClaimsFromToken(String token) {
        Claims claims;
        try {
            claims = Jwts.parser()
                    .setSigningKey(SIGN_KEY)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            claims = null;
        }
        return claims;
    }


    /***
     * 请求头的token是否处于有效期限内
     */
    public static boolean isTokenExpire(HttpServletRequest request){
        String authToken = getRequestToken(request);
        if(StringUtils.isNotEmpty(authToken)){
            String username = getUserNameByToken(authToken);
            //过期
            return StringUtils.isEmpty(username);
        }
        //未过期
        return false;
    }




    /**
     * 生成签名,5min后过期
     *
     * @param username 用户名
     * @param secret   用户的密码
     * @return 加密的token
     */
    public static String generateToken(String username, String secret)  {
        Date currentTime = generateCurrentDate();
        Date expiration = generateExpirationDate(currentTime, EXPIRE_TIME);
        Algorithm algorithm = null;
        try {
            algorithm = Algorithm.HMAC256(secret);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 附带username信息
        return JWT.create()
                .withClaim("username", username)
                .withExpiresAt(expiration)
                .sign(algorithm);

    }


    /***
     * 生成当前时间戳
     * @return
     */
    public static Date generateCurrentDate() {
        return new Date(System.currentTimeMillis());
    }

    /***
     * 生成过期时间戳
     * @return
     */
    public static Date generateExpirationDate(Date currentTime, long expiresTime) {
        return new Date(currentTime.getTime() + (expiresTime*1000));
    }

    /**
     * 校验token是否正确
     *
     * @param token  密钥
     * @param secret 用户的密码
     * @return 是否正确
     */
    public static boolean verify(String token, String username, String secret) {
        try {
            //根据密码生成JWT效验器
            Algorithm algorithm = Algorithm.HMAC256(secret);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("username", username)
                    .build();
            //效验TOKEN
             verifier.verify(token);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }



    /**
     * 创建盐：32位的uuid
     * @return
     */
    public static String genSalt() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }



    /**
     * 得到当前登录的用户名
     * @return
     */
    public static UserDto getCurrentUser(){
        try{
            Subject subject = SecurityUtils.getSubject();
            if(subject != null && subject.isAuthenticated()){
                return (UserDto)subject.getPrincipal();
            }
        }
        catch (Exception e){
            log.warn("获取用户信息异常", e);
        }
        return null;
    }

    /**
     * 得到当前登录的用户id
     * @return
     */
    public static String getCurrentUserId(){
        UserDto user = getCurrentUser();
        if(user != null){
            return user.getId();
        }
        if(log.isDebugEnabled()){
            log.warn("无法获取当前用户Id!");
        }
        return null;
    }

}
