package cn.edu.hrbu.mall.util;

import io.jsonwebtoken.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class JwtUtil {
    private final String SALT = "HRBU2024"; // 盐，密钥
    /**
     * 用于签发令牌的方法，生成JWT
     * @param claims 自定义属性
     * @return JWT，令牌
     */
    public String create(long exp, Map<String, Object> claims) {
        JwtBuilder jwtBuilder = Jwts.builder();
        jwtBuilder.setId(UUID.randomUUID().toString()); // 设置唯一编号
        jwtBuilder.setIssuer("小张"); // 设置签发者
        jwtBuilder.setSubject("在线商城用户"); // 设置主题，设置面向的用户
//        long exp = 300 * 1000; // 设置过期时间，5分钟
        long now = System.currentTimeMillis(); // 当前时间
        jwtBuilder.setIssuedAt(new Date()); // 设置签发时间
        jwtBuilder.setExpiration(new Date(now + exp)); // 设置过期时间
//        jwtBuilder.setNotBefore(); // 设置在什么时间之前，该JWT都是不可用的
        jwtBuilder.setClaims(claims); // 自定义属性
        // 设置加密算法和密钥（盐）
        jwtBuilder.signWith(SignatureAlgorithm.HS256, SALT);
        // 签发令牌，生成token
        return jwtBuilder.compact();
    }

    /**
     * 用于解析JWT，验证token
     * @param token JWT，令牌
     * @return 解析后的自定义属性
     */
    public Map<String, Object> parse(String token) {
        JwtParser jwtParser = Jwts.parser().setSigningKey(SALT);
        try {
            Jwt jwt = jwtParser.parse(token);
            Claims claims = (Claims) jwt.getBody();
            return claims;
        } catch (Exception e) {
            Map result = new HashMap<>();
            result.put("code", 401);
            result.put("message", "解析失败：" + e.getMessage());
            return result;
        }

    }
}
