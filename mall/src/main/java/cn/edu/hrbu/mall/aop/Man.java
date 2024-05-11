package cn.edu.hrbu.mall.aop;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Random;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component("subjectMan")
public class Man {
    @Value("李四")
    private String name;

    public String call(){
        System.out.println(this.name + "正在打电话");
        return "玩一票大的，开飞机";
    }
    public void eat(String food){
        System.out.println(this.name + "正在吃" + food);
    }
    public void drive(){
        // 随机生成一个boolean值，如果为true则模拟抛出异常
        if (new Random().nextBoolean()){
            throw new RuntimeException(this.name + "车胎爆了");
        }
        System.out.println(this.name + "正在开车");
    }
}
