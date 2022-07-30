package com.xm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xm.bean.Login;
import com.xm.bean.User;

public interface UserDao {

	public Login getUser(@Param("id") String id, @Param("pwd") String pwd);

	public User getUserByID(String id);

	public User getUserByName(String name);

	public Login getLoginByID(String id);

	public List<User> getAll();

	public void addUser(User user);

	public int deleteLogin(String id);

	public int updateUser(User user);

	public int resetPwd(@Param("id") String id, @Param("pwd") String pwd);

	public int addNewLoginer(Login login);

	public int updateLoginLimit(String uid, int limit);

}
