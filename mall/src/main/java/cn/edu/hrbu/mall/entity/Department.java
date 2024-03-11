package cn.edu.hrbu.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data//自动生成get/set方法
@NoArgsConstructor//自动生成无参构造方法
@AllArgsConstructor//自动生成有参(全参)构造方法
public class Department {
    private Integer deptno;
    private String dname;
    private String loc;

}
