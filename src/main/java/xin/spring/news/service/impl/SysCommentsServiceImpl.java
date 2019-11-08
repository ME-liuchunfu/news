package xin.spring.news.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xin.spring.news.entity.SysComments;
import xin.spring.news.mapper.SysCommentsMapper;
import xin.spring.news.service.ISysCommentsService;

@Service
public class SysCommentsServiceImpl extends ServiceImpl<SysCommentsMapper, SysComments> implements ISysCommentsService {

}
