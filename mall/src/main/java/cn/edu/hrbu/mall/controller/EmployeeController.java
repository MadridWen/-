package cn.edu.hrbu.mall.controller;

import cn.edu.hrbu.mall.entity.Department;
import cn.edu.hrbu.mall.entity.Employee;
import cn.edu.hrbu.mall.mapper.DepartmentMapper;
import cn.edu.hrbu.mall.service.IEmployeeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/emp")
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private DepartmentMapper departmentMapper;

    //http://localhost:8080/emp/list
    @GetMapping("/list")
    public PageInfo<Employee> list(@RequestParam(defaultValue = "1") int pageNum,
                                   @RequestParam(defaultValue = "5") int pageSize,
                                   String ename,
                                   String job){
        return employeeService.page(pageNum,pageSize,ename,job);
    }

    @GetMapping("/allDept")
    public List<Department> allDept(){
        return departmentMapper.selectAll();
    }

    @GetMapping("/list/{deptNo}")
    public List<Employee> list(@PathVariable int deptNo){
        return employeeService.list(deptNo);
    }

    @PostMapping("/add")
    public Map add(@RequestBody Employee employee) {
        HashMap result = new HashMap<>();
        if (employeeService.save(employee)) {
            result.put("isOk", true);
        } else {
            result.put("isOk", false);
        }
        return result;
    }

    @PostMapping("/delete")
    public Map delete(int empNo){
        HashMap result = new HashMap<>();
        if (employeeService.removeById(empNo)){
            result.put("isOk",true);
        } else {
            result.put("isOk",false);
        }
        return result;
    }

    @GetMapping("/detail")
    public Employee detail(int empNo){
        return employeeService.getById(empNo);
    }

    @PostMapping("/update")
    public Map update(@RequestBody Employee employee){
        HashMap result = new HashMap<>();
        if (employeeService.updateById(employee)){
            result.put("isOk",true);
        } else {
            result.put("isOk",false);
        }
        return result;
    }
}
