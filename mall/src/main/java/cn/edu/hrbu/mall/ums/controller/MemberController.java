package cn.edu.hrbu.mall.ums.controller;

import cn.edu.hrbu.mall.ums.entity.Member;
import cn.edu.hrbu.mall.ums.entity.MemberLoginLog;
import cn.edu.hrbu.mall.ums.service.IMemberLoginLogService;
import cn.edu.hrbu.mall.ums.service.IMemberService;
import cn.edu.hrbu.mall.util.JwtUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.jsonwebtoken.Jwt;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.util.PatternMatchUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Api(tags = "会员")
@RestController
@RequestMapping("/ums/member")
@CrossOrigin("*") // 允许跨域
public class MemberController {

    @Autowired
    private IMemberService memberService;
    @Autowired
    private IMemberLoginLogService memberLoginLogService;

    @GetMapping("/{id}")
    @ApiOperation("查询会员信息")
    public Member Info(@PathVariable Integer id) {
        Member member = memberService.getById(id);
        member.setPassword("********"); // 隐藏密码，不返回给前端
        return member;
    }

    @PostMapping("/modifyInfo")
    @ApiOperation("修改个人信息")
    public Map modifyInfo(@RequestBody Member member) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("username", member.getUsername());
        queryWrapper.ne("id", member.getId()); // 排除自己，ne表示不等于
        if (memberService.count(queryWrapper) > 0) {
            Map responseBody = new HashMap();
            responseBody.put("code", 304);
            responseBody.put("message", "用户名已存在，请更换");
            return responseBody;
        }

        UpdateWrapper updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", member.getId());
        updateWrapper.set("nickname", member.getNickname());
        updateWrapper.set("username", member.getUsername());
//        updateWrapper.set("phone", member.getPhone());
        updateWrapper.set("icon", member.getIcon());
        updateWrapper.set("gender", member.getGender());
        updateWrapper.set("birthday", member.getBirthday());
        updateWrapper.set("city", member.getCity());
        updateWrapper.set("job", member.getJob());
        updateWrapper.set("personalized_signature", member.getPersonalizedSignature());
        memberService.update(updateWrapper);
        Map responseBody = new HashMap();
        responseBody.put("code", 200);
        responseBody.put("message", "修改成功");
        return responseBody;
    }

    @PostMapping("/validatePwd")
    @ApiOperation("验证密码是否正确")
    public Map validatePassword(@RequestBody HashMap params) {
        Member member = memberService.getById(params.get("id").toString());
        Map responseBody = new HashMap();
        if (null != member) {
            if (BCrypt.checkpw((String)params.get("oldPass"), member.getPassword())) { // 旧密码正确
                responseBody.put("code", 200);
                responseBody.put("message", "旧密码正确");
            } else {
                responseBody.put("code", 304);
                responseBody.put("message", "旧密码错误");
            }
        } else {
            responseBody.put("code", 304);
            responseBody.put("message", "用户不存在");
        }
        return responseBody;
    }

    @PostMapping("/modifyPassword")
    @ApiOperation("修改密码")
    public Map modifyPassword(@RequestParam Integer id, @RequestParam String newPass) {
        Member member = memberService.getById(id);
        Map responseBody = new HashMap();
        if (member != null) {
            String hashed = BCrypt.hashpw(newPass, BCrypt.gensalt()); // 生成密文
            UpdateWrapper updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("id", id);
            updateWrapper.set("password", hashed);
            memberService.update(updateWrapper);
            responseBody.put("code", 200);
            responseBody.put("message", "密码修改成功");
        } else {
            responseBody.put("code", 304);
            responseBody.put("message", "旧密码错误");
        }
        return responseBody;
    }

    @PostMapping("/login")
    @ApiOperation("会员登录")
    public Map login(HttpServletRequest request, @RequestParam String username, @RequestParam String password) {
        QueryWrapper queryWrapper = new QueryWrapper();
        // 验证手机号格式
        String regex = "^1[3-9]\\d{9}$";
        // 匹配用户输入的是不是手机号
        if (Pattern.matches(regex, username)) {
            queryWrapper.eq("phone", username);
        } else {
            queryWrapper.eq("username", username);
        }
//        queryWrapper.eq("username", username);
        Member member = memberService.getOne(queryWrapper);
        Map responseBody = new HashMap();
        if (member != null) { // 用户存在
            if (BCrypt.checkpw(password, member.getPassword())) { // 密码正确
                member.setPassword("********"); // 隐藏密码，不返回给前端
                MemberLoginLog memberLoginLog = new MemberLoginLog();
                memberLoginLog.setMemberId(member.getId());
                memberLoginLog.setCreateTime(LocalDateTime.now());
                String ip = request.getHeader("x-forwarded-for");
                // ip.length() == 0
                if (ip == null || "".equals(ip) || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("x-real-ip");
                }
                if (ip == null || "".equals(ip) || "unknown".equalsIgnoreCase(ip)) {
//                    ip = request.getHeader("Proxy-Client-IP");
                    ip = request.getRemoteAddr();
                }
                memberLoginLog.setIp(ip);
                memberLoginLogService.save(memberLoginLog); // 保存登录日志
                // 登录成功后，生成JWT，签发令牌，返回给前端
                JwtUtil jwtUtil = new JwtUtil();
                responseBody.put("code", 200);
                responseBody.put("message", "登录成功");
                responseBody.put("content", member);
                long exp = 30 * 60 * 1000; // 30分钟
                Map<String, Object> info = new HashMap<>();
                info.put("memberId", member.getId());
                info.put("username", member.getUsername());
                info.put("tel", member.getPhone());
                responseBody.put("token", jwtUtil.create(exp, info));
                return responseBody;
            }
        }
        responseBody.put("code", 401);
        responseBody.put("message", "用户名或密码错误");
        return responseBody;
    }

    @PostMapping("/register")
    @ApiOperation("会员注册")
    public Map register(@RequestBody Member member) {
        Map responseBody = new HashMap();
        // 判断手机号是否已经被注册
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("phone", member.getPhone());
        if (memberService.count(queryWrapper) > 0) {
            responseBody.put("code", 304);
            responseBody.put("message", "手机号已被注册");
            return responseBody;
        }
        // 设置member和会员的默认名字
        if (StringUtils.isEmpty(member.getUsername())) {
            member.setUsername("Member" + member.getPhone());
        }
        if (StringUtils.isEmpty(member.getNickname())) {
            member.setNickname("会员" + member.getPhone());
        }
        member.setStatus(1);// 会员状态
        member.setMemberLevelId(4L);// 会员等级
        member.setCreateTime(LocalDateTime.now());// 会员注册时间
        member.setIcon("default.png");// 会员默认头像
        member.setGrowth(0);// 会员成长值
        member.setLuckeyCount(0);// 会员积分
        member.setHistoryIntegration(0);// 会员历史积分
        // 将用户密码加密
        String password = member.getPassword();
        // 生成密文
        String secretPass = BCrypt.hashpw(password, BCrypt.gensalt());
        member.setPassword(secretPass);
        if (memberService.save(member)) {
            responseBody.put("code", 200);
            responseBody.put("message", "注册成功");
            responseBody.put("content", member);
        } else {
            responseBody.put("code", 304);
            responseBody.put("message", "注册失败");
        }
        return responseBody;
    }

}
