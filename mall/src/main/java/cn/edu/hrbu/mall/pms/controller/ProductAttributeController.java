package cn.edu.hrbu.mall.pms.controller;

import cn.edu.hrbu.mall.pms.entity.ProductAttribute;
import cn.edu.hrbu.mall.pms.entity.ProductAttributeCategory;
import cn.edu.hrbu.mall.pms.entity.ProductAttributeValue;
import cn.edu.hrbu.mall.pms.entity.ProductCategory;
import cn.edu.hrbu.mall.pms.service.IProductAttributeCategoryService;
import cn.edu.hrbu.mall.pms.service.IProductAttributeService;
import cn.edu.hrbu.mall.pms.service.IProductCategoryService;
import cn.edu.hrbu.mall.pms.service.IProductService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品属性参数表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-10
 */
@RestController
@RequestMapping("/pms/productAttribute")
@Api(tags = "商品属性")
public class ProductAttributeController {
    @Autowired
    private IProductAttributeService productAttributeService;
    @Autowired
    private IProductCategoryService productCategoryService;
    @Autowired
    private IProductAttributeCategoryService productAttributeCategoryService;

    @GetMapping("/list")
    @ApiOperation("根据商品类别查询列表")
    public Map listByCate(@RequestParam @ApiParam("商品类别id") Long categoryId) {
        ProductCategory childCategory = productCategoryService.getById(categoryId); // 获取子类别
        ProductCategory parentCategory = productCategoryService.getById(childCategory.getParentId()); // 获取父类别
        String attributeCategoryName = parentCategory.getName() + "-" + childCategory.getName(); // 获取属性分类名称，拼接一个商品属性名称
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("name", attributeCategoryName);
        ProductAttributeCategory attributeCategory = productAttributeCategoryService.getOne(queryWrapper); // 获取属性分类
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        if (attributeCategory == null) {
            return response;
        }
        Long attributeCategoryId = attributeCategory.getId();
        queryWrapper.clear();
        queryWrapper.eq("product_attribute_category_id", attributeCategoryId);
        response.put("content", productAttributeService.list(queryWrapper));
        return response;// 查询并返回商品属性列表

    }

    @PostMapping("/add")
    @ApiOperation("添加商品属性")
    public Map add(@RequestParam @ApiParam("商品属性ID") Long categoryId,
                    @RequestBody ProductAttribute productAttribute) {
        ProductCategory childCategory = productCategoryService.getById(categoryId); // 获取子类别
        ProductCategory parentCategory = productCategoryService.getById(childCategory.getParentId()); // 获取父类别
        String attributeCategoryName = parentCategory.getName() + "-" + childCategory.getName(); // 获取属性分类名称，拼接一个商品属性名称
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("name", attributeCategoryName);
        ProductAttributeCategory attributeCategory = productAttributeCategoryService.getOne(queryWrapper); // 获取属性分类
        if (attributeCategory == null) {
            attributeCategory = new ProductAttributeCategory();
            attributeCategory.setName(attributeCategoryName);
            attributeCategory.setAttributeCount(0);
            attributeCategory.setParamCount(0);
            productAttributeCategoryService.save(attributeCategory);
        }
        // 设置属性分类ID
        productAttribute.setProductAttributeCategoryId(attributeCategory.getId());
        productAttributeService.save(productAttribute);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "添加成功");
        return response;
    }


}
