package com.jh.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台主页
 */
@Controller
@RequestMapping("/home")
public class BaseHomeController {
	
	
	@RequestMapping("console")
	public String toConsole(HttpServletRequest request, Model model) {
		
		return "console";
	}
	
	@RequestMapping("toHome")
	public String toHome(HttpServletRequest request, Model model) {
		
		return "home";
	}

}
