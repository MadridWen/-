package cn.edu.hrbu.mall.entity;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

// 移动硬盘类
@Component("md2")
@Primary // 定义当前bean是首选的bean，当有多个bean满足自动装配时，优先选择这个bean
public class MobileDisk implements UsbStorage{
    @Override
    public void read() {
        System.out.println("移动硬盘正在读取数据,速度快，能达到500MB/s");
    }

    @Override
    public void write() {
        System.out.println("移动硬盘正在写入数据,速度快，能达到200MB/s");
    }
}
