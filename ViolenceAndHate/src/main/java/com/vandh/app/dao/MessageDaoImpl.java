package com.vandh.app.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vandh.app.models.Dialog;
import com.vandh.app.models.Message;

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
		Message message = (Message) session.load(Message.class, new Long(idmessage));
		if (null != message) {
			session.delete(message);
			tx.commit();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> listMessagesForUser(int iddialog) {
		String query = "select*from message where message.iddialog=%s";
		Session session = null;
		session = sessionFactory.openSession();
		List<Message> messageList = session.createSQLQuery(String.format(query, iddialog)).addEntity(Message.class)
				.list();
		session.close();
		session = null;
		return messageList;

	}

	@SuppressWarnings("unchecked")
	@Override
	public int countOfMessages(int iddialog) {
		String query = "select*from message where message.iddialog=%s";
		Session session = null;
		session = sessionFactory.openSession();
		List<Message> messageList = session.createSQLQuery(String.format(query, iddialog)).addEntity(Message.class)
				.list();
		session.close();
		session = null;
		return messageList.size();
	}
}
