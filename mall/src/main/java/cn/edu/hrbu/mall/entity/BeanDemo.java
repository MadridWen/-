package cn.edu.hrbu.mall.entity;

import lombok.Data;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Component("beanDemoClass")
@Data
public class BeanDemo implements BeanFactoryAware, BeanNameAware {
    private BeanFactory beanFactory;
    private String beanName;
    @Override
    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        System.out.println("调用BeanFactoryAware的setBeanFactory方法");
        this.beanFactory = beanFactory;
    }

    @Override
    public void setBeanName(String s) {
        System.out.println("调用BeanNameAware的setBeanName方法");
        this.beanName = s;
    }
    @PostConstruct
    public void init(){
        System.out.println("调用初始化方法");
    }

    @PreDestroy
    public void destroy(){
        System.out.println("调用销毁方法");
    }
}
