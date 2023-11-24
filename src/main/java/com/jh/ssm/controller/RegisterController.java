package com.jh.ssm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jh.ssm.pojo.User;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@RequestMapping("toRegister")
	public String toRegister(HttpServletRequest request, Model model) {
		return "register";
	}
	
	
	/**
	 * 用户注册
	 * @param request
	 * @param model
	 * @param user
	 * @return
	 */
	public Map<String,String> addRegister(HttpServletRequest request, Model model,User user){
		
		
		
		
		return null;
	}

}
