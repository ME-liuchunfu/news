package xin.spring.news.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import xin.spring.news.entity.SysComments;
import xin.spring.news.entity.SysNews;
import xin.spring.news.entity.SysUser;
import xin.spring.news.service.ISysCommentsService;
import xin.spring.news.service.ISysNewsService;
import xin.spring.news.service.ISysUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 页面控制器
 */
@Controller
public class PageController extends ManageController{

    @Autowired
    private ISysNewsService sysNewsService;

    @Autowired
    private ISysCommentsService sysCommentsService;

    @Autowired
    private ISysUserService sysUserService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        QueryWrapper<SysNews> wrapper = new QueryWrapper<>();
        wrapper.eq("to_top","1").orderByDesc("publish_time").last(" LIMIT 4 ");
        List<SysNews> list = sysNewsService.list(wrapper);
        request.setAttribute("hotNews", list);
        QueryWrapper<SysNews> wrapperlist = new QueryWrapper<>();
        wrapperlist.lambda().orderByDesc(SysNews::getPublishTime);
        List<SysNews> list1 = sysNewsService.list(wrapperlist);
        request.setAttribute("otherNews", list1);
        return "index";
    }

    @RequestMapping("/news/see/{id}")
    public String newsSee(@PathVariable("id") Long id, HttpServletRequest request){
        logger.info("/news/see/" + id);
        SysNews sysNews = sysNewsService.getById(id);
        sysNews.setReadingNu(sysNews.getReadingNu() + 1);
        sysNewsService.saveOrUpdate(sysNews);
        QueryWrapper<SysComments> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(SysComments::getNewsId, id).orderByDesc(SysComments::getTime);
        List<SysComments> list = sysCommentsService.list(wrapper);
        if(list != null && list.size()>0){
            for(int i=0; i<list.size(); i++){
                SysComments sysComments = list.get(i);
                SysUser sysUser = sysUserService.getById(sysComments.getUserId());
                sysComments.setSysUser(sysUser);
            }
        }
        request.setAttribute("news", sysNews);
        request.setAttribute("comments", list);
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
