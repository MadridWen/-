package cn.edu.hrbu.mall.oms.controller;

import cn.edu.hrbu.mall.oms.entity.CartItem;
import cn.edu.hrbu.mall.oms.service.ICartItemService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.rmi.MarshalledObject;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 购物车表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-28
 */
@Api(tags = "购物车")
@RestController
@RequestMapping("/oms/cartItem")
public class CartItemController {
    @Autowired
    private ICartItemService cartItemService;

    @ApiOperation("删除购物车商品")
    @PostMapping("/delete")
    public Map delete(@RequestParam String ids) {
        String[] idArray = ids.split(","); // 逗号分隔
        List list = Arrays.asList(idArray); // 转换为List
        cartItemService.removeByIds(list); // 批量删除
//        cartItemService.removeByIds(Arrays.asList(ids.split(","))); // 批量删除
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "删除成功");
        return response;
    }

    @ApiOperation("查询购物车列表")
    @GetMapping("/list")
    public Map list(@RequestParam Integer memberId,
                    @RequestParam(defaultValue = "1") Integer pageNum,
                    @RequestParam(defaultValue = "5") Integer pageSize) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("delete_status", 1); // 未删除
        queryWrapper.orderByDesc("modify_date"); // 按照修改时间倒序
        Page<CartItem> page = cartItemService.page(new Page<>(pageNum, pageSize), queryWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", page);
        return response;

    }

    @ApiOperation("修改购物车商品数量")
    @PostMapping("/modifyQuantity")
    public Map modifyQuantity(@RequestParam Integer cartId, @RequestParam Integer quantity) {
        UpdateWrapper updateWrapper = new UpdateWrapper();
        updateWrapper.eq("id", cartId);
        updateWrapper.set("modify_date", LocalDateTime.now());
        updateWrapper.set("quantity", quantity);
        cartItemService.update(updateWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "修改成功");
        return response;
    }

    @ApiOperation("统计购物车商品数量")
    @GetMapping("/count")
    public Map count(@RequestParam Integer memberId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("delete_status", 1); // 未删除
        long count = cartItemService.count(queryWrapper);
        Map response = new HashMap<>();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", count);
        return response;
    }


    @ApiOperation("添加商品到购物车")
    @PostMapping("/add")
    public Map add(@RequestBody CartItem cartItem) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", cartItem.getMemberId()); // 同一个会员
        queryWrapper.eq("product_id", cartItem.getProductId()); // 同一个商品
        queryWrapper.eq("product_sku_id", cartItem.getProductSkuId()); // 同一个商品SKU（完全相同的配置等）
        queryWrapper.eq("delete_status", 1); // 未删除的商品
        CartItem cartItemExist = cartItemService.getOne(queryWrapper);
        if (cartItemExist != null) { // 说明购物车中已经存在该商品
           // 只更新数量
            UpdateWrapper updateWrapper = new UpdateWrapper();
            updateWrapper.set("quantity", cartItemExist.getQuantity() + cartItem.getQuantity());
            updateWrapper.set("modify_date", LocalDateTime.now());
            updateWrapper.eq("id", cartItemExist.getId());
            cartItemService.update(updateWrapper);
            Map response = new HashMap();
            response.put("code", 200);
            response.put("message", "添加成功");
            return response;
        }
        cartItem.setCreateDate(LocalDateTime.now()); // 创建时间
        cartItem.setModifyDate(cartItem.getCreateDate()); // 修改时间
        cartItem.setDeleteStatus(1); // 未删除
        Map response = new HashMap();
        if (cartItemService.save(cartItem)) {
            response.put("code", 200);
            response.put("message", "添加成功");
        } else {
            response.put("code", 304);
            response.put("message", "添加失败");
        }
        return response;
    }
}
