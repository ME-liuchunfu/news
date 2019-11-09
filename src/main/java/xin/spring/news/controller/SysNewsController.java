package xin.spring.news.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.spring.news.entity.SysNews;
import xin.spring.news.service.ISysNewsService;
import xin.spring.news.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 新闻信息管理控制器
 */
@Controller
@RequestMapping("/news/")
public class SysNewsController extends ManageController {

    @Autowired
    private ISysNewsService sysNewsService;

    @RequestMapping("list")
    public String list(@RequestParam(name = "key", required = false)String key, HttpServletRequest request){
        QueryWrapper<SysNews> queryWrapper = new QueryWrapper<SysNews>();
        if(key != null && !"".equals(key)){
            queryWrapper.lambda().like(SysNews::getTitle, key);
        }
        List<SysNews> list = sysNewsService.list(queryWrapper);
        request.setAttribute("list", list);
        logger.info("新闻列表 ：{}" + list);
        return "/manage/news/list";
    }

    @ResponseBody
    @RequestMapping("updateTop")
    public R updateTop(Long id, String toTop){
        SysNews sysNews = sysNewsService.getById(id);
        sysNews.setToTop(toTop);
        boolean b = sysNewsService.saveOrUpdate(sysNews);
        return b ? R.ok() : R.error();
    }

    @ResponseBody
    @RequestMapping("delete")
    public R delete(Long id){
        sysNewsService.removeById(id);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("update")
    public R update(SysNews sysNews){
        boolean b = sysNewsService.saveOrUpdate(sysNews);
        return b ? R.ok() : R.error();
    }

    @ResponseBody
    @RequestMapping("save")
    public R save(SysNews sysNews){
        sysNews.setPublishTime(new Date());
        boolean save = sysNewsService.save(sysNews);
        return save ? R.ok() : R.error();
    }

    @ResponseBody
    @RequestMapping("info")
    public R info(Long id){
        SysNews sysNews = sysNewsService.getById(id);
        return R.ok(sysNews);
    }

}
