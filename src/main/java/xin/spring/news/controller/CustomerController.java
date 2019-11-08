package xin.spring.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import xin.spring.news.entity.Customer;
import xin.spring.news.service.ICustomerService;

//客户controller控制类
@Controller
public class CustomerController {

	@Autowired
	private ICustomerService iCustomerService;
	
	//通过客户id查询客户信息
	@RequestMapping(value="/findCustomerById/{id}")
	public String findCustomerById(@PathVariable Integer id, Model model){
		Customer customer = iCustomerService.findCustomerById(id);
		model.addAttribute("msg", "您查询id为："+id+"的用户信息为："+customer);
		return "first";
	}
}
