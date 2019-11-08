package xin.spring.news.service;

import com.baomidou.mybatisplus.extension.service.IService;
import xin.spring.news.entity.SysUser;

import javax.servlet.http.HttpServletRequest;

public interface ISysUserService extends IService<SysUser>{

    /**
     * 注册
     * @param user
     * @param request
     * @return
     */
    String register(SysUser user, HttpServletRequest request);

    /**
     * 登录
     * @param user
     * @param request
     * @return
     */
    String login(SysUser user, HttpServletRequest request);

}
