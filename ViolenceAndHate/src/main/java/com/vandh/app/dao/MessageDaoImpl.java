package com.vandh.app.dao;

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
		Message message = (Message) session.load(Message.class, new Integer(idmessage));
		if (null != message) {
			session.delete(message);
			tx.commit();
		}

	}

}
