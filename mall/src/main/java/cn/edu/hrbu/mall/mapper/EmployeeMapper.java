package cn.edu.hrbu.mall.mapper;

import cn.edu.hrbu.mall.entity.Department;
import cn.edu.hrbu.mall.entity.Employee;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * mybatis的sql映射有xml和注解两种方式
 */
@Mapper
public interface EmployeeMapper {
    //下划线用Result映射
    @Results(id = "reEmp",value = {
//            @Result(id = true,column = "emp_no",property = "empNo"),
//            @Result(column = "emp_name",property = "empName"),
//            @Result(column = "dept_no",property = "deptNo"),
            @Result(property = "department",column = "dept_no",javaType = Department.class,one = @One(select = "cn.edu.hrbu.mall.mapper.DepartmentMapper.selectByID"))
    })
    //根据员工编号查询员工信息
    @Select("select * from emp where emp_no = #{empNo}")//arg0,empNo,param1
    Employee selectByID(Integer empNo);

    //查询所有员工信息
    @Select("select * from emp")
    List<Employee> selectAll();

    //同时根据员工和职务进行查询的方法
    @Select("select * from emp where emp_name = #{param1} and job = #{param2}")
    List<Employee> selectByEmpNameAndJob(String empName,String job);

    @Options(useGeneratedKeys = true,keyProperty = "empNo",keyColumn = "emp_no")
    @Insert("insert into emp values(NULL,#{empName},#{job},#{manager},#{hireDate},#{salary},#{comm},#{deptNo})")
    int insert(Employee employee);

    /**
     * 批量插入员工信息
     * @param employeeList
     * @return
     */
    int batchInsert(List<Employee> employeeList);

    /**
     * 查询多个id指定的员工记录
     * @param ids
     * @return
     */
    List<Employee> selectListInIds(List<Integer> ids);

}
