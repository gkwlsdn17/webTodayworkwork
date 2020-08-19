
package com.hk.todayworkwork;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.todayworkwork.value.CVALUES;

@Controller
public class AjaxContorller {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@RequestMapping(value = "/signUpCheck", method = RequestMethod.POST)
	@ResponseBody
	public String singup(String id) {
		System.out.println("jdbcTemp \n"+jdbcTemplate);
		System.out.println("id="+id);
		int count = jdbcTemplate.queryForInt("select count(*) from CUSTOMER where id= 'aa'");
		
		String result="";
		if(count==0) {
			result = "success";
		}
		else {
			result = "fail";
		}
		return result;
	}
	

}
