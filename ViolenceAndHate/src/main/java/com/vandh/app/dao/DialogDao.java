package com.vandh.app.dao;

import java.util.List;

import com.vandh.app.models.Dialog;

public interface DialogDao {
	public void addDialog(Dialog dialog);
	public void removeDialog(int iddialog);
	public int findExistingDialog(String username, String reciever);
	public List<Dialog> listDialogUserSender(String username);
	public List<Dialog> listDialogUserReciever(String username);
	public String usernameDialogWith(int iddialog, String currentUser);
	
}
