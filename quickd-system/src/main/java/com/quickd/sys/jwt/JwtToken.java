package com.quickd.sys.jwt;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.shiro.authc.AuthenticationToken;

/**
 * @project: demo
 * @description: ${description}
 * @author: caochaofeng
 * @create: 2019-08-15 10:25
 */
@Data
@NoArgsConstructor
public class JwtToken implements AuthenticationToken {

    /**authz token*/
    private String token;
    /**过期时间*/
    private long expiresInMinutes = JwtUtil.EXPIRE_TIME;


    public JwtToken( String token){
        this.token = token;
    }
    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

}
