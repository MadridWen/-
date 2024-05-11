package cn.edu.hrbu.mall.intercepter;

import cn.edu.hrbu.mall.util.JwtUtil;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Component
@ConfigurationProperties(prefix = "auth")
public class GlobalAuthInterceptor implements HandlerInterceptor{
    // 需要排除的路径(放行的路径)
    private List<String> excludePaths;

    public void setExcludePaths(List<String> excludePaths) {
        this.excludePaths = excludePaths;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
//        System.out.println(uri);
        if (excludePaths.contains(uri)) {
            return true;
        }
        // 从请求头中，获取token
        String token = request.getHeader("Authorization");
        JwtUtil jwtUtil = new JwtUtil();
        // 解析token
        if (StringUtils.isEmpty(token)){
            response.setStatus(401);
            return false;
        }
        Map<String, Object> result = jwtUtil.parse(token);
//        System.out.println(token);
        if (result.get("code") != null && result.get("code").equals(401)){
            response.setStatus(401);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("没有访问权限");
            return false;
        } else {
            return true;
        }
    }
}
