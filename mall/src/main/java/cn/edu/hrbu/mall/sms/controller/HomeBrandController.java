package cn.edu.hrbu.mall.sms.controller;

import cn.edu.hrbu.mall.pms.service.IBrandService;
import cn.edu.hrbu.mall.sms.entity.HomeBrand;
import cn.edu.hrbu.mall.sms.service.IHomeBrandService;
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
 * 首页推荐品牌表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-03
 */
@Api(tags = "首页推荐品牌")
@RestController
@RequestMapping("/sms/homeBrand")
public class HomeBrandController {
    @Autowired
    private IHomeBrandService homeBrandService;
    @Autowired
    private IBrandService brandService;

    @PostMapping("/add")
    @ApiOperation("添加首页推荐品牌")
    public Map add(@RequestBody HomeBrand homeBrand) {
        Map response = new HashMap();
        QueryWrapper queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("brand_id", homeBrand.getBrandId());
        if (homeBrandService.count(queryWrapper) > 0 ){
            response.put("code", 304);
            response.put("message", "该品牌已被推荐，请勿重复操作");
            return response;
        }

        homeBrandService.save(homeBrand);

        response.put("code", 200);
        response.put("message", "添加成功");
        response.put("content", homeBrand);
        return response;
    }


    @GetMapping("/homeList")
    @ApiOperation("首页推荐品牌列表")
    public Map homeList(@RequestParam(defaultValue = "8") @ApiParam(value = "首页新品推荐数量" , defaultValue = "8") Integer num) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("recommend_status", 1);
        queryWrapper.orderByAsc("sort");
        queryWrapper.last("limit " + num);
        List<HomeBrand> homeBrandList = homeBrandService.list(queryWrapper);
        List<Long> brandIds = new ArrayList<>(num);
        homeBrandList.forEach(item -> {
            brandIds.add(item.getBrandId());
        });
        queryWrapper.clear();
        queryWrapper.in("id", brandIds);
        queryWrapper.select("id", "name", "logo", "big_pic");
        List<Map> maps = brandService.listMaps(queryWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", maps);
        return response;

    }


}
