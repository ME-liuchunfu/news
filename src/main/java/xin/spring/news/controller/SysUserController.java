package xin.spring.news.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.spring.news.entity.SysUser;
import xin.spring.news.service.ISysUserService;
import xin.spring.news.utils.R;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/user/")
public class SysUserController extends ManageController {

    @Autowired
    private ISysUserService userService;

    @ResponseBody
    @RequestMapping("listAjax")
    public R listAjax(){
        List<SysUser> list = userService.list();
        return R.ok(list);
    }

    @RequestMapping("list")
    public String list(@RequestParam(name = "key", required = false)String key, HttpServletRequest request){
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        if(key != null && !"".equals(key)){
            queryWrapper.lambda().likeRight(SysUser::getUsername, key);
        }
        queryWrapper.lambda().ne(SysUser::getUsername, getUserName());
        List<SysUser> list = userService.list(queryWrapper);
        request.setAttribute("list", list);
        logger.info("用户列表 ：{}" + list);
        return "/manage/user/list";
    }

    @ResponseBody
    @RequestMapping("delete")
    public R delete(Long userId){
        logger.info("params：{}" + userId);
        userService.removeById(userId);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("save")
    public R save(SysUser user){
        user.setCreateTime(new Date());
        user.setStatus(0);
        userService.save(user);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("update")
    public R update(SysUser user){
        userService.saveOrUpdate(user);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("checkUsername")
    public R checkUsername(String username){
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<SysUser>();
        queryWrapper.lambda().eq(SysUser::getUsername, username);
        SysUser one = userService.getOne(queryWrapper);
        return one != null ? R.error("用户名存在，当前用户名不可用") : R.ok();
    }

    @ResponseBody
    @RequestMapping("info")
    public R info(Long userId){
        SysUser user = userService.getById(userId);
        return user != null ? R.ok(user) : R.error();
    }

    @RequestMapping("register")
    public String register(SysUser user, HttpServletRequest request){
        return userService.register(user, request);
    }

    @RequestMapping("login")
    public String login(SysUser user, HttpServletRequest request){
        return userService.login(user, request);
    }

}
