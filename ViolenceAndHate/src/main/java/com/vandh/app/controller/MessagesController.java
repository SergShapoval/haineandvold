package com.vandh.app.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import com.vandh.app.models.Dialog;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.UsersService;

@Controller
public class MessagesController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private DialogService dialogService;
	
	@RequestMapping(value = "/user/messages", method = RequestMethod.GET)
	public String messagesPage(Model model, Principal principal) {
		model.addAttribute("dialog", new Dialog());
		model.addAttribute("listDialog", dialogService.listDialog(principal.getName()));
		return "messages";
		
	}
	
	
	@RequestMapping(value = "/user/dialogs", method = RequestMethod.GET)
	public String dialogPage(Model model, Principal principal) {
		model.addAttribute("dialog", new Dialog());
		model.addAttribute("listDialog", dialogService.listDialog(principal.getName()));
		return "dialogs";
		
	}
	
	
	
	
	
	
	
}
