package cn.edu.hrbu.mall.entity;

// U盘类
public class Upan implements UsbStorage{
    @Override
    public void read() {
        System.out.println("U盘正在读取数据,速度慢，只能达到100MB/s");
    }

    @Override
    public void write() {
        System.out.println("U盘正在写入数据,速度慢，只能达到20MB/s");
    }
}
