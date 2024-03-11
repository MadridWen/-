import cn.edu.hrbu.mall.entity.Department;
import cn.edu.hrbu.mall.entity.Employee;
import cn.edu.hrbu.mall.mapper.DepartmentMapper;
import cn.edu.hrbu.mall.mapper.EmployeeMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.Reader;
import java.sql.Timestamp;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//单元模块测试类
public class MybatisTest2 {
    //数据库会话对象(可以近似理解为一个数据库连接）
    private SqlSession sqlSession;
    private EmployeeMapper employeeMapper;

    @Before
    public void init() throws IOException {
        //读取mybatis-config.xml文件
        Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
        //创建SqlSessionFactory对象(会话工厂对象)(此处使用了建造者对象)
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        //创建会话实例（开启一个会话）
        sqlSession = sqlSessionFactory.openSession();
//        sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH); //创建session时同时指定执行器类型
//        sqlSession = sqlSessionFactory.openSession(TransactionIsolationLevel.READ_COMMITTED); //创建session时同时指定事务隔离级别
//        sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,TransactionIsolationLevel.READ_COMMITTED); //创建session时同时指定执行器类型和事务隔离级别
        //实例化EmployeeMapper对象
        employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
    }

    @Test
    public void t1() {
        Employee employee = employeeMapper.selectByID(7);
        System.out.println(employee);
    }

    //使用mybatis的分页查询
    @Test
    public void t2() {
        //查询第一页，每页显示5条记录
        RowBounds rowBounds = new RowBounds(0, 5);
        List<Employee> employeeList = sqlSession.selectList("cn.edu.hrbu.mall.mapper.EmployeeMapper.selectAll", null, rowBounds);
        System.out.println("一共查询到" + employeeList.size() + "条记录");
        employeeList.forEach(System.out::println);
    }

    //测试添加员工的方法，获取自动生成的主键值
    @Test
    public void t3() {
        Employee employee = new Employee(null, "小李", "程序员", 5, new Timestamp(System.currentTimeMillis()), 5000, 1000, 30, null);
        employeeMapper.insert(employee);
        sqlSession.commit();
        System.out.println(employee);
    }

    //测试批量查询员工信息
    @Test
    public void t4() {
        List<Employee> employeeList = employeeMapper.selectListInIds(Arrays.asList(1, 3, 5, 7, 9));
        employeeList.forEach(System.out::println);
    }

    //测试批量插入员工信息
    @Test
    public void t5() {
        Employee employee1 = new Employee(null, "小张", "程序员", 5, new Timestamp(System.currentTimeMillis()), 5000, 1000, 30, null);
        Employee employee2 = new Employee(null, "小王", "程序员", 5, new Timestamp(System.currentTimeMillis()), 5000, 1000, 30, null);
        Employee employee3 = new Employee(null, "小强", "程序员", 5, new Timestamp(System.currentTimeMillis()), 5000, 1000, 30, null);
        List<Employee> employees = new ArrayList<>();
        employees.add(employee1);
        employees.add(employee2);
        employees.add(employee3);
        employeeMapper.batchInsert(employees);
        sqlSession.commit();
        System.out.println("添加成功");
    }

    //使用PageHelper插件进行物理分页查询
    @Test
    public void t6() {
        //设置分页查询的页码和每页显示的记录数
        Page page = PageHelper.startPage(2,10);
        List<Employee> employees = employeeMapper.selectAll();
        System.out.println(page);
    }
}
