package cn.edu.hrbu.mall.config;

import cn.edu.hrbu.mall.intercepter.GlobalAuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class HandlerInterceptorConfig {
    @Autowired
    private GlobalAuthInterceptor globalAuthInterceptor;
    @Bean
    public WebMvcConfigurerAdapter webMvcConfigurerAdapter() {
        WebMvcConfigurerAdapter webMvcConfigurerAdapter = new WebMvcConfigurerAdapter(){
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(globalAuthInterceptor)
                        .excludePathPatterns("/doc.html*", "/webjars/**", "/swagger-resources*");
            }
        };
        return webMvcConfigurerAdapter;
    }
}
