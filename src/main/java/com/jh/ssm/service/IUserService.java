package com.jh.ssm.service;


import java.util.List;

import com.jh.ssm.pojo.User;



public interface IUserService {
	
	
    public User getUserById(int userId);
    
    
    public List<User> getAllUser();
    
    public User getUserByNameOrEmailAndPassword(User user);
    
    public User getUserByNameOrEmail(String name);
    

}