package xin.spring.news.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("sys_config")
public class SysConfig implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * CREATE TABLE `sys_config` (
     *   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
     *   `name` varchar(32) NOT NULL COMMENT '类别名称',
     *   `type` char(1) NOT NULL DEFAULT '0' COMMENT '类别',
     *   PRIMARY KEY (`id`)
     * ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型配置';
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")
    private Long id;

    @TableField(value = "name")
    private String name;

    @TableField(value = "type")
    private String type;

}
