package xin.spring.news.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.spring.news.entity.SysComments;
import xin.spring.news.entity.SysNews;
import xin.spring.news.entity.SysUser;
import xin.spring.news.service.ISysCommentsService;
import xin.spring.news.service.ISysNewsService;
import xin.spring.news.service.ISysUserService;
import xin.spring.news.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comments/")
public class SysCommentsController extends ManageController{

    @Autowired
    private ISysCommentsService sysCommentsService;

    @Autowired
    private ISysNewsService sysNewsService;

    @Autowired
    private ISysUserService sysUserService;

    @RequestMapping("list")
    public String list(@RequestParam(name = "key", required = false)String key, HttpServletRequest request){
        QueryWrapper<SysComments> wrapper = new QueryWrapper<>();
        if(key != null && !"".equals(key)){
            wrapper.lambda().like(SysComments::getContent, key);
        }
        wrapper.orderByDesc("time");
        List<SysComments> list = sysCommentsService.list(wrapper);
        if(list != null && list.size()>0){
            for(int i=0; i<list.size(); i++){
                SysComments sysComments = list.get(i);
                SysNews sysNews = sysNewsService.getById(sysComments.getNewsId());
                sysComments.setSysNews(sysNews);
                SysUser sysUser = sysUserService.getById(sysComments.getUserId());
                sysComments.setSysUser(sysUser);
            }
        }
        request.setAttribute("list", list);
        return "/manage/comments/list";
    }

    @ResponseBody
    @RequestMapping("delete")
    public R delete(Long id){
        boolean b = sysCommentsService.removeById(id);
        return b ? R.ok() : R.error();
    }

    @ResponseBody
    @RequestMapping("save")
    public R save(SysComments sysComments){
        sysComments.setTime(new Date());
        sysComments.setUserId(getUserId());
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("comment")
    public R comment(SysComments sysComments){
        sysComments.setUserId(getUserId());
        sysComments.setTime(new Date());
        boolean save = sysCommentsService.save(sysComments);
        return save ? R.ok(sysComments) : R.error();
    }

}
