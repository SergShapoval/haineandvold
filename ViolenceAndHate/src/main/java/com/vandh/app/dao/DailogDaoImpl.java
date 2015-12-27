package com.vandh.app.dao;

import java.util.List;

import javax.xml.bind.ParseConversionEvent;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vandh.app.models.Dialog;
import com.vandh.app.models.Feedback;

@Repository("dialogDao")
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

	@SuppressWarnings("unchecked")
	@Override
	public int findExistingDialog(String username, String reciever) {
		System.out.println("SENDER: " + username);
		System.out.println("RECIEVER:" + reciever);
		Session session = null;
		String query = "SELECT*from dialog where (dialog.username like '%s') and (dialog.reciever like '%s') or (dialog.username like '%s') and (dialog.reciever like '%s')";
		session = sessionFactory.openSession();
		List<Dialog> dialog = session.createSQLQuery(String.format(query, username, reciever, reciever, username))
				.addEntity(Dialog.class).list();
		session.close();
		session = null;
		System.out.println("LIST SIZE: " + dialog.size());
		if (dialog.size() == 0) {
			System.out.println("NO DIALOG FOUND!!!!!!!");
			return 0;
			
		} else {

			int result = dialog.get(0).getIddialog();
			System.out.println("DIALOG ID: " + result);
			return result;
		}
	}
}
