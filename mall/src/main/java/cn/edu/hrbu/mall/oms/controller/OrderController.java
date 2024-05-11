package cn.edu.hrbu.mall.oms.controller;

import cn.edu.hrbu.mall.oms.entity.Order;
import cn.edu.hrbu.mall.oms.service.IOrderItemService;
import cn.edu.hrbu.mall.oms.service.IOrderService;
import cn.edu.hrbu.mall.sms.entity.Coupon;
import cn.edu.hrbu.mall.sms.service.ICouponHistoryService;
import cn.edu.hrbu.mall.sms.service.ICouponService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-28
 */
@Api(tags = "订单")
@RestController
@RequestMapping("/oms/order")
public class OrderController {
    @Autowired
    private IOrderService orderService;

    /**
     * 查询订单列表
     * @param status 订单状态： 0 -> 待付款；1 -> 待发货；2 -> 待收货；3 -> 已完成；4 -> 已关闭；5 -> 无效订单； -1 -> 查询全部订单
     * @param memberId 会员ID
     * @param pageNum 页码
     * @param pageSize 每页数量
     * @return 订单列表
     */
    @GetMapping("/list")
    @ApiOperation("查询订单列表")
    public Map list(@ApiParam(value = "订单状态" , defaultValue = "-1") @RequestParam Integer status,
                    @ApiParam(value = "会员ID") @RequestParam Integer memberId,
                    @ApiParam(value = "页码" , defaultValue = "1") @RequestParam Integer pageNum,
                    @ApiParam(value = "每页数量" , defaultValue = "5") @RequestParam Integer pageSize) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", memberId);
        if (status != -1) {
            queryWrapper.eq("status", status);
        }
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", orderService.page(Page.of(pageNum, pageSize), queryWrapper));
        return response;
    }

    @GetMapping("/orderCount")
    @ApiOperation("查询订单数量")
    public Map orderCount(@ApiParam(value = "会员ID") @RequestParam Integer memberId) {
        Map map = new HashMap();
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", memberId);
        map.put("ALL", orderService.count(queryWrapper));
        // 待付款
        queryWrapper.clear();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("delete_status", 0);
        queryWrapper.eq("status", 0);
        map.put("PENDING_PAYMENT", orderService.count(queryWrapper));
        // 待发货
        queryWrapper.clear();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("delete_status", 0);
        queryWrapper.eq("status", 1);
        map.put("TO_BE_SHIPPED", orderService.count(queryWrapper));
        // 待收货
        queryWrapper.clear();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("delete_status", 0);
        queryWrapper.eq("status", 2);
        map.put("TO_BE_RECEIVED", orderService.count(queryWrapper));
        // 已完成（待评价）
        queryWrapper.clear();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("delete_status", 0);
        queryWrapper.eq("status", 3);
        map.put("TO_BE_EVALUATED", orderService.count(queryWrapper));

        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", map);
        return response;

    }

    @PostMapping("/delete/{id}")
    @ApiOperation("删除订单")
    // @ApiParam(value = "订单ID")
    public Map delete(@PathVariable int id) {
        UpdateWrapper updateWrapper = new UpdateWrapper();
        updateWrapper.eq("id", id);
        updateWrapper.set("delete_status", 1);
        updateWrapper.set("modify_time", 5);
        orderService.update(updateWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "删除成功");
        return response;
    }

    @PostMapping("/cancel/{id}")
    @ApiOperation("取消订单")
    public Map cancel(@ApiParam("订单id") @PathVariable Integer id) {
        UpdateWrapper updateWrapper = new UpdateWrapper();
        updateWrapper.eq("id", id);
        updateWrapper.set("status", 4);
        updateWrapper.set("modify_time", 5);
        orderService.update(updateWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "取消成功");
        return response;
    }

    @Autowired
    private IOrderItemService itemService;
    @Autowired
    private ICouponService couponService;
    @Autowired
    private ICouponHistoryService couponHistoryService;

    @PostMapping("/{id}")
    @ApiOperation("查询订单详情")
    public Map detail(@ApiParam("订单id") @PathVariable Integer id) {
        Order order = orderService.getById(id);
        // 查询该笔订单的订单子项
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("order_id", id);
        order.setItemList(itemService.list(queryWrapper));
        // 查询该笔订单的优惠券信息
        queryWrapper.select("coupon_id");
        List<Map<String,Integer>> list = couponHistoryService.listMaps(queryWrapper);
        List<Integer> couponIds = new ArrayList<>();
        list.forEach(item -> {
            couponIds.add(item.get("coupon_id")); // 去除优惠券ID，保存到集合里
        });
        if (!couponIds.isEmpty()) {
            List<Coupon> couponList = couponService.listByIds(couponIds);
            //【满￥%.1f减￥.1f】优惠￥%.1f元
            List<String> couponInfoList = new ArrayList<>();
            couponList.forEach(item -> {
                String str = "【满￥%.1f减￥.1f】优惠￥%.1f元";
                couponInfoList.add(String.format(str, item.getMinPoint(), item.getAmount(), item.getAmount()));
            });
            order.setCouponInfoList(couponInfoList);
        }

        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", order);
        return response;
    }

    @PostMapping("/confirmReceipt/{id}")
    @ApiOperation("确认收货")
    public Map confirmReceipt(@ApiParam("订单id") @PathVariable Integer id) {
        UpdateWrapper updateWrapper = new UpdateWrapper();
        updateWrapper.set("status", 3);
        updateWrapper.set("modify_time", LocalDateTime.now());
        updateWrapper.eq("id", id);
        updateWrapper.eq("status", 2);
        orderService.update(updateWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "确认收货成功");
        return response;
    }

    @PostMapping("/paymentSuccess/{id}")
    @ApiOperation("支付成功")
    public Map paymentSuccess(@ApiParam("订单id") @PathVariable Integer id,
                              @ApiParam(value = "优惠券ID" , example = "1, 2, 3")
                              @RequestParam(defaultValue = "") String couponIds){
        UpdateWrapper updateWrapper = new UpdateWrapper();
        updateWrapper.set("status", 1);
        updateWrapper.set("modify_time", LocalDateTime.now());
        updateWrapper.set("payment_time", LocalDateTime.now());
        updateWrapper.eq("id", id);
        updateWrapper.eq("status", 0);
        orderService.update(updateWrapper);

        // 修改优惠券的使用状态
        Order order = orderService.getById(id);
        updateWrapper.clear();
        updateWrapper.set("use_status", 1);
        updateWrapper.set("use_time", LocalDateTime.now());
        updateWrapper.set("order_id", id);
        updateWrapper.set("order_sn", order.getOrderSn());
        updateWrapper.eq("member_id", order.getMemberId());
        updateWrapper.in("coupon_id", couponIds.split(",")); // 优惠券ID

        if (couponIds.length() > 0) {
            couponHistoryService.update(updateWrapper);
        }


        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "支付成功，等待商家发货");
        return response;
    }

    @PostMapping("/delivery/{id}")
    @ApiOperation("订单发货")
    public Map delivery(@ApiParam("订单id") @PathVariable Integer id,
                        @ApiParam("快递公司") @RequestParam String deliveryCompany,
                        @ApiParam("快递单号") @RequestParam String deliverySn,
                        @ApiParam("备注") @RequestParam String note) {
        UpdateWrapper updateWrapper = new UpdateWrapper();
        updateWrapper.set("status", 2); // 修改订单状态
        updateWrapper.set("delivery_company", deliveryCompany);
        updateWrapper.set("delivery_sn", deliverySn);
        if (!StringUtils.isEmpty(note)) {
            updateWrapper.set("note", note);
        }
        updateWrapper.set("delivery_time", LocalDateTime.now());
        updateWrapper.set("modify_time", LocalDateTime.now());
        updateWrapper.eq("id", id);
        updateWrapper.eq("status", 1);
        orderService.update(updateWrapper);

        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "发货成功");
        return response;

    }






}
