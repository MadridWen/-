package cn.edu.hrbu.mall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

// 跨域配置
@Configuration // @Configuration注解表示这是一个配置类, 该类用于定义配置信息
public class CorsConfig {
    // 使用过滤器进行全局跨域配置
    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        // 允许跨域的域名，如果要携带cookie，不能写*。*：代表所有域名都可以跨域访问
        corsConfiguration.addAllowedOrigin("*");
        // 允许的请求方式
        corsConfiguration.addAllowedMethod("*");
        // 允许的头信息
        corsConfiguration.addAllowedHeader("*");
        // 允许暴露的头信息
        corsConfiguration.addExposedHeader("*");
        // 是否发送Cookie信息
        corsConfiguration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", corsConfiguration);
        return new CorsFilter(source);
    }
}
