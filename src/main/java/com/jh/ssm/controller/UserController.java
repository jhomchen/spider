package com.jh.ssm.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.ssm.pojo.User;
import com.jh.ssm.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
    @Autowired
    private IUserService userService;
    
    
    @RequestMapping("userInfo")
    public String toUserInfo(HttpServletRequest request, Model model){
        
        return "userInfo";
    }
    
    
    /**
     * 获取所有用户信息
     * @param request
     * @param model
     */
    @RequestMapping("getAllUser")
    @ResponseBody
    public List<User> toAllUserInfo(HttpServletRequest request, Model model) {
    	
    	List<User> list=userService.getAllUser();
    	
    	return list;
    }

}