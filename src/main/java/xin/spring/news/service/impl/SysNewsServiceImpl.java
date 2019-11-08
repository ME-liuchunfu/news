package xin.spring.news.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xin.spring.news.entity.SysNews;
import xin.spring.news.mapper.SysNewsMapper;
import xin.spring.news.service.ISysNewsService;

@Service
public class SysNewsServiceImpl extends ServiceImpl<SysNewsMapper, SysNews> implements ISysNewsService {

}
