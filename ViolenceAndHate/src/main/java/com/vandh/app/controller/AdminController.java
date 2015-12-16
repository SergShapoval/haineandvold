package com.vandh.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;





@Controller
public class AdminController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("users", new Users());
		model.addAttribute("listUsers", this.usersService.listUsers());
		return "admin";
	}

	
	@RequestMapping("/remove/{username}")
	public String removePerson(@PathVariable("username") String username) {
		
		this.usersService.removeUser(username);

	return "redirect:/admin";
	}
	
	
}
