package xin.spring.news.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("sys_news")
public class SysNews implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * CREATE TABLE `sys_news` (
     *   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
     *   `pic_url` varchar(255) DEFAULT NULL COMMENT '表图',
     *   `title` varchar(255) DEFAULT NULL COMMENT '标题',
     *   `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
     *   `reading_nu` bigint(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
     *   `types` varchar(255) DEFAULT NULL COMMENT '类型',
     *   `source_from` varchar(255) DEFAULT NULL COMMENT '来源',
     *   `content` text COMMENT '新闻内容',
     *   `author` varchar(64) DEFAULT NULL COMMENT '笔者信息',
     *   `to_top` char(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
     *   PRIMARY KEY (`id`)
     * ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻信息';
     */

    @TableId(type = IdType.AUTO)
    @TableField(value = "id")
    private Long id;

    @TableField(value = "pic_url")
    private String picUrl;

    @TableField(value = "title")
    private String title;

    @TableField(value = "publish_time")
    private Date publishTime;

    @TableField(value = "reading_nu")
    private Long readingNu;

    @TableField(value = "types")
    private String types;

    @TableField(value = "source_from")
    private String sourceFrom;

    @TableField(value = "content")
    private String content;

    @TableField(value = "author")
    private String author;

    @TableField(value = "to_top")
    private  String toTop;

}
