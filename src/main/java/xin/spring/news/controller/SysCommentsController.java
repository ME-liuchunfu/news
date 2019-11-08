package xin.spring.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import xin.spring.news.service.ISysCommentsService;

@Controller
@RequestMapping("/comments/")
public class SysCommentsController {

    @Autowired
    private ISysCommentsService sysCommentsService;

}
