package com.vandh.app.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vandh.app.models.Message;
import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;

@Controller
@SessionAttributes("username")
public class UserPageController {

	@Autowired
	private UsersService usersService;

	
	@RequestMapping(value="/user", method = RequestMethod.GET)
	public String getUserInfo(Model model, Principal principal) {
		String username=principal.getName();
		model.addAttribute("users", new Users());
		model.addAttribute("userInfo", this.usersService.userInfo(username));
		return "user";
	}
	
	
	@RequestMapping(value="/user/search/{username}", method = RequestMethod.GET)
	public String getAnotherUserInfo(@ModelAttribute("message") Message message, @PathVariable(value="username") String username, Model model, Principal principal) {
		if(username.equals(principal.getName()))
		{
			model.addAttribute("users", new Users());
			model.addAttribute("userInfo", this.usersService.userInfo(username));
			return "redirect:/user";
		}
		else{
		model.addAttribute("users", new Users());
		model.addAttribute("userInfo", this.usersService.userInfo(username));
		return "anotherUser";
		}
	}
	
	
	
	
}

