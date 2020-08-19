package com.hk.todayworkwork.dao;

import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.todayworkwork.dto.Com_customerDTO;
import com.hk.todayworkwork.dto.CustomerDTO;

@Repository
public class LoginDAO {

	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	SqlSession sqlSession;

	public String checkLoginCustomer(String id, String pw) {
		List<CustomerDTO> list = sqlSession.selectList("login.selectCustomer");
		if(list!=null) {
			if(list.get(0).getPW().equals(pw)) {
				return "success";
			}
			return "pw_fail";
		}
		else{
			return "id_fail";
		}
	}

	public String checkLoginCom_customer(String id, String pw) {
		List<Com_customerDTO> list = sqlSession.selectList("login.selectCustomer");
		if(list!=null) {
			if(list.get(0).getPW().equals(pw)) {
				return "success";
			}
			return "pw_fail";
		}
		else{
			return "id_fail";
		}
	}

	public void signUpCustomer(String id, String pw, String name, String tel, String addr, String email) {
		CustomerDTO dto = new CustomerDTO(id,pw,name,addr,email,tel);
		sqlSession.insert("login.insertCustomer",dto);
		
	}
	public void signUpCom_Customer(String id, String pw, String name, String tel, String addr, String email,String com_name,String com_num,String com_addr,String com_tel) {
		Com_customerDTO dto = new Com_customerDTO(id,pw,name,addr,com_name,com_addr,com_num,tel,com_tel,email);
		sqlSession.insert("login.insertCom_Customer",dto);
		
	}
	
}
