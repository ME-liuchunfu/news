package xin.spring.news.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("sys_comments")
public class SysComments implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * CREATE TABLE `comments` (
     *   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
     *   `news_id` bigint(20) NOT NULL COMMENT '新闻编号',
     *   `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
     *   `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
     *   `time` datetime DEFAULT NULL COMMENT '评论时间',
     *   PRIMARY KEY (`id`)
     * ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论信息';
     */

    @TableId(type = IdType.AUTO)
    @TableField(value = "id")
    private Long id;

    @TableField(value = "news_id")
    private Long newsId;

    @TableField(value = "user_id")
    private Long userId;

    @TableField(value = "content")
    private String content;

    @TableField(value = "time")
    private Date time;

    @TableField(exist = false)
    private SysNews sysNews;

    @TableField(exist = false)
    private SysUser sysUser;

}
