package com.vandh.app.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vandh.app.models.Dialog;
import com.vandh.app.models.Message;
import com.vandh.app.models.Users;


@Repository("messageDao")
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addMessage(Message message) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(message);
		tx.commit();

	}

	@Override
	public void removeMessage(int idmessage) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Message message = (Message) session.load(Message.class, new Integer(idmessage));
		if (null != message) {
			session.delete(message);
			tx.commit();
		}

	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> listMessagesForUser(int iddialog) {
		String query="select message.idmessage, message.iddialog, message.text, message.date from message where message.iddialog=%s";
		Session session = null;
		session = sessionFactory.openSession();
		List<Message> messageList = session.createSQLQuery(String.format(query, iddialog)).addEntity(Message.class).list();
		session.close();
		session = null;
		return messageList;

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> lastMessageFromDialog(int iddialog) {
		String query="SELECT * FROM message where iddialog=%s ORDER BY idmessage DESC LIMIT 1 ";
		Session session = null;
		session = sessionFactory.openSession();
		List<Message> lastMessageList = session.createSQLQuery(String.format(query, iddialog)).addEntity(Message.class).list();
		session.close();
		session = null;
		return lastMessageList;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> messageHistory(String usernameReciever, String usernameSender) {
		String query="SELECT message.iddialog, message.idmessage, message.text, message.date FROM message, dialog where dialog.username LIKE '%s' and dialog.reciever LIKE '%s' OR dialog.username LIKE '%s' and dialog.reciever LIKE '%s' ";
		Session session = null;
		session = sessionFactory.openSession();
		List<Message> fullMessageHistory = session.createSQLQuery(String.format(query, usernameSender, usernameReciever, usernameReciever, usernameSender)).addEntity(Message.class).list();
		session.close();
		session = null;
		return fullMessageHistory;
	}
	
	
	

}
