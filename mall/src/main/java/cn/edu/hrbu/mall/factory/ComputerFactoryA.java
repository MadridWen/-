package cn.edu.hrbu.mall.factory;

import cn.edu.hrbu.mall.entity.Computer;

// 1号电脑工厂：静态工厂
public class ComputerFactoryA {
    public static Computer create() {
        return new Computer("光影精灵","HP", 5999, 16, "1T", 1001, null);
    }
}
