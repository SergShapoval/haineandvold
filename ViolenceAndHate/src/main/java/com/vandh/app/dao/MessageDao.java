package com.vandh.app.dao;

import com.vandh.app.models.Message;

public interface MessageDao {
	public void addMessage(Message message);
	public void removeMessage(int idmessage);
}
