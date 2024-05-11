package cn.edu.hrbu.mall.ums.service.impl;

import cn.edu.hrbu.mall.ums.entity.MemberReceiveAddress;
import cn.edu.hrbu.mall.ums.mapper.MemberReceiveAddressMapper;
import cn.edu.hrbu.mall.ums.service.IMemberReceiveAddressService;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.beans.Transient;

/**
 * <p>
 * 会员收货地址表 服务实现类
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Service
public class MemberReceiveAddressServiceImpl extends ServiceImpl<MemberReceiveAddressMapper, MemberReceiveAddress> implements IMemberReceiveAddressService {
    // 重写save方法

    @Transient // 事务注解，保证该方法的原子性，要么全部成功，要么全部失败
    @Override
    public boolean saveOrUpdate(MemberReceiveAddress entity) {
//        int n = this.baseMapper.insert(entity);
        if (entity.getDefaultStatus() == 1){
            // 如果新增的地址是默认地址，需要将其他地址的默认地址状态改为0
            UpdateWrapper updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("member_id", entity.getMemberId()); // 查询条件：会员ID
            updateWrapper.eq("default_status", 1); // 查询条件：默认地址状态
//                updateWrapper.ne("id", entity.getId()); // 查询条件：地址ID不等于当前新增的地址ID
            updateWrapper.set("default_status", 0); // 将默认地址状态改为0
            this.update(updateWrapper);
        }
        // 向地址表插入当前记录
        return super.saveOrUpdate(entity);
    }

    @Transient // 事务注解，保证该方法的原子性，要么全部成功，要么全部失败
    @Override
    public boolean setDefaultAddress(Integer memberId, Integer id) {
        UpdateWrapper updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("member_id", memberId); // 查询条件：会员ID
        updateWrapper.eq("default_status", 1); // 查询条件：默认地址状态
        updateWrapper.set("default_status", 0); // 将默认地址状态改为0
        this.update(updateWrapper);

        updateWrapper.clear();
        updateWrapper.set("default_status", 1); // 将默认地址状态改为1
        updateWrapper.eq("id", id); // 查询条件：地址ID
        return this.update(updateWrapper);
    }

}
