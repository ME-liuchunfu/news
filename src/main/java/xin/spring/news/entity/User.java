package xin.spring.news.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息
 */
@Data
@TableName("sys_user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * user_id` bigint(20) NOT NULL AUTO_INCREMENT,
     *   `username` varchar(50) NOT NULL COMMENT '用户名',
     *   `password` varchar(100) DEFAULT NULL COMMENT '密码',
     *   `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
     *   `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
     *   `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
     *   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
     */

    @TableId(type = IdType.AUTO)
    @TableField( value = "user_id")
    private Long userId;

    @TableField( value = "username")
    private String username;

    @TableField( value = "password")
    private String password;

    @TableField( value = "email")
    private String email;

    @TableField( value = "mobile")
    private String mobile;

    @TableField( value = "status")
    private Integer status;

    @TableField( value = "create_time")
    private Date createTime;

}
