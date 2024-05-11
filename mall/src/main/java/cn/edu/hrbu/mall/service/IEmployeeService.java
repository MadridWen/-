package cn.edu.hrbu.mall.service;

import cn.edu.hrbu.mall.entity.Employee;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

import java.util.List;

// 在接口名前加上i，表示这是一个接口
public interface IEmployeeService {
    // 查询员工列表
    List<Employee> list();
    // 分页查询员工信息
    PageInfo<Employee> page(int pageNum, int pageSize);
    // 新增一条员工信息
    boolean save(Employee employee);
    // 根据员工编号修改员工信息
    boolean updateById(Employee employee);
    // 根据员工编号删除员工信息
    boolean removeById(int empNo);

    // 分页查询员工信息
    PageInfo<Employee> page(int pageNum, int pageSize, String ename, String job);

    // 根据部门编号查询员工
    List<Employee> list(int deptNo);

    // 查询员工详情的方法
    Employee getById(Integer empNo);

}
