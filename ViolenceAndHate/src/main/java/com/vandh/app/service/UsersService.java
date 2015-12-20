package com.vandh.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vandh.app.models.Users;

public interface UsersService {
	 	public void addUser(Users user);
	    public void updateUser(Users user);
	    public void removeUser(String username);
	    public List<Users> userInfo(String username);
	    public List<Users> listUsers();
	    public	List<Users> listUsersSort(String weight, String gender, String place, String ageTo);
	    public void restorePassUser(String toAddress, String newPassword);
	    public void confirmUserAccount(String username);
}
