package cn.edu.hrbu.mall.ums.service.impl;

import cn.edu.hrbu.mall.ums.entity.AdminLoginLog;
import cn.edu.hrbu.mall.ums.mapper.AdminLoginLogMapper;
import cn.edu.hrbu.mall.ums.service.IAdminLoginLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 后台用户登录日志表 服务实现类
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Service
public class AdminLoginLogServiceImpl extends ServiceImpl<AdminLoginLogMapper, AdminLoginLog> implements IAdminLoginLogService {

}
