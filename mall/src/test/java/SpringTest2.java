import cn.edu.hrbu.mall.entity.Computer;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest2 {
    private ApplicationContext cxt;
    @Before
    public void init() {
        cxt = new ClassPathXmlApplicationContext("bean(annotation).xml");
    }

    @Test
    public void t1() {
        // 如果定义bean的时候未指定id或name属性，bean的id默认为类名,首字母小写
        Computer computer1 = cxt.getBean("computer", Computer.class);
        System.out.println(computer1);
    }
}
