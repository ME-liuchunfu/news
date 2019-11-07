package xin.spring.news.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * Customer与数据库customer表持久化类
 */
@Data
@TableName("customer")
public class Customer implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@TableId(type=IdType.AUTO)
	private Integer id;
	
	@TableField(value = "username")
	private String username;
	
	@TableField(value = "jobs")
	private String jobs;
	
	@TableField(value = "phone")
	private String phone;

}
