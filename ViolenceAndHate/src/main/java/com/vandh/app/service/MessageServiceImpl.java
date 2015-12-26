package com.vandh.app.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.vandh.app.models.Message;

public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageService messageService;
	
	
	@Override
	public void addMessage(Message message) {
	this.messageService.addMessage(message);

	}

	@Override
	public void removeMessage(int idmessage) {
		this.messageService.removeMessage(idmessage);
	}

}
