package com.vandh.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactsController {

	@RequestMapping(value = "/user/contacts", method = RequestMethod.GET)
	public String contactsPage() {
		return "contacts";
	}
	
	
	
	
}
