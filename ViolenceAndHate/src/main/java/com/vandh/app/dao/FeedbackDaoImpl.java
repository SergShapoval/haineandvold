package com.vandh.app.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vandh.app.models.Feedback;
import com.vandh.app.models.Users;

@Repository("feedbackDao")
public class FeedbackDaoImpl implements FeedbackDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addFeedback(Feedback feedback) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(feedback);
		tx.commit();
	}

	@Override
	public void removeFeedback(int idfeed) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Feedback fb = (Feedback) session.load(Feedback.class, new Integer(idfeed));
		if (null != fb) {
			session.delete(fb);
			tx.commit();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Feedback> listFeedback() {
		Session session = null;
		session = sessionFactory.openSession();
		List<Feedback> feedbackList = session.createSQLQuery("select*from feedback").addEntity(Feedback.class).list();
		session.close();
		session = null;
		return feedbackList;
	}

}
