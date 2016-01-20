package com.vandh.app.service;

import java.util.List;
import com.vandh.app.models.Users;

public interface UsersService {
	public void addUser(Users user);

	public void removeUser(String username);

	public List<Users> userInfo(String username);

	public List<Users> listUsers();

	public List<Users> listUsersSort(String weight, String gender, String place, String ageTo, String currentUser);

	public void restorePassUser(String toAddress, String newPassword);

	public void confirmUserAccount(String username);

	public void addUserAvatar(String username, String photoPath);

	public boolean checkingEmail(String email);
	
	public void updateUserInfo(String email, String password, String age, String height, String weight, String sport, String place, String username);
}
