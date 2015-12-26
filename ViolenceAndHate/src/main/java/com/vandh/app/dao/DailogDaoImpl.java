package com.vandh.app.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.vandh.app.models.Dialog;
import com.vandh.app.models.Feedback;

public class DailogDaoImpl implements DialogDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addDialog(Dialog dialog) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(dialog);
		tx.commit();
		
	}

	@Override
	public void removeDialog(int iddialog) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Dialog dialog = (Dialog) session.load(Dialog.class, new Integer(iddialog));
		if (null != dialog) {
			session.delete(dialog);
			tx.commit();
		}
		
	}


}
