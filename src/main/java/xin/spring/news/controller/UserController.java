package xin.spring.news.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.spring.news.entity.User;
import xin.spring.news.service.IUserService;
import xin.spring.news.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService userService;

    @ResponseBody
    @RequestMapping("list")
    public R list(){
        List<User> list = userService.list();
        return R.ok(list);
    }

    @RequestMapping("register")
    public String register(User user, HttpServletRequest request){
        return userService.register(user, request);
    }

    @RequestMapping("login")
    public String login(User user, HttpServletRequest request){
        return userService.login(user, request);
    }

}
