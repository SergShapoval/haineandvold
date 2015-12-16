package com.vandh.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vandh.app.dao.FeedbackDao;
import com.vandh.app.models.Feedback;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	private FeedbackDao feedbackDao;

	@Override
	public void addFeedback(Feedback feedback) {
		this.feedbackDao.addFeedback(feedback);

	}

	@Override
	public void removeFeedback(int idfeed) {
		this.feedbackDao.removeFeedback(idfeed);

	}

	@Override
	public List<Feedback> listFeedback() {

		return this.feedbackDao.listFeedback();
	}

}
