package xin.spring.news.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xin.spring.news.entity.SysUser;
import xin.spring.news.mapper.SysUserMapper;
import xin.spring.news.service.ISysUserService;
import xin.spring.news.utils.Contrant;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Override
    public String register(SysUser user, HttpServletRequest request) {
        // 校验是否存在
        SysUser one = getWrapperUserInfo(user);
        if(one != null){
            request.setAttribute("msg", "用户名: " + user.getUsername() + " 存在,不可用。");
            return "register";
        }
        user.setCreateTime(new Date());
        boolean save = this.save(user);
        if(save){
            request.getSession().setAttribute(Contrant.SESSION_USER_KEY, user);
            return "redirect:/index";
        }else {
            request.setAttribute("msg", "注册失败，未知异常请联系管理员");
            return "register";
        }
    }

    @Override
    public String login(SysUser user, HttpServletRequest request) {
        // 校验是否存在
        SysUser one = getWrapperUserInfo(user);
        if(one != null){
            if(one.getPassword().equals(user.getPassword())){
                request.getSession().setAttribute(Contrant.SESSION_USER_KEY, one);
                return "redirect:/index";
            }else{
                request.setAttribute("msg", "账号密码不正确");
                return "register";
            }
        }else{
            request.setAttribute("msg", "账号不存在");
            return "register";
        }
    }

    private SysUser getWrapperUserInfo(SysUser user) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<SysUser>();
        queryWrapper.lambda().eq(SysUser::getUsername, user.getUsername());
        return this.getOne(queryWrapper);
    }

}
