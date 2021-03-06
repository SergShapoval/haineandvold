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


	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsers() {
		Session session = null;
		session = sessionFactory.openSession();
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
		String query = "select users.username, users.checkusr, users.password, users.name, users.enabled, users.surname, users.email, users.gender, users.age, users.weight, users.height, users.sport, users.place, users.photo from users where users.username LIKE '%s'";
		List<Users> userInfoList = session.createSQLQuery(String.format(query, username)).addEntity(Users.class).list();
		session.close();
		session = null;
		return userInfoList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsersSort(String weight, String gender, String place, String ageTo, String currentUser) {

		String query = "select users.username, users.checkusr, users.password, users.name, users.enabled, users.surname, users.email, users.gender, users.age, users.weight, users.height, users.sport, users.place, users.photo from users where users.enabled = true";
		if (weight.isEmpty() == false) {
			String weightParam = " AND users.weight <= " + weight;
			query = query.concat(weightParam);
			System.out.println(query);
		}
		if (gender.isEmpty() == false) {
			String genderParam = " AND  users.gender LIKE " + "'" + gender + "'";
			query = query.concat(genderParam);
			System.out.println(query);
		}

		if (place.isEmpty() == false) {
			String placeParam = " AND users.place LIKE " + "'" + place + "'";
			query = query.concat(placeParam);
			System.out.println(query);
		}
		if (ageTo.isEmpty() == false) {
			String age = " AND users.age <= " + ageTo;
			query = query.concat(age);
			System.out.println(query);
		}
		String withoutUser=" AND users.username NOT LIKE "+"'"+currentUser+"'";
		query=query.concat(withoutUser);
		System.out.println("FINAL QUERY IS: " + query);
		Session session = null;
		session = sessionFactory.openSession();
		List<Users> usersList = session.createSQLQuery(query).addEntity(Users.class).list();
		session.close();
		session = null;
		for (int i = 0; i < usersList.size(); i++) {
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
		session = null;

	}

	@Override
	public void confirmUserAccount(String username) {
		String query = "UPDATE users SET users.enabled = 1 WHERE users.username LIKE '%s'";
		Session session = null;
		session = sessionFactory.openSession();
		session.createSQLQuery(String.format(query, username)).addEntity(Users.class).executeUpdate();
		session.close();
		session = null;
	}

	@Override
	public void addUserAvatar(String username, String photoPath) {
		String query = "UPDATE users SET users.photo = '%s' WHERE users.username LIKE '%s'";
		Session session = null;
		session = sessionFactory.openSession();
		session.createSQLQuery(String.format(query, photoPath, username)).addEntity(Users.class).executeUpdate();
		session.close();
		session = null;

	}

	@Override
	public boolean checkingEmail(String email) {
		String query = "SELECT*FROM users where users.email LIKE '%s'";

		List<Users> listUsersWithEmail;
		Session session = null;
		session = sessionFactory.openSession();
		listUsersWithEmail = session.createSQLQuery(String.format(query, email)).addEntity(Users.class).list();
		session.close();
		session = null;
		try {
			String existingEmail = listUsersWithEmail.get(0).getEmail();
			if (existingEmail.equals(email)) {
				System.out.println("EMAIL EXISTS! TRUE");
				return true;
			}
		} catch (IndexOutOfBoundsException exception) {
			System.out.println("EMAIL DOESN'T EXISTS");
			return false;
		}
		return true;
	}

	@Override
	public void updateUserInfo(String email, String password, String age, String height, String weight, String sport, String place, String username) {
		String query = "UPDATE users SET users.enabled=1";
		if(email.isEmpty()==false)
		{
			String emailUpdate = ", users.email="+"'"+email+"'";
			query=query.concat(emailUpdate);
			System.out.println(query);
		}
		if(password.isEmpty()==false)
		{
			String passwordUpdate=", users.password="+"'"+encoder.encode(password)+"'";
			query=query.concat(passwordUpdate);
			System.out.println(query);
		}
		if(age.isEmpty()==false)
		{
			String ageUpdate=", users.age="+"'"+age+"'";
			query=query.concat(ageUpdate);
			System.out.println("QUERY IS: "+query);
		}
		if(height.isEmpty()==false)
		{
			String hightUpdate=", users.height="+"'"+height+"'";
			query=query.concat(hightUpdate);
			System.out.println("QUERY IS: "+query);
		}
		if(weight.isEmpty()==false)
		{
			String weightUpdate=", users.weight= "+"'"+weight+"'";
			query=query.concat(weightUpdate);
			System.out.println("QUERY IS: "+query);
		}
		if(sport.isEmpty()==false)
		{
			String sportUpdate=", users.sport="+"'"+sport+"'";
			query=query.concat(sportUpdate);
			System.out.println("QUERY IS: "+query);
		}
		if(place.isEmpty()==false)
		{
			String placeUpdate=", users.place="+"'"+place+"'";
			query=query.concat(placeUpdate);
			System.out.println("QUERY IS: "+query);
		}
		
		query=query.concat(" WHERE users.username LIKE "+"'"+username+"'");
		System.out.println("FULL QUERY: "+query);
		Session session = null;
		session = sessionFactory.openSession();
		session.createSQLQuery(query).addEntity(Users.class).executeUpdate();
		session.close();
		session = null;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listNewUsers() {
		Session session = null;
		session = sessionFactory.openSession();
		List<Users> newUsersList = session.createSQLQuery("select*from users where users.checkusr=0").addEntity(Users.class).list();
		session.close();
		session = null;
		return newUsersList;
		
	}

	@Override
	public void checkNewUsers() {
		Session session = null;
		session = sessionFactory.openSession();
		session.createSQLQuery("UPDATE users SET users.checkusr=1 WHERE users.checkusr=0").addEntity(Users.class).executeUpdate();
		session.close();
		session = null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int countOfNewUsers() {
		Session session = null;
		session = sessionFactory.openSession();
		List<Users> newUsersList = session.createSQLQuery("select*from users where users.checkusr=0").addEntity(Users.class).list();
		session.close();
		session = null;
		return newUsersList.size();
	}
	
	

}