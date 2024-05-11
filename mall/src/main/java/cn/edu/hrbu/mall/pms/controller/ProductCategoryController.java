package cn.edu.hrbu.mall.pms.controller;

import cn.edu.hrbu.mall.oms.service.IOrderItemService;
import cn.edu.hrbu.mall.pms.entity.ProductCategory;
import cn.edu.hrbu.mall.pms.service.ICommentService;
import cn.edu.hrbu.mall.pms.service.IProductCategoryService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 产品分类 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-10
 */
@Api(tags = "产品分类")
@RestController
@RequestMapping("/pms/productCategory")
public class ProductCategoryController {
    @Autowired
    private IProductCategoryService productCategoryService;

    @PostMapping("/add")
    @ApiOperation("添加分类")
    public Map add(@RequestBody ProductCategory category) {
        category.setProductCount(0);
        productCategoryService.save(category);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "添加成功");
        return response;
    }

    @GetMapping("/navTree")
    @ApiOperation("首页类别导航")
    public Map navTree() {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("level", 0); // 查询一级分类
        queryWrapper.eq("nav_status", 1);
        queryWrapper.eq("show_status", 1);
        queryWrapper.orderByAsc("sort");
        queryWrapper.select("id", "parent_id" , "name", "level"); // 选择字段
        List<ProductCategory> level0List = productCategoryService.list(queryWrapper);
        // 查询一级下的二级分类
        level0List.forEach(item -> {
            queryWrapper.clear();
            queryWrapper.eq("level", 1);
            queryWrapper.eq("parent_id", item.getId());
            queryWrapper.eq("nav_status", 1);
            queryWrapper.eq("show_status", 1);
            queryWrapper.orderByAsc("sort");
            queryWrapper.select("id", "parent_id" , "name", "level");
            List<ProductCategory> level1List = productCategoryService.list(queryWrapper);
            item.setChildren(level1List);
            // 查询二级下的三级分类
            level1List.forEach(item2 -> {
                queryWrapper.clear();
                queryWrapper.eq("level", 2);
                queryWrapper.eq("parent_id", item2.getId());
                queryWrapper.eq("nav_status", 1);
                queryWrapper.eq("show_status", 1);
                queryWrapper.orderByAsc("sort");
                queryWrapper.select("id", "parent_id" , "name", "level");
                List<ProductCategory> level2List = productCategoryService.list(queryWrapper);
                item2.setChildren(level2List);
            });
        });
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", level0List);
        return response;


    }
}
