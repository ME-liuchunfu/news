package xin.spring.news.controller;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import xin.spring.news.entity.SysUser;
import xin.spring.news.utils.Contrant;

import javax.servlet.http.HttpServletRequest;


/**
 * 管理后台
 */
public class ManageController {

    protected static Logger logger = Logger.getLogger(ManageController.class);


    protected SysUser getUser(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        SysUser user = (SysUser) request.getSession().getAttribute(Contrant.SESSION_USER_KEY);
        return user;
    }

    public Long getUserId(){
        return getUser().getUserId();
    }

    public String getUserName(){
        return getUser().getUsername();
    }

}
