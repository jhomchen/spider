package com.jh.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.ssm.dao.UserMapper;
import com.jh.ssm.pojo.User;
import com.jh.ssm.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	
    @Autowired
    private UserMapper userMapper;
    
    @Override
    public User getUserById(int userId) {
    	
        return userMapper.selectByPrimaryKey(userId);
    }

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userMapper.selectAllList();
	}

	@Override
	public User getUserByNameOrEmailAndPassword(User user) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByNameOrEmailAndPassword(user);
	}

	@Override
	public User getUserByNameOrEmail(String name) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByNameOrEmail(name);
	}

}