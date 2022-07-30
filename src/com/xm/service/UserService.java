package com.xm.service;

import com.xm.bean.Login;
import com.xm.bean.User;
import com.xm.dao.UserDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	UserDao userDao;

	public Login getUser(String id, String pwd) {
		return userDao.getUser(id, pwd);
	}

	public User getUserByID(String id) {
		return userDao.getUserByID(id);
	}

	public User getUserByName(String name) {
		return userDao.getUserByName(name);
	}

	public List<User> getAll() {
		return userDao.getAll();
	}

	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	public int delLogin(String id) {
		return userDao.deleteLogin(id);
	}

	public Login getLoginByID(String id) {
		return userDao.getLoginByID(id);
	}

	public boolean resetPwd(String id, String pwd) {
		if (userDao.resetPwd(id, pwd) == 1)
			return true;
		else
			return false;
	}

	public int addNewLoginer(String uid, String pwd) {
		return userDao.addNewLoginer(new Login(uid,pwd,1));
	}

	public int updateLoginLimit(String uid, int limit) {
		return userDao.updateLoginLimit(uid,limit);
		
	}
}
