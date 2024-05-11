package cn.edu.hrbu.mall.sms.controller;

import cn.edu.hrbu.mall.sms.entity.Coupon;
import cn.edu.hrbu.mall.sms.entity.CouponProductRelation;
import cn.edu.hrbu.mall.sms.entity.MemberCouponRelation;
import cn.edu.hrbu.mall.sms.service.ICouponProductRelationService;
import cn.edu.hrbu.mall.sms.service.ICouponService;
import cn.edu.hrbu.mall.sms.service.IMemberCouponRelationService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 优惠券表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-03
 */
@Api(tags = "优惠券")
@RestController
@RequestMapping("/sms/coupon")
public class CouponController {
    @Autowired
    private ICouponService couponService;
    @Autowired
    private IMemberCouponRelationService memberCouponRelationService;
    @Autowired
    private ICouponProductRelationService couponProductRelationService;

    @ApiOperation("查询会员优惠券列表")
    @GetMapping("/listByMember")
    public Map listByMember(@ApiParam("会员ID") @RequestParam Integer memberId,
                            @ApiParam("页号") @RequestParam(defaultValue = "1") Integer pageNum,
                            @ApiParam("页大小") @RequestParam(defaultValue = "12") Integer pageSize,
                            @ApiParam(value = "优惠券状态",allowableValues = "0,1,2") @RequestParam Integer status) {
        Map response = new HashMap();
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", memberId);
        if (status != 2){
            // 已使用或者已过期
            queryWrapper.eq("status", status);
        } else {
            // 未使用
            queryWrapper.eq("status", 0);
        }
        // 根据状态查询
        List<MemberCouponRelation> memberCouponRelationList = memberCouponRelationService.list(queryWrapper);

        // 该会员没有找到优惠券
        if (memberCouponRelationList.size() == 0){
            response.put("code", 202);
            response.put("message", "未查询到优惠券");
            return response;
        }
        List<Integer> couponIds = new LinkedList<>();
        memberCouponRelationList.forEach(relation -> {
            couponIds.add(relation.getCouponId());
        });
        queryWrapper.clear();
        queryWrapper.in("id", couponIds);
        // 查询未使用但是没过期的优惠券
        if (status == 0){
            queryWrapper.gt("end_time", LocalDateTime.now());
        }
        // 查询已过期的优惠券
        if (status == 2){
            queryWrapper.lt("end_time", LocalDateTime.now());
        }
        Page page = couponService.page(new Page(pageNum, pageSize), queryWrapper);
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", page);
        return response;
    }

    @ApiOperation("新增优惠券")
    @PostMapping("/add")
    public Map add(@RequestBody Coupon coupon,
                   @ApiParam("商品ID") @RequestParam Integer productId,
                   @ApiParam("商品名称") @RequestParam String productName,
                   @ApiParam("商品SN码") @RequestParam String productSn) {
        couponService.save(coupon);

        CouponProductRelation relation = new CouponProductRelation();
        relation.setCouponId(coupon.getId());
        relation.setProductId(Long.valueOf(productId));
        relation.setProductName(productName);
        relation.setProductSn(productSn);
        couponProductRelationService.save(relation);

        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "新增成功");
        return response;
    }

    @ApiOperation("查询优惠券可用列表")
    @GetMapping("/available")
    public Map available(@ApiParam("会员ID") @RequestParam Integer memberId,
                         @ApiParam("订单ID") @RequestParam Integer orderId) {
        List<Coupon> couponList = couponService.listByMemberAndOrder(memberId, orderId);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("content", couponList);
        return response;
    }

    @ApiOperation("领取优惠券")
    @PostMapping("/claim")
    public Map claim(@ApiParam("会员ID") @RequestParam Integer memberId,
                     @ApiParam("优惠券ID") @RequestParam Integer couponId) {
        Map response = new HashMap();
        Coupon coupon = couponService.getById(couponId);
        // 判断优惠券是否过期
        if (coupon.getEndTime().isBefore(LocalDateTime.now())){
            response.put("code", 201);
            response.put("message", "领取失败，优惠券已过截止日期");
            return response;
        }
        // 判断优惠券是否领完
        if (coupon.getCount() == 0) {
            response.put("code", 202);
            response.put("message", "领取失败，优惠券已领完");
            return response;
        }
        // 判断会员是否已领取的数量达到了限制
        QueryWrapper queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.eq("coupon_id", couponId);
        if (memberCouponRelationService.count(queryWrapper) >= coupon.getPerLimit()) {
            response.put("code", 203);
            response.put("message", "领取失败，已达到领取上限");
            return response;
        }

        MemberCouponRelation relation = new MemberCouponRelation();
        relation.setMemberId(memberId);
        relation.setCouponId(couponId);
        relation.setCreateTime(LocalDateTime.now());
        memberCouponRelationService.save(relation);

        response.put("code", 200);
        response.put("message", "领取成功");
        return response;

    }

}
