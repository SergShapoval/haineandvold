package com.vandh.app.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.vandh.app.controller.RegistrationController;
import com.vandh.app.models.UserRole;


@Repository("userRoleDao")
public class UserRoleDaoImpl implements UserRoleDao {

	@Autowired
	private  SessionFactory sessionFactory;
	
	private String username;
	
	
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	@Override
	public void addUserRole(UserRole userRole) {
		
		String query = "insert into user_roles(role,username) values (%s,%s)";
		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
	/*	
		Query query = sessionFactory.getCurrentSession().createSQLQuery("insert into spring_social_db.user_roles(role,username) values('ROLE_USER',"+getUsername()+")").addEntity(UserRole.class);
		//List result = query.setString(0, username).list();
		String user=getUsername();
	List res = query.setParameter(0, "ROLE_USER").list();
		query.executeUpdate();*/
		Session session = this.sessionFactory.getCurrentSession();
		System.out.println(getUsername());
		int resultSet=session.createSQLQuery(String.format(query, "'ROLE_USER'", "'"+RegistrationController.userReg+"'")).executeUpdate();
		tx.commit();
	

		
	}

}
