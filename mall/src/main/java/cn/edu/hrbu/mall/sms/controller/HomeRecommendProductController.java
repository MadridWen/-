package cn.edu.hrbu.mall.sms.controller;

import cn.edu.hrbu.mall.pms.service.IProductService;
import cn.edu.hrbu.mall.sms.entity.HomeRecommendProduct;
import cn.edu.hrbu.mall.sms.service.IHomeRecommendProductService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 人气推荐商品表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-03
 */
@Api(tags = "人气推荐商品")
@RestController
@RequestMapping("/sms/homeRecommendProduct")
public class HomeRecommendProductController {
    @Autowired
    private IHomeRecommendProductService homeRecommendProductService;
    @Autowired
    private IProductService productService;

    @GetMapping("/homeList")
    @ApiOperation("首页人气推荐商品列表")
    public Map homeList(@RequestParam @ApiParam(value = "首页商品推荐数量" , defaultValue = "6") Integer num) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("recommend_status", 1);
        queryWrapper.orderByAsc("sort");
        queryWrapper.last("limit " + num);
        List<HomeRecommendProduct> list = homeRecommendProductService.list(queryWrapper);
        List<Long> productIds = new ArrayList<>(num);
        list.forEach(item -> {
            productIds.add(item.getProductId());
        });
        queryWrapper.clear();
        queryWrapper.in("id", productIds);
        queryWrapper.select("id", "name", "pic", "price");
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", productService.listMaps(queryWrapper));
        return response;

    }

}
