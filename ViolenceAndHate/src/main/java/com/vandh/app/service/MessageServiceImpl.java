package com.vandh.app.service;

import java.util.List;

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

	@Override
	@Transactional
	public List<Message> listMessagesForUser(int iddialog) {
		return this.messageDao.listMessagesForUser(iddialog);
	}


	@Override
	@Transactional
	public int countOfMessages(int iddialog) {
		return this.messageDao.countOfMessages(iddialog);
	}


}
