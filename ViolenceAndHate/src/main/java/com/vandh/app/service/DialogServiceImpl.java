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
	}
;
	@Override
	public int findExistingDialog(String username, String reciever) {
		// TODO Auto-generated method stub
		return this.dialogDao.findExistingDialog(username, reciever);
	}

	@Override
	public List<Dialog> listDialog(String username) {
		return this.dialogDao.listDialog(username);
	}

}
