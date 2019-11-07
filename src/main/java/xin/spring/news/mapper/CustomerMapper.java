package xin.spring.news.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import xin.spring.news.entity.Customer;

public interface CustomerMapper extends BaseMapper<Customer>{

	/**
	 * 根据id查询customer
	 * @param id
	 * @return
	 */
	Customer findCustomerById(Integer id);
	
	/**
	 * 添加customer
	 * @param customer
	 * @return
	 */
	boolean insertCustomer(Customer customer);
	
}
