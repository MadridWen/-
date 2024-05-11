package cn.edu.hrbu.mall.pms.controller;

import cn.edu.hrbu.mall.pms.entity.*;
import cn.edu.hrbu.mall.pms.service.*;
import cn.edu.hrbu.mall.ums.entity.Member;
import cn.edu.hrbu.mall.ums.entity.MemberLoginLog;
import cn.edu.hrbu.mall.ums.service.IMemberLoginLogService;
import cn.edu.hrbu.mall.ums.service.IMemberService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * 商品评价表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-04-10
 */
@Api(tags = "商品评价")
@RestController
@RequestMapping("/pms/comment")
public class CommentController {
    @Autowired
    private ICommentService commentService;
    @Autowired
    private IMemberService memberService;
    @Autowired
    private IMemberLoginLogService memberLoginLogService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IProductAttributeService productAttributeService;
    @Autowired
    private IProductAttributeValueService productAttributeValueService;
    @Autowired
    private ICommentReplayService CommentReplayService;

    @PostMapping("/reply") // reply误打成replay，只能将错就错了
    @ApiOperation("回复评价")
    public Map reply(@RequestBody CommentReplay replay) {
        replay.setCreateTime(LocalDateTime.now());
        CommentReplayService.save(replay);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "回复成功");
        response.put("content", replay);
        return response;
    }

    @PostMapping("delete/{id}")
    @ApiOperation("删除评价")
    public Map delete(@PathVariable Long id) {
        commentService.removeById(id);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "删除成功");
        return response;
    }

    @GetMapping("/list")
    @ApiOperation("查询评价列表")
    public Map list(@RequestParam @ApiParam(value = "会员ID") Long memberId,
                    @RequestParam @ApiParam(value = "页号", defaultValue = "1") Integer pageNum,
                    @RequestParam @ApiParam(value = "每页显示条数", defaultValue = "10") Integer pageSize) {
        QueryWrapper queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("member_id", memberId);
        queryWrapper.orderByDesc("create_time");
        Page page = commentService.page(Page.of(pageNum, pageSize), queryWrapper);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", page);
        return response;
    }

    @PostMapping("/add")
    @ApiOperation("添加评价")
    public Map add(@RequestBody Comment comment) {
        comment.setCreateTime(LocalDateTime.now());
        comment.setShowStatus(1);
        // 根据会员ID查询会员信息
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.select("nickname", "icon", "id");
        Member member = memberService.getById(comment.getMemberId());
        comment.setMemberIcon(member.getIcon());
        comment.setMemberNickName(member.getNickname());
        // 查询会员最近一次登录的IP地址
        queryWrapper.clear();
        queryWrapper.eq("member_id", comment.getMemberId());
        queryWrapper.orderByDesc("create_time");
        queryWrapper.select("ip");
        queryWrapper.last("limit 1");
        MemberLoginLog memberLoginLog = memberLoginLogService.getOne(queryWrapper);
        comment.setMemberIp(memberLoginLog.getIp());
        // 获取被查询的商品信息
        Product product = productService.getById(comment.getProductId());
        comment.setProductName(product.getName());
        comment.setProductPic(product.getPic());
        // 获取商品的属性信息
        queryWrapper.clear();
        queryWrapper.eq("product_attribute_category_id", product.getProductAttributeCategoryId());
        List<ProductAttribute> productAttributeList = productAttributeService.list(queryWrapper);
        List<Map> attrs = new LinkedList<>();
        productAttributeList.forEach(item -> {
           Long productId = product.getId();
           Long attributeId = item.getId();
           queryWrapper.clear();
           queryWrapper.eq("product_id", productId);
           queryWrapper.eq("product_attribute_id", attributeId);
           queryWrapper.last("limit 1");
           ProductAttributeValue productAttributeValue = productAttributeValueService.getOne(queryWrapper);
           Map map = new HashMap();
           map.put("name", item.getName());
           map.put("value", productAttributeValue == null ? "" :productAttributeValue.getValue());
           attrs.add(map);
        });
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            comment.setProductAttribute(objectMapper.writeValueAsString(attrs));
        } catch (Exception e) {
            e.printStackTrace();
        }
        comment.setCollectCount(0);
        comment.setReadCount(0);
        comment.setReplayCount(0);
        commentService.save(comment);
        Map response = new HashMap();
        response.put("code", 200);
        response.put("message", "添加成功");
        response.put("content", comment);
        return response;

    }

}
