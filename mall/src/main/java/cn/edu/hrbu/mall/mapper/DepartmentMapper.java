package cn.edu.hrbu.mall.mapper;

import cn.edu.hrbu.mall.entity.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    // 通过部门编号查询部门信息
    Department selectByID(Integer id);
    // 查询所有部门信息
    List<Department> selectAll();
    // 根据部门信息模糊查找
    List<Department> selectByDname(String dname);
    // 添加部门信息
    int insert(Department department);
    // 删除部门信息
    int delete(Integer id);
    // 修改部门信息
    int update(Department department);
}
