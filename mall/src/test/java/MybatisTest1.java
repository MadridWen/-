import cn.edu.hrbu.mall.entity.Department;
import cn.edu.hrbu.mall.mapper.DepartmentMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

//单元测试类
public class MybatisTest1 {
    //数据库会话对象(可以近似理解为一个数据库连接）
    private SqlSession sqlSession;
    @Before
    public void init() throws IOException {
        //读取mybatis-config.xml文件
        Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
        //创建SqlSessionFactory对象(会话工厂对象)(此处使用了建造者对象)
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        //创建会话实例（开启一个会话）
        sqlSession = sqlSessionFactory.openSession();
    }
    @Test
    public void t0(){
        //打印sqlsession,观察是否成功
        System.out.println(sqlSession);
    }

    //测试根据id查询部门信息
    @Test
    public void t1(){
        int deptno = 10;
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        Department department = departmentMapper.selectByID(deptno);
        System.out.println(department);
    }

    //测试查询所有部门信息
    @Test
    public void t2(){
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        List<Department> departmentList = departmentMapper.selectAll();
        departmentList.forEach(item -> System.out.println(item));
    }

    //测试添加部门信息
    @Test
    public void t3(){
        Department department = new Department(50,"后勤部","合肥");
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        int result = departmentMapper.insert(department);
        System.out.println(result);
        //提交事务
        sqlSession.commit();
        System.out.println("添加成功");
    }

    //测试修改部门信息
    @Test
    public void t4(){
        Department department = sqlSession.getMapper(DepartmentMapper.class).selectByID(10);
        department.setDname("行政一部");
        department.setLoc("香港");
        sqlSession.getMapper(DepartmentMapper.class).update(department);
        //提交事务
        sqlSession.commit();
        System.out.println("修改成功");
    }

    //测试删除部门信息
    @Test
    public void t5(){
        int deptno = 50;
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        int result = departmentMapper.delete(deptno);
        System.out.println(result);
        //提交事务
        sqlSession.commit();
        System.out.println("删除成功");
    }

    //测试根据部门名称模糊查询
    @Test
    public void t6(){
        String key = "行政";
        DepartmentMapper departmentMapper = sqlSession.getMapper(DepartmentMapper.class);
        List<Department> departmentList = departmentMapper.selectByDname(key);
        departmentList.forEach(item -> System.out.println(item));
    }
}
