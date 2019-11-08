package xin.spring.news.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import xin.spring.news.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 新闻信息管理控制器
 */
@RequestMapping("/news/")
public class NewsController extends ManageController {


    @RequestMapping("list")
    public String list(@RequestParam(name = "key", required = false)String key, HttpServletRequest request){
//        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
//        if(key != null && !"".equals(key)){
//            queryWrapper.lambda().likeRight(User::getUsername, key);
//        }
//        queryWrapper.lambda().ne(User::getUsername, getUserName());
//        List<User> list = userService.list(queryWrapper);
//        request.setAttribute("list", list);
//        logger.info("用户列表 ：{}" + list);
        return "/manage/news/list";
    }

}
