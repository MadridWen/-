package cn.edu.hrbu.mall.ums.service.impl;

import cn.edu.hrbu.mall.ums.entity.Member;
import cn.edu.hrbu.mall.ums.mapper.MemberMapper;
import cn.edu.hrbu.mall.ums.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author Madrid Wen
 * @since 2024-03-27
 */
@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {

}
