package com.vandh.app.dao;

import java.util.List;

import com.vandh.app.models.Feedback;

public interface FeedbackDao {

	public void addFeedback(Feedback feedback);
	public void removeFeedback(int idfeed);
	public	List<Feedback> listFeedback();
	public List<Feedback> checkUnreadFedbacks();
	public void updateReadFeedbacks();
}
