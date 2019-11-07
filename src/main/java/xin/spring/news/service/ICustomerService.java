package xin.spring.news.service;

import com.baomidou.mybatisplus.extension.service.IService;

import xin.spring.news.entity.Customer;

public interface ICustomerService extends IService<Customer>{
	
	Customer findCustomerById(Integer id);
	
	boolean insertCustomer(Customer customer);

}
