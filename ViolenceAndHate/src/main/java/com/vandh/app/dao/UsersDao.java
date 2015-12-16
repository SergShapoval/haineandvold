package com.vandh.app.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vandh.app.models.Users;

public interface UsersDao {
	public void addUser(Users user);

	public void removeUser(String username);

	public void updateUser(Users user);

	public List<Users> userInfo(String username);

	public List<Users> listUsers();

	public List<Users> listUsersSort(String weight,String gender, String place, String ageTo);
	
	public String restorePassUser(String toAddress);
	
	

}
