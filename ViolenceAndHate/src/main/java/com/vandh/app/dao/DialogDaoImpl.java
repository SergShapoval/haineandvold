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
public class DialogDaoImpl implements DialogDao {
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Dialog> listDialogUserSender(String username) {
		String query = "select dialog.iddialog, dialog.username, dialog.reciever from dialog where dialog.username LIKE '%s'";
		Session session = null;
		session = sessionFactory.openSession();
		List<Dialog> dialogListSender = session.createSQLQuery(String.format(query, username)).addEntity(Dialog.class).list();
		session.close();
		session = null;
		return dialogListSender;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Dialog> listDialogUserReciever(String username) {
		String query = "select dialog.iddialog, dialog.username, dialog.reciever from dialog where dialog.reciever LIKE '%s'";
		Session session = null;
		session = sessionFactory.openSession();
		List<Dialog> dialogListReciever = session.createSQLQuery(String.format(query, username)).addEntity(Dialog.class).list();
		session.close();
		session = null;
		return dialogListReciever;
	}
	
	@Override
public String usernameDialogWith(int iddialog, String currentUser)
{	String usernameDialogWith;
	String query="select dialog.iddialog, dialog.username, dialog.reciever from dialog where dialog.iddialog=%s";
	Session session = null;
	session = sessionFactory.openSession();
	List<Dialog> dialog = session.createSQLQuery(String.format(query, iddialog)).addEntity(Dialog.class).list();
	session.close();
	session = null;
	if(dialog.get(0).getUser().getUsername().equals(currentUser))
	{
		return usernameDialogWith=dialog.get(0).getReciever();
	}
	else
	return usernameDialogWith=dialog.get(0).getUser().getUsername();
}

	
	
	
}
