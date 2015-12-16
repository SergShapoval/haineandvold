package com.vandh.app.dao;

import javax.servlet.http.HttpSession;

import com.vandh.app.models.Users;

public interface LoginDao {

	Users findByUserName(String username);
	
	
}
