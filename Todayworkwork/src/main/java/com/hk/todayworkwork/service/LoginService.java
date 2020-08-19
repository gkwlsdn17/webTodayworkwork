package com.hk.todayworkwork.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.todayworkwork.dao.LoginDAO;
import com.hk.todayworkwork.dto.Com_customerDTO;
import com.hk.todayworkwork.dto.CustomerDTO;

@Service
public class LoginService {

	@Autowired
	LoginDAO loginDao;

	public String checkLoginCustomer(String id, String pw) {
		
		return loginDao.checkLoginCustomer(id,pw);
		
		
	}
	public String checkLoginCom_customer(String id, String pw) {
		
		return loginDao.checkLoginCom_customer(id,pw);
		
	}
	
	public void signUpCustomer(String id, String pw, String name, String tel, String addr, String email) {
		loginDao.signUpCustomer(id, pw, name, tel, addr, email);
	}
	public void signUpCom_Customer(String id, String pw, String name, String tel, String addr, String email, String com_name, String com_num, String com_addr, String com_tel) {
		loginDao.signUpCom_Customer(id, pw, name, tel, addr, email, com_name, com_num, com_addr, com_tel);
		
	}
	
}
