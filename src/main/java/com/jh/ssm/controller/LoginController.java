package com.jh.ssm.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jh.ssm.pojo.User;
import com.jh.ssm.service.IUserService;
import com.jh.ssm.utils.Md5Util;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	
    @Autowired
    private IUserService userService;
	/**
	 * 用户登录
	 * @param request
	 * @param model
	 * @return
	 * @throws NoSuchAlgorithmException 
	 */
	
	@RequestMapping(value="/toLogin",method=RequestMethod.POST)
	public String toLogin(HttpServletRequest request,RedirectAttributes redirectAttributes,Model model, User user) throws NoSuchAlgorithmException {
		try {
			if(user!=null) {
				//验证用户信息
				User dbUser=userService.getUserByNameOrEmail(user.getName());
				if(dbUser!=null &&dbUser.getId()!=null) {
					//验证密码
					if(Md5Util.validPassword(user.getPassword(), dbUser.getPassword())) {
						request.getSession().setAttribute("user", dbUser);
					    //跳转后台主页
						return "redirect:/home/console";
					}else {
						//密码错误
						redirectAttributes.addAttribute("pwdMsg", "密码错误");
						return "redirect:/";
					}
				}else {
					//用户不存在
					redirectAttributes.addAttribute("nameMsg", "用户不存在");
					return "redirect:/";
				}
				
			}else {
				
				 return "redirect:/";
			}
	   }catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	   }
		return "redirect:/";
	}
	
	/**
	 * 用户退出
	 * @param request
	 * @param model
	 */
	@RequestMapping("toExit")
	public void toExit(HttpServletRequest request,HttpServletResponse response) {
		try {
			HttpSession session=request.getSession();
			if(session!=null) {
				session.removeAttribute("user");
			}
			response.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
