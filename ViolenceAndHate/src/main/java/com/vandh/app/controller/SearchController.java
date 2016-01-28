package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.vandh.app.models.Users;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.FeedbackService;
import com.vandh.app.service.UsersService;

//Controller for searching and sotring users

@Controller
public class SearchController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private DialogService dialogService;
	
	@RequestMapping(value = "/user/search", method = RequestMethod.GET)
	public String searchPage(Model model, Principal principal) {
		model.addAttribute("users", new Users());
		model.addAttribute("countOfFeedbacks", this.feedbackService.checkUnreadFedbacks().size());
		model.addAttribute("countOfNewUsers", this.usersService.countOfNewUsers());
		model.addAttribute("allUserMess", this.dialogService.allNewMessForUser(principal.getName()));
		return "searchingUser";
	}

	@RequestMapping(value = "/user/search", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public String listUsersSort(
			@RequestParam(value="weight") String weight,
			@RequestParam(value="gender") String gender,
			@RequestParam(value="place") String place,
			@RequestParam(value="age") String age,
			Model model, Principal principal)
	{
		if(weight.equals("") && gender.equals("") && place.equals("") && age.equals(""))
		{
			model.addAttribute("users", new Users());
model.addAttribute("noparams", "Задайте параметры поиска");
return "searchingUser";
		}

		else{
	model.addAttribute("users", new Users());
		model.addAttribute("listUsersSort", usersService.listUsersSort(weight, gender, place, age, principal.getName()));
		return "searchingUser";
		}}
	

}


