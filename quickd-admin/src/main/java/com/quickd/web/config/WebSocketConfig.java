package com.quickd.web.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @project: quickd-backend
 * @description: WebSocketConfig
 * @author: quickd
 * @create: 2019-09-26 10:00
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig {
    /**
     *     注入ServerEndpointExporter，
     *     这个bean会自动注册使用了@ServerEndpoint注解声明的Websocket endpoint
     */
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}
