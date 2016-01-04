package com.vandh.app.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CsrfAuthenticationStrategy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.vandh.app.models.Users;

@Repository("usersDao")
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SessionFactory sessionFactory;

	private MailSender mailSender;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	public void addUser(Users user) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();

	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void removeUser(String username) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Users u = (Users) session.load(Users.class, new String(username));
		if (null != u) {
			session.delete(u);
			tx.commit();
		}
	
	}

	@Override
	public void updateUser(Users user) {

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsers() {
		Session session = null;

		session = sessionFactory.openSession();
		// Session session = this.sessionFactory.getCurrentSession();
		List<Users> usersList = session.createSQLQuery("select*from users").addEntity(Users.class).list();
		session.close();
		session = null;
		return usersList;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> userInfo(String username) {
		Session session = null;
		session = sessionFactory.openSession();
		String query = "select users.username, users.password, users.name, users.enabled, users.surname, users.email, users.gender, users.age, users.weight, users.height, users.sport, users.place, users.photo from users where users.username LIKE '%s'";
		List<Users> userInfoList = session.createSQLQuery(String.format(query, username)).addEntity(Users.class).list();
		session.close();
		session = null;
		return userInfoList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsersSort(String weight, String gender, String place, String ageTo) {

		String query = "select users.username, users.password, users.name, users.enabled, users.surname, users.email, users.gender, users.age, users.weight, users.height, users.sport, users.place, users.photo from users where users.enabled = true";
		if (weight.isEmpty() == false) {
			String weightParam = " AND users.weight <= " + weight;
			query = query.concat(weightParam);
			System.out.println(query);
		}
		if (gender.isEmpty() == false) {
			String genderParam = " AND  users.gender LIKE " +"'"+gender+"'";
			query = query.concat(genderParam);
			System.out.println(query);
		}

		if (place.isEmpty() == false) {
			String placeParam = " AND users.place LIKE " +"'"+place+"'";
			query = query.concat(placeParam);
			System.out.println(query);
		}
		if (ageTo.isEmpty() == false) {
			String age = " AND users.age <= " + ageTo;
			query = query.concat(age);
			System.out.println(query);
		}
		System.out.println("FINAL QUERY IS: "+query);
		Session session = null;
		session = sessionFactory.openSession();
		List<Users> usersList = session.createSQLQuery(query).addEntity(Users.class).list();
		session.close();
		session = null;
		for(int i=0;i<usersList.size();i++)
		{
			System.out.println(usersList.get(i).getName());
		}
		
		return usersList;
	}

	@Override
	public void restorePassUser(String toAddress, String newPassword) {
		String query = "UPDATE users SET users.password = '%s' WHERE users.email LIKE '%s'";
		Session session = null;
		session = sessionFactory.openSession();
		session.createSQLQuery(String.format(query, newPassword, toAddress)).addEntity(Users.class).executeUpdate();
		session.close();
		session=null;

	}

	@Override
	public void confirmUserAccount(String username) {
		String query = "UPDATE users SET users.enabled = 1 WHERE users.username LIKE '%s'";
		Session session = null;
		session = sessionFactory.openSession();
		session.createSQLQuery(String.format(query, username)).addEntity(Users.class).executeUpdate();
		session.close();
		session=null;
	}

}