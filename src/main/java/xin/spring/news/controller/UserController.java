package xin.spring.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.spring.news.entity.User;
import xin.spring.news.service.IUserService;
import xin.spring.news.utils.R;
import java.util.Date;
import java.util.List;

/**
 * 用户管理
 */
@Controller
@CrossOrigin( origins = "*")
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

    @ResponseBody
    @RequestMapping("save")
    public R save(@RequestParam User user){
        user.setCreateTime(new Date());
        userService.save(user);
        return R.ok(user);
    }

}
