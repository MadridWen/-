package cn.edu.hrbu.mall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

/**
 * 雇员实体类
 * author: Madrid
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    private Integer empNo;
    private String empName;
    private String job;
    private Integer manager;
    private Timestamp hiredate;
    private Integer salary;
    private Integer comm;
    private Integer deptNo;
    //遇到外界引用，考虑直接定义该字段映射的实体类属性
    private Department department;
}
