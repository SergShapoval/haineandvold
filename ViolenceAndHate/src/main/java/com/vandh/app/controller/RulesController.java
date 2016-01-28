package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vandh.app.service.DialogService;
import com.vandh.app.service.FeedbackService;
import com.vandh.app.service.UsersService;

@Controller
public class RulesController {
	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private DialogService dialogService;
	@RequestMapping(value = "/user/rules", method = RequestMethod.GET)
	public String rulesPage(Model model, Principal principal) {
		model.addAttribute("countOfFeedbacks", this.feedbackService.checkUnreadFedbacks().size());
		model.addAttribute("countOfNewUsers", this.usersService.countOfNewUsers());
		model.addAttribute("allUserMess", this.dialogService.allNewMessForUser(principal.getName()));
		return "rules";
	}
	
	
}
