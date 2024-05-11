package cn.edu.hrbu.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class}) // 启动类注解，排除Spring Security自动配置
@MapperScan({"cn.edu.hrbu.mall.mapper", "cn.edu.hrbu.mall.ums.mapper", "cn.edu.hrbu.mall.pms.mapper","cn.edu.hrbu.mall.oms.mapper" , "cn.edu.hrbu.mall.sms.mapper"}) // 扫描Mapper接口
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args); // 启动SpringBoot应用
    }
}
