package cn.edu.hrbu.mall.service.impl;

import cn.edu.hrbu.mall.entity.User;
import cn.edu.hrbu.mall.mapper.UserMapper;
import cn.edu.hrbu.mall.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    // 该类继承了 ServiceImpl 类，该类实现了 IService 接口，IService 接口继承了 BaseMapper 接口
    // 通过继承 ServiceImpl 类，该类可以直接调用 BaseMapper 接口提供的方法
    // 无需自己写 SQL 语句
}
