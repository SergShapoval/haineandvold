package com.vandh.app.service;

import java.util.List;

import com.vandh.app.models.Message;

public interface MessageService {
	public void addMessage(Message message);
	public void removeMessage(int idmessage);
	public List<Message> listMessagesForUser (int iddialog);
}
