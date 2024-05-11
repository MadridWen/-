package cn.edu.hrbu.mall.service.impl;

import cn.edu.hrbu.mall.entity.Employee;
import cn.edu.hrbu.mall.mapper.EmployeeMapper;
import cn.edu.hrbu.mall.service.IEmployeeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
//Alt + Enter（快捷键） -> Implement methods
public class EmployeeServiceImpl implements IEmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> list() {
        return employeeMapper.selectAll();
    }

    @Override
    public PageInfo<Employee> page(int pageNum, int pageSize) {
        Page<Employee> page = PageHelper.startPage(pageNum,pageSize);
        List<Employee> list = employeeMapper.selectAll();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<Employee> page(int pageNum, int pageSize, String ename, String job) {
        //如果ename和job都为空，就是查询所有员工信息
        if (StringUtils.isEmpty(ename) && StringUtils.isEmpty(job)){
            return this.page(pageNum,pageSize);
        } else {
            Page<Employee> page = PageHelper.startPage(pageNum,pageSize);
            ename = StringUtils.isEmpty(ename) ? null : ename;
            job = StringUtils.isEmpty(job) ? null : job;
            List<Employee> list = employeeMapper.selectByEnameAndJob(ename,job);
            return new PageInfo<>(list);
        }
    }

    @Override
    public List<Employee> list(int deptNo){
        return employeeMapper.selectByDept(deptNo);
    }

    @Override
    public boolean save(Employee employee) {
        int n = employeeMapper.insert(employee);
        return n > 0;
    }
    @Override
    public boolean updateById(Employee employee) {
        return employeeMapper.update(employee) > 0;
    }

    @Override
    public boolean removeById(int empNo) {
        return employeeMapper.deleteById(empNo) > 0;
    }
    
    @Override
    public Employee getById(Integer empNo) {
        return employeeMapper.selectById(empNo);
    }

}
