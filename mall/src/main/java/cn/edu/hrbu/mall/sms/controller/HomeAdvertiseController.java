package cn.edu.hrbu.mall.sms.controller;

import cn.edu.hrbu.mall.sms.service.IHomeAdvertiseService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 首页轮播广告表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-03
 */
@Api(tags = "首页广告轮播")
@RestController
@RequestMapping("/sms/homeAdvertise")
public class HomeAdvertiseController {
    @Autowired
    private IHomeAdvertiseService homeAdvertiseService;

    @GetMapping("/list")
    @ApiOperation("查询列表")
    public Map list(@RequestParam @ApiParam(value = "广告类型 0->PC端 1->APP端" , allowableValues = "0,1" , defaultValue = "0") Integer type){
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("type", type);
        // 广告上线时间小于当前时间，广告下线时间大于当前时间
//        queryWrapper.lt("start_time", LocalDateTime.now());
//        queryWrapper.eq("end_time", LocalDateTime.now());
        queryWrapper.eq("status", 1); // 1->上线
        queryWrapper.orderByAsc("sort"); // 按sort字段排序
        Map response = new HashMap();
        response.put("code",200);
        response.put("content",homeAdvertiseService.list(queryWrapper));
        return response;
    }

}
