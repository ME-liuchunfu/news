package xin.spring.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xin.spring.news.entity.SysConfig;
import xin.spring.news.service.ISysConfigService;
import xin.spring.news.utils.R;

import java.util.List;

@RestController
@RequestMapping("/config")
public class SysConfigController {

    @Autowired
    private ISysConfigService sysConfigService;

    @RequestMapping("/save")
    public R save(SysConfig sysConfig){
        sysConfigService.save(sysConfig);
        return R.ok(sysConfig);
    }

    @RequestMapping("/list")
    public R list(){
        List<SysConfig> list = sysConfigService.list();
        return R.ok(list);
    }

}
