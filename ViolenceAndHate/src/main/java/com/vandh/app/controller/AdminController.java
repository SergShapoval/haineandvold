package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vandh.app.models.Users;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.FeedbackService;
import com.vandh.app.service.UsersService;





@Controller
public class AdminController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private DialogService dialogService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String listPersons(Model model, Principal principal) {
		model.addAttribute("users", new Users());
		model.addAttribute("listUsers", this.usersService.listUsers());
		model.addAttribute("countOfFeedbacks", this.feedbackService.checkUnreadFedbacks().size());
		model.addAttribute("countOfNewUsers", this.usersService.countOfNewUsers());
		model.addAttribute("allUserMess", this.dialogService.allNewMessForUser(principal.getName()));
		return "admin";
	}

	
	@RequestMapping("/remove/{username}")
	public String removePerson(@PathVariable("username") String username) {
		
		this.usersService.removeUser(username);

	return "redirect:/admin";
	}
	
	
}
