package com.vandh.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vandh.app.dao.MessageDao;
import com.vandh.app.models.Message;


@Service("messageService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;
	
	
	@Override
	@Transactional
	public void addMessage(Message message) {
	this.messageDao.addMessage(message);

	}

	@Override
	@Transactional
	public void removeMessage(int idmessage) {
		this.messageDao.removeMessage(idmessage);
	}

}
