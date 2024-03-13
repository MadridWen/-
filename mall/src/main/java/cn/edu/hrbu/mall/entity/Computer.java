package cn.edu.hrbu.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.Random;

@Data
//@NoArgsConstructor
@AllArgsConstructor
// 定义bean的注解有4个，分别是@Component、@Service（业务）、@Repository（数据访问对象，如基于mybatis框架编写的Mapper上）、@Controller（控制器）
@Component // 用于标注一个普通的bean类(泛指所有的组件)，表明这个类会被Spring进行管理
@Scope("prototype") // 用于指定bean的作用范围，prototype表示多例，作用和xml配置文件中的scope属性一样
public class Computer {
    @Value("E460") // value注解用于为属性注入值
    private String type; //型号
    @Value("Lenovo")
    private String brand; //品牌
    @Value("4999")
    private float price; //价格
    @Value("8")
    private int ram; //内存
    @Value("512G")
    private String rom; //硬盘
    private int no = new Random().nextInt(10000); //随机生成一个编号
    private UsbStorage usbStorage; //USB存储设备,面向接口编程,满足依赖倒置原则
    public Computer() {
        System.out.println("调用构造器，实例化对象");
    }

    //初始化方法
    @PostConstruct // 声明初始化方法
    public void a(){
        System.out.println("对电脑进行初始化，安装操作系统和必要驱动");
    }
    //销毁方法
    @PreDestroy // 声明销毁方法
    public void b(){
        System.out.println("对电脑进行销毁，删除数据，用户账号，格式化硬盘");
    }

    @Override
    public void finalize() {
        // 重写Object基类中的释放资源的方法，类似于C++中的析构函数
        System.out.println("销毁对象");
    }

}
