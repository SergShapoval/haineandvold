package com.vandh.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.vandh.app.service.UsersService;

@Controller
public class RulesController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = "/user/rules", method = RequestMethod.GET)
	public String rulesPage() {
		return "rules";
	}
	
	
}
