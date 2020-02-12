package ${project.group};

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
/**
 * @project: ${project.name}
 * @description: 启动类
 * @author: ${project.author}
 * @create: 2019-08-17 14:09
 */
@SpringBootApplication
@EnableWebSocket
@EnableTransactionManagement
public class Application {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}