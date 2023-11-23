package com.jh.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jh.ssm.pojo.User;
import com.jh.ssm.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
    @Autowired
    private IUserService userService;
    
    
    @RequestMapping("showUser")
    public String toIndex(HttpServletRequest request, Model model){
        
        int userId = 1;
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        return "showUser";
    }

}