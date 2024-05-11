package cn.edu.hrbu.mall.mapper;

import cn.edu.hrbu.mall.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

// 继承了 BaseMapper 接口，该接口提供了一些常用的增删改查方法，无需自己写 SQL 语句
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
