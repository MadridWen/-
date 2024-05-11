package cn.edu.hrbu.mall.ums.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 后台用户表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Api(tags = "管理员信息维护") // @Api 加在类上
@RestController
@RequestMapping("/ums/admin")
public class AdminController {
    @ApiOperation(value = "测试Swagger", httpMethod = "GET") // @ApiOperation 加在方法上
    @RequestMapping("/hello")
    public String hello(@ApiParam(name = "name", value= "访客姓名", defaultValue = "游客1") @RequestParam String name) { // @ApiParam 加在参数上
        return String.format("Hello, %s, I am Swagger", name);
    }
}
