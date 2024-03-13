package cn.edu.hrbu.mall.factory;

import cn.edu.hrbu.mall.entity.Computer;
import org.springframework.beans.factory.FactoryBean;

// 2号电脑工厂：实例工厂
// FactoryBean接口是Spring框架中定义的一个接口，该接口中定义了三个方法，分别是：
// getObject()：用于返回一个对象的实例
// getObjectType()：用于返回对象的类型
// isSingleton()：用于返回对象是否是单例的
// 通过实现FactoryBean接口，可以将一个普通的类交给Spring容器进行管理
// 从而可以在getObject()方法中返回一个对象的实例，这样就可以将一个普通的类交给Spring容器进行管理
public class ComputerFactoryB{
    public Computer getObject() throws Exception {
        return new Computer("G15","DELL", 7999, 32, "2T", 1002, null);
    }

    public Class<?> getObjectType() {
        return null;
    }

    public boolean isSingleton() {
        return false; // 声明当前生产的实例是非单例的（默认单例）
    }
}
