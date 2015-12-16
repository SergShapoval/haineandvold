package com.vandh.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vandh.app.dao.UserRoleDao;
import com.vandh.app.models.UserRole;


@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
	
	@Autowired
	private UserRoleDao userRoleDao;

	
	@Override
	@Transactional
	public void addRole(UserRole userRole) {
		this.userRoleDao.addUserRole(userRole);
	}

}
