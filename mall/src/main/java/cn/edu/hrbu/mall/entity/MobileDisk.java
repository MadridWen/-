package cn.edu.hrbu.mall.entity;

// 移动硬盘类
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
