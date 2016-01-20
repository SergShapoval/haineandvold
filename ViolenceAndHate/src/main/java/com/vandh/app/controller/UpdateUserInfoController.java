package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;

@Controller
public class UpdateUserInfoController {

	@Autowired
	private UsersService usersService;
	private BCryptPasswordEncoder encoder;

// Updating user's info
	@RequestMapping(value = "/user/updateinfo", method = RequestMethod.GET)
	public String updateUserInfoPage(Model model) {
		model.addAttribute("users", new Users());
		return "updateUserInfo";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String updateInfo(@ModelAttribute(value = "users") Users user, Principal principal,
			@RequestParam(value="email") String email, @RequestParam(value="password") String password,
			@RequestParam(value = "age") String age, @RequestParam(value = "height") String height,
			@RequestParam(value = "weight") String weight, @RequestParam(value = "sport") String sport,
			@RequestParam(value = "place") String place) {

		if(email.isEmpty() && password.isEmpty() && age.isEmpty() && height.isEmpty() && weight.isEmpty() && sport.isEmpty() && place.isEmpty())
		{
			return "redirect:/user/updateinfo";
		}
		else
		{
			this.usersService.updateUserInfo(email,password,age, height, weight, sport, place, principal.getName());
			return "redirect:/user";
		}
		
	}

	// Updating user's account
/*	@RequestMapping(value = "/user/updateaccount", method = RequestMethod.GET)
	public String updateUserAccountPage(Model model) {
		model.addAttribute("users", new Users());
		return "updateUserAccount";
	}

	@RequestMapping(value = "/user/updateaccount", method = RequestMethod.POST)
	public String updateAccount(@ModelAttribute(value = "users") Users user, Principal principal,
			@RequestParam(value="email") String email,
			@RequestParam(value="password") String password) {
		if(email.isEmpty() && password.isEmpty())
		{
			return "redirect:/user/updateaccount";
		}
		else
		{
		this.usersService.updateUserAccount(email, password, principal.getName());
		return "redirect:/user";
		}
	}
*/
}
