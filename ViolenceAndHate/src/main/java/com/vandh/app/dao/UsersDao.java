package com.vandh.app.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vandh.app.models.Users;

public interface UsersDao {
	public void addUser(Users user);

	public void removeUser(String username);

	public List<Users> userInfo(String username);

	public List<Users> listUsers();

	public List<Users> listUsersSort(String weight, String gender, String place, String ageTo);

	public void restorePassUser(String toAddress, String newPassword);

	public void confirmUserAccount(String username);

	public void addUserAvatar(String username, String photoPath);

	public boolean checkingEmail(String email);

	public void updateUserInfo(String age, String height, String weight, String sport, String place, String username);

	public void updateUserAccount(String email, String password, String username);

}
