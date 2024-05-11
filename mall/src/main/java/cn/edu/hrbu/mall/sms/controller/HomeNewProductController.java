package cn.edu.hrbu.mall.sms.controller;

import cn.edu.hrbu.mall.pms.service.IProductService;
import cn.edu.hrbu.mall.sms.entity.HomeNewProduct;
import cn.edu.hrbu.mall.sms.service.IHomeNewProductService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 新鲜好物表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-03
 */
@Api(tags = "首页新品推荐")
@RestController
@RequestMapping("/sms/homeNewProduct")
public class HomeNewProductController {
    @Autowired
    private IHomeNewProductService homeNewProductService;
    @Autowired
    private IProductService productService;

    @PostMapping("/add")
    @ApiOperation("添加首页新品推荐")
    public Map add(@RequestBody HomeNewProduct homeNewProduct) {
        homeNewProductService.save(homeNewProduct);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "添加成功");
        response.put("content", homeNewProduct);
        return response;
    }

    @GetMapping("/homeList")
    @ApiOperation("首页新品推荐")
    public Map homeList(@RequestParam(defaultValue = "8") @ApiParam(value = "首页新品推荐数量" , defaultValue = "8") Integer num) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("recommend_status", 1);
        queryWrapper.orderByAsc("sort");
        queryWrapper.last("limit " + num);
        List<HomeNewProduct> list = homeNewProductService.list(queryWrapper);
        // 获取商品id，封装到集合productIds里
        List<Long> productIds = new ArrayList<>(num);
        list.forEach(item -> {
            productIds.add(item.getProductId());
        });
        queryWrapper.clear();
        queryWrapper.in("id", productIds);
        queryWrapper.select("id", "name", "price", "pic");
        List<Map> maps = productService.listMaps(queryWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", maps);
        return response;

    }

}
