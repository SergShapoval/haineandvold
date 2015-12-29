package com.vandh.app.service;

import java.util.List;

import com.vandh.app.models.Dialog;

public interface DialogService {
	public void addDialog(Dialog dialog);

	public void removeDialog(int iddialog);
	public int findExistingDialog(String username, String reciever); 
	public List<Dialog> listDialog(String username);
	
}

