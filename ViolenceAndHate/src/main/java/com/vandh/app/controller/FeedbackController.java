package com.vandh.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vandh.app.models.Feedback;
import com.vandh.app.service.FeedbackService;

@Controller
public class FeedbackController {

	@Autowired
	private FeedbackService feedbackService;
	@RequestMapping(value = "/user/feedback", method = RequestMethod.GET)
	public String addFeedbackPage(Model model) {
		model.addAttribute("feedback", new Feedback());
		return "addFeedback";
	}
	@RequestMapping(value = "/user/feedback", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String addFeedback(@ModelAttribute("feedback") Feedback feedback) {
		this.feedbackService.addFeedback(feedback);
		return "addFeedback";
	}
	@RequestMapping("/removefeedback/{idfeed}")
	public String removeFeedback(@PathVariable("idfeed") int idfeed) {
		this.feedbackService.removeFeedback(idfeed);
		return "redirect:/admin/feedbacklist";
	}
	
	@RequestMapping(value = "/admin/feedbacklist", method = RequestMethod.GET)
	public String feedbackList(Model model) {
		model.addAttribute("feedback", new Feedback());
		model.addAttribute("listFeedback", feedbackService.listFeedback());
		return "feedbackList";
	}
	
	
}
