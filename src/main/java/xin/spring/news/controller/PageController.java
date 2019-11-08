package xin.spring.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 页面控制器
 */
@Controller
public class PageController {

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/news/see")
    public String newsSee(){
        return "new_see";
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/index";
    }

    /**
     * 后台管理
     * @return
     */
    @RequestMapping("manage")
    public String manage(){
        return "manage/manage";
    }

}
