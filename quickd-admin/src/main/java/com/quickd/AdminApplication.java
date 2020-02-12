package com.quickd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.socket.config.annotation.EnableWebSocket;


@EnableWebSocket
@SpringBootApplication
@EnableTransactionManagement
public class AdminApplication {
	public static void main(String[] args) {
		SpringApplication.run(AdminApplication.class, args);
	}

}
