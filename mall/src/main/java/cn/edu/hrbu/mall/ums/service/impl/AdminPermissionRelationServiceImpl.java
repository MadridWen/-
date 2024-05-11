package cn.edu.hrbu.mall.ums.service.impl;

import cn.edu.hrbu.mall.ums.entity.AdminPermissionRelation;
import cn.edu.hrbu.mall.ums.mapper.AdminPermissionRelationMapper;
import cn.edu.hrbu.mall.ums.service.IAdminPermissionRelationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 后台用户和权限关系表(除角色中定义的权限以外的加减权限) 服务实现类
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Service
public class AdminPermissionRelationServiceImpl extends ServiceImpl<AdminPermissionRelationMapper, AdminPermissionRelation> implements IAdminPermissionRelationService {

}
