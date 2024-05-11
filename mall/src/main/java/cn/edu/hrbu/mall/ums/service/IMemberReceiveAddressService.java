package cn.edu.hrbu.mall.ums.service;

import cn.edu.hrbu.mall.ums.entity.MemberReceiveAddress;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 会员收货地址表 服务类
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
public interface IMemberReceiveAddressService extends IService<MemberReceiveAddress> {

    boolean setDefaultAddress(Integer memberId, Integer id);
}
