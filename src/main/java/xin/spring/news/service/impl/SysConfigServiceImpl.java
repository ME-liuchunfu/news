package xin.spring.news.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xin.spring.news.entity.SysConfig;
import xin.spring.news.mapper.SysConfigMapper;
import xin.spring.news.service.ISysConfigService;

@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements ISysConfigService {

}
