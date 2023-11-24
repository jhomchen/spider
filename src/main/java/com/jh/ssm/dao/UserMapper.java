package com.jh.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jh.ssm.pojo.User;

public interface UserMapper {
    
    public User selectByPrimaryKey(int userId);
    
    
    public List<User> selectAllList();
    
    
    public User selectUserByNameOrEmail(@Param("name")String param);
    
    
    public User selectUserByNameOrEmailAndPassword(User user);
}