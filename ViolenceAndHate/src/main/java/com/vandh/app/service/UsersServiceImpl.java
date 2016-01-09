package com.vandh.app.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.vandh.app.dao.UsersDao;
import com.vandh.app.models.Users;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao userDao;

	@Override
	@Transactional
	public void addUser(Users user) {
		this.userDao.addUser(user);

	}

	@Override
	@Transactional
	public void updateUser(Users user) {
		this.userDao.updateUser(user);

	}

	@Override
	@Transactional
	public void removeUser(String username) {
		this.userDao.removeUser(username);

	}

	@Override
	@Transactional
	public List<Users> userInfo(String username) {
		return this.userDao.userInfo(username);
	}

	@Override
	@Transactional
	public List<Users> listUsers() {
		return this.userDao.listUsers();
	}

	@Override
	@Transactional
	public List<Users> listUsersSort(String weight, String gender, String place, String ageTo) {
		return this.userDao.listUsersSort(weight, gender, place, ageTo);
	}

	@Override
	@Transactional
	public void restorePassUser(String toAddress, String newPassword) {
		this.userDao.restorePassUser(toAddress, newPassword);
	}

	@Override
	@Transactional
	public void confirmUserAccount(String username) {
		this.userDao.confirmUserAccount(username);
	}

	@Override
	@Transactional
	public void addUserAvatar(String username, String photoPath) {
		this.userDao.addUserAvatar(username, photoPath);
	}

	@Override
	public boolean checkingEmail(String email) {
		return this.userDao.checkingEmail(email);
	}

}
