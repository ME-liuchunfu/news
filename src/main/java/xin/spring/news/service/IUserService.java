package xin.spring.news.service;

import com.baomidou.mybatisplus.extension.service.IService;
import xin.spring.news.entity.User;

import javax.servlet.http.HttpServletRequest;

public interface IUserService extends IService<User>{

    /**
     * 注册
     * @param user
     * @param request
     * @return
     */
    String register(User user, HttpServletRequest request);

    /**
     * 登录
     * @param user
     * @param request
     * @return
     */
    String login(User user, HttpServletRequest request);

}
