package com.vandh.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vandh.app.dao.DialogDao;
import com.vandh.app.models.Dialog;

@Service("dialogService")
public class DialogServiceImpl implements DialogService {

	@Autowired
	private DialogDao dialogDao;

	@Override
	@Transactional
	public void addDialog(Dialog dialog) {
		this.dialogDao.addDialog(dialog);

	}

	@Override
	@Transactional
	public void removeDialog(int iddialog) {
		this.dialogDao.removeDialog(iddialog);
	};

	@Override
	@Transactional
	public int findExistingDialog(String username, String reciever) {
		// TODO Auto-generated method stub
		return this.dialogDao.findExistingDialog(username, reciever);
	}

	@Override
	@Transactional
	public List<Dialog> listDialogUserSender(String username) {
		return this.dialogDao.listDialogUserSender(username);
	}

	@Override
	@Transactional
	public List<Dialog> listDialogUserReciever(String username) {
		return this.dialogDao.listDialogUserReciever(username);
	}

	@Override
	@Transactional
	public String usernameDialogWith(int iddialog, String currentUser) {

		return this.dialogDao.usernameDialogWith(iddialog, currentUser);
	}

	@Override
	@Transactional
	public void updateUnreadMessInfo(int iddialog, String username) {
		this.dialogDao.updateUnreadMessInfo(iddialog, username);

	}

	@Override
	@Transactional
	public void readMess(int iddialog, String username) {
		this.dialogDao.readMess(iddialog, username);

	}

	@Override
	public int allNewMessForUser(String username) {
		return this.dialogDao.allNewMessForUser(username);
	}

}
