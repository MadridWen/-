package cn.edu.hrbu.mall.ums.controller;

import cn.edu.hrbu.mall.ums.entity.MemberReceiveAddress;
import cn.edu.hrbu.mall.ums.service.IMemberReceiveAddressService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 会员收货地址表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Api(tags = "收货地址")
@RestController
@RequestMapping("/ums/memberReceiveAddress")
public class MemberReceiveAddressController {

    @Autowired
    private IMemberReceiveAddressService addressService;

    @ApiOperation("设置默认收货地址")
    @PostMapping("/setDefault")
    public Map setDefault(@RequestParam @ApiParam("会员id") Integer memberId,
                          @RequestParam @ApiParam("地址id") Integer id){
        boolean ret = addressService.setDefaultAddress(memberId, id);
        Map response = new HashMap();
        if (ret){
            response.put("code", 200);
            response.put("message", "设置成功");
        } else {
            response.put("code", 304);
            response.put("message", "设置失败");
        }
        return response;
    }

    @ApiOperation("删除收货地址")
    @PostMapping("/delete/{id}")
    public Map delete(@PathVariable Integer id){
        Map response = new HashMap();
        if (addressService.removeById(id)){
            response.put("code", 200);
            response.put("message", "删除成功");
        } else {
            response.put("code", 304);
            response.put("message", "删除失败");
        }
        return response;
    }

    @ApiOperation("查询收货地址列表")
    @GetMapping("/list")
    public Map list(@RequestParam Integer memberId){
        Map response = new HashMap();
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("member_id", memberId);
        response.put("code", 200);
        response.put("message", "查询成功");
        response.put("content", addressService.list(queryWrapper));
        return response;

    }

    @ApiOperation("修改收货地址")
    @PostMapping("/modify")
    public Map modify(@RequestBody MemberReceiveAddress address){
        Map response = new HashMap();
        if (addressService.saveOrUpdate(address)){
            response.put("code", 200);
            response.put("message", "修改成功");
        } else {
            response.put("code", 304);
            response.put("message", "修改失败");
        }
        return response;
    }


    @ApiOperation("查询收货地址")
    @GetMapping("/{id}")
    public Map detail(@PathVariable Integer id){
        Map response = new HashMap();
        MemberReceiveAddress address = addressService.getById(id);
        if (address != null){
            response.put("code", 200);
            response.put("message", "查询成功");
            response.put("content", address);
        } else {
            response.put("code", 404);
            response.put("message", "查询失败");
        }
        return response;
    }

    @ApiOperation("新增收货地址")
    @PostMapping("/add")
    public Map add(@RequestBody MemberReceiveAddress address){
        Map response = new HashMap();
        if (addressService.saveOrUpdate(address)){
            response.put("code", 200);
            response.put("message", "新增成功");
            QueryWrapper queryWrapper = new QueryWrapper();
            queryWrapper.eq("member_id", address.getMemberId());
            response.put("content", addressService.list(queryWrapper));
        } else {
            response.put("code", 304);
            response.put("message", "新增失败");
        }
        return response;
    }
}
