package com.vandh.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vandh.app.dao.FeedbackDao;
import com.vandh.app.models.Feedback;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	private FeedbackDao feedbackDao;

	@Override
	@Transactional
	public void addFeedback(Feedback feedback) {
		this.feedbackDao.addFeedback(feedback);

	}

	@Override
	@Transactional
	public void removeFeedback(int idfeed) {
		this.feedbackDao.removeFeedback(idfeed);

	}

	@Override
	@Transactional
	public List<Feedback> listFeedback() {
		return this.feedbackDao.listFeedback();
	}

	@Override
	@Transactional
	public List<Feedback> checkUnreadFedbacks() {
		return feedbackDao.checkUnreadFedbacks();
	}

	@Override
	@Transactional
	public void updateReadFeedbacks() {
		this.feedbackDao.updateReadFeedbacks();;
	}

}
