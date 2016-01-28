package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vandh.app.models.Users;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.FeedbackService;
import com.vandh.app.service.UsersService;

@Controller
public class NewUsersListPageController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private DialogService dialogService;
	@RequestMapping(value = "/admin/newusers", method = RequestMethod.GET)
	public String newUsersListPage(Model model, Principal principal) {
		model.addAttribute("countOfNewUsers", this.usersService.countOfNewUsers());
		model.addAttribute("users", new Users());
		model.addAttribute("listNewUsers", this.usersService.listNewUsers());
		model.addAttribute("countOfFeedbacks", this.feedbackService.checkUnreadFedbacks().size());
		model.addAttribute("allUserMess", this.dialogService.allNewMessForUser(principal.getName()));
		this.usersService.checkNewUsers();
		return "newUsersList";
	}
	
	
	
}
