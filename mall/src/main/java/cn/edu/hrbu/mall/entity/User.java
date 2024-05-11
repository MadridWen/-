package cn.edu.hrbu.mall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 指定表名，声明实体类与数据库表的映射关系
@TableName("user")
public class User {
    // 添加用户时可以不设置主键，因为主键是自增的
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    // 指定实体类属性与数据库表字段的映射关系，如果属性名与字段名相同，可以省略
    @TableField(value = "name")
    private String name;
    private Integer age;
    private String email;
}
