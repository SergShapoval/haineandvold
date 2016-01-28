package com.vandh.app.service;

import java.util.List;

import com.vandh.app.models.Feedback;

public interface FeedbackService {
	public void addFeedback(Feedback feedback);
	public void removeFeedback(int idfeed);
	public	List<Feedback> listFeedback();
	public List<Feedback> checkUnreadFedbacks();
	public void updateReadFeedbacks();
}
