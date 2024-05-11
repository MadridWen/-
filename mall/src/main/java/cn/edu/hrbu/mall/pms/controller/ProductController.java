package cn.edu.hrbu.mall.pms.controller;

import cn.edu.hrbu.mall.oms.service.IOrderItemService;
import cn.edu.hrbu.mall.pms.entity.Product;
import cn.edu.hrbu.mall.pms.entity.ProductAttribute;
import cn.edu.hrbu.mall.pms.entity.ProductAttributeValue;
import cn.edu.hrbu.mall.pms.service.ICommentService;
import cn.edu.hrbu.mall.pms.service.IProductAttributeService;
import cn.edu.hrbu.mall.pms.service.IProductAttributeValueService;
import cn.edu.hrbu.mall.pms.service.IProductService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.rmi.MarshalledObject;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品信息 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-10
 */
@Api(tags = "商品")
@RestController
@RequestMapping("/pms/product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private IOrderItemService orderItemService;
    @Autowired
    private ICommentService commentService;
    @Autowired
    private IProductAttributeService productAttributeService;
    @Autowired
    private IProductAttributeValueService productAttributeValueService;

    // 返回两个list集合的交集
    private List<Long> inter(List<Long> list1, List<Long> list2) {
        List<Long> list3 = new LinkedList<>();
        list1.forEach(item -> {
            if (list2.contains(item)) {
                list3.add(item);
            }
        });
        return list3;
    }

    @PostMapping("/list")
    @ApiOperation("获取商品列表")
    public Map list(@RequestParam(required = false) @ApiParam("商品关键词") String keyword,
                    @RequestParam(required = false) @ApiParam("商品类别") Integer categoryId,
                    @RequestBody(required = false) List<Map<String, Object>> attributes,
                    @RequestParam(defaultValue = "1") @ApiParam("页码") Integer pageNum,
                    @RequestParam(defaultValue = "20") @ApiParam("每页数量") Integer pageSize) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.select("id", "name", "price", "pic");
        // 设置查询条件
        // 关键字查询
        if (!StringUtils.isEmpty(keyword)) {
            queryWrapper.like("name", keyword);
            queryWrapper.or();
            queryWrapper.like("sub_title", keyword);
            queryWrapper.or();
            queryWrapper.like("description", keyword);
            queryWrapper.or();
            queryWrapper.like("keywords", keyword);
        }
        // 类别查询
        if (categoryId != null && categoryId > 0) {
            queryWrapper.eq("product_category_id", categoryId);
        }
        // 属性查询
        // 保存完全符合条件的商品id
        List<Long> productIds = new LinkedList<>();
        List<List<Long>> temps = new LinkedList<>();
        if (attributes != null){
            attributes.forEach(item -> {
                Object attrName = item.get("key"); // 颜色
                QueryWrapper attrQueryWrapper = new QueryWrapper();
                attrQueryWrapper.eq("name", attrName);
                attrQueryWrapper.select("id");
                List<ProductAttribute> productAttributeList = productAttributeService.list(attrQueryWrapper);
                List<Long> attrIds = new LinkedList<>();
                productAttributeList.forEach(attr -> {
                    attrIds.add(attr.getId());
                });
                attrQueryWrapper.clear();
                attrQueryWrapper.in("product_attribute_id", attrIds);
                attrQueryWrapper.like("value", item.get("value"));
                attrQueryWrapper.select("product_id");
                List<ProductAttributeValue> attributeValues = productAttributeValueService.list(attrQueryWrapper);
                List<Long> temp = new LinkedList<>();
                attributeValues.forEach(attrValue -> {
                    temp.add(attrValue.getProductId());
                });
                temps.add(temp);
            });
            if (!temps.isEmpty()) {
                productIds = temps.get(0);
                for (List<Long> temp : temps) {
                    productIds = inter(productIds, temp);
                }
                queryWrapper.in("id", productIds);
            }
        }

        Page<Map> page = productService.pageMaps(Page.of(pageNum, pageSize), queryWrapper);
        page.getRecords().forEach(item -> {
            Long productId = (Long) item.get("id");
            queryWrapper.clear();
            // 查询销量
            queryWrapper.select("sum(product_quantity) as salesVolume");
            queryWrapper.eq("product_id", productId);
            Map map = orderItemService.getMap(queryWrapper);
            if (map != null) {
                item.putAll(map);
            } else {
                item.put("salesVolume", 0);
            }
            // 查询评价数量
            queryWrapper.clear();
            queryWrapper.eq("product_id", productId);
            long commentVolume = commentService.count(queryWrapper);
            item.put("commentVolume", commentVolume);
        });
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", page);
        return response;
    }
}

