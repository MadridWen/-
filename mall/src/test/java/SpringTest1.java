import cn.edu.hrbu.mall.entity.Computer;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest1 {
    // 声明一个上下文对象
    private ClassPathXmlApplicationContext cxt;
    @Before
    public void init() {
        // 初始化上下文对象
        cxt = new ClassPathXmlApplicationContext("beans.xml");
    }

    @Test
    public void t1() {
        // 从上下文对象中获取指定名称的bean
        Computer computer1 = cxt.getBean("huaweiComputer", Computer.class);
        System.out.println(computer1);
//        // 再次获取bean
//        Computer computer2 = cxt.getBean("huaweiComputer", Computer.class);
//        System.out.println(computer2);
        // 关闭上下文对象, 释放资源
        cxt.close();
    }

    @Test
    public void t2() {
        Computer computer1 = cxt.getBean("hpComputer", Computer.class);
        System.out.println(computer1);
        cxt.close();
    }

    @Test
    public void t3() {
        Computer computer1 = cxt.getBean("dellComputer", Computer.class);
        System.out.println(computer1);
        cxt.close();
    }

    @Test
    public void t4() {
        Computer computer1 = cxt.getBean("huaweiComputer", Computer.class);
        System.out.println(computer1);
        computer1.getUsbStorage().read();
        computer1.getUsbStorage().write();
    }
}
