package xin.spring.news.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import xin.spring.news.entity.Customer;
import xin.spring.news.mapper.CustomerMapper;
import xin.spring.news.service.ICustomerService;

@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

	public Customer findCustomerById(Integer id) {
		return baseMapper.findCustomerById(id);
	}

	public boolean insertCustomer(Customer customer) {
		boolean flag = false;
		flag = baseMapper.insertCustomer(customer);
		return flag;
	}
	
}
