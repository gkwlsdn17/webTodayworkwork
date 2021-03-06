package com.hk.todayworkwork;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.todayworkwork.dto.Com_customerDTO;
import com.hk.todayworkwork.dto.CustomerDTO;
import com.hk.todayworkwork.dto.RecruitDTO;
import com.hk.todayworkwork.service.LoginService;
import com.hk.todayworkwork.service.RecruitService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<RecruitDTO> list = recruitService.selectAll();
		model.addAttribute("list",list);
		List<RecruitDTO> hot_list = recruitService.selectHot_list();
		model.addAttribute("hot_list",hot_list);
		List<RecruitDTO> imminent_list = recruitService.selectImminent();
		model.addAttribute("imminent_list",imminent_list);

		
		return "home";
	}
	@RequestMapping(value = "/loginProc", method = RequestMethod.POST)
	public String loginProc(Locale locale, Model model, HttpServletRequest request) {
		String chk_login = request.getParameter("chk_login");
		String id = request.getParameter("ID");
		String pw = request.getParameter("PW");
		String check="";
		
		if(chk_login.equals("개인")) {
			check = loginService.checkLoginCustomer(id, pw);
			
		}
		else if(chk_login.equals("기업")) {
			check = loginService.checkLoginCom_customer(id, pw);;
		}
		model.addAttribute("login_check",check);
		
		return "loginProc";
	}
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(Locale locale, Model model, HttpServletRequest request) {
		
		return "signUp";
	}
	@RequestMapping(value = "/signUpProc", method = RequestMethod.GET)
	public String signUpProc(Locale locale, Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		String type = request.getParameter("type");
		String com_name = request.getParameter("com_name");
		String com_num = request.getParameter("com_num");
		String com_addr = request.getParameter("com_addr");
		String com_tel = request.getParameter("com_tel");
		if(type.equals("customer")) {
			loginService.signUpCustomer(id,pw,name,tel,addr,email);
			
		}
		else if(type.equals("com_customer")) {
			loginService.signUpCom_Customer(id,pw,name,tel,addr,email,com_name,com_num,com_addr,com_tel);
		}
		
		return "home";
	}
	@RequestMapping(value = "/resumeManagement", method = RequestMethod.GET)
	public String resumeManagement(Locale locale, Model model, HttpServletRequest request) {
		
		
		return "resumeManagement";
	}
	@RequestMapping(value = "/resumeDetail", method = RequestMethod.GET)
	public String resumeDetail(Locale locale, Model model, HttpServletRequest request) {
		String r_num = request.getParameter("r_num");
//		int r_num = Integer.parseInt(request.getParameter("r_num"));
		System.out.println("r_num="+r_num);
		model.addAttribute("r_num",r_num);
		return "resumeDetail";
	}
	@RequestMapping(value = "/resumeInsert", method = RequestMethod.GET)
	public String resumeInsert(Locale locale, Model model, HttpServletRequest request) {
		
		return "resumeInsert";
	}
}
