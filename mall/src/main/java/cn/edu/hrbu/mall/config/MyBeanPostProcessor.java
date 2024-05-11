package cn.edu.hrbu.mall.config;

import cn.edu.hrbu.mall.entity.Computer;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;

//@Component
public class MyBeanPostProcessor implements BeanPostProcessor{
    // 在bean的初始化方法之前执行
    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        if (beanName.equals("Computer")){
            Computer computer = (Computer) bean;
            computer.setType(computer.getType() + " Plus");
            computer.setRam(computer.getRam() + 16);
        }
        System.out.println("调用BeanPostProcessor的postProcessBeforeInitialization方法");
        return BeanPostProcessor.super.postProcessBeforeInitialization(bean, beanName);
    }

    // 在bean的初始化方法之后执行
    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("调用BeanPostProcessor的postProcessAfterInitialization方法");
        return BeanPostProcessor.super.postProcessAfterInitialization(bean, beanName);
    }
}
