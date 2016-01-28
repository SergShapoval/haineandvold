package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vandh.app.models.Users;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.FeedbackService;
import com.vandh.app.service.UsersService;

@Controller
public class UpdateUserInfoController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private DialogService dialogService;

	// Updating user's info
	@RequestMapping(value = "/user/updateinfo", method = RequestMethod.GET)
	public String updateUserInfoPage(Model model, Principal principal) {
		model.addAttribute("countOfFeedbacks", this.feedbackService.checkUnreadFedbacks().size());
		model.addAttribute("countOfNewUsers", this.usersService.countOfNewUsers());
		model.addAttribute("users", new Users());
		model.addAttribute("allUserMess", this.dialogService.allNewMessForUser(principal.getName()));
		return "updateUserInfo";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String updateInfo(@ModelAttribute(value = "users") Users user, Principal principal, Model model,
			@RequestParam(value = "email") String email, @RequestParam(value = "password") String password,
			@RequestParam(value = "age") String age, @RequestParam(value = "height") String height,
			@RequestParam(value = "weight") String weight, @RequestParam(value = "sport") String sport,
			@RequestParam(value = "place") String place) {
		if (usersService.checkingEmail(email) != false) {
			model.addAttribute("countOfFeedbacks", this.feedbackService.checkUnreadFedbacks().size());
			model.addAttribute("users", new Users());
			model.addAttribute("emailexists", "Такой E-mail уже зарегестрирован");
			return "updateUserInfo";
		}

		if (email.isEmpty() && password.isEmpty() && age.isEmpty() && height.isEmpty() && weight.isEmpty()
				&& sport.isEmpty() && place.isEmpty()) {
			return "redirect:/user/updateinfo";
		} else {
			this.usersService.updateUserInfo(email, password, age, height, weight, sport, place, principal.getName());
			return "redirect:/user";
		}

	}
}
