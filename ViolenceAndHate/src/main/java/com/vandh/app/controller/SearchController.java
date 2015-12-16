package com.vandh.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;


//Controller for searching and sotring users


@Controller
public class SearchController {

	@Autowired
	private UsersService usersService;
	@RequestMapping(value="/user/search", method=RequestMethod.GET)
	public String searchPage(Model model)
	{	
	model.addAttribute("users", new Users());
		return "searchingUser";
	}
	
	/*@RequestMapping(value = "/user/search", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public String listUsersSort(@ModelAttribute("users") Users users,
			@RequestParam(value="weight") String weight,
			@RequestParam(value="gender") String gender,
			@RequestParam(value="place") String place,
			@RequestParam(value="age") String age,
			Model model)
	{
	model.addAttribute("users", new Users());
		model.addAttribute("listUsersSort", usersService.listUsersSort(weight, gender, place, age));
		return "redirect:/user/search";
	}
	
*/
	
	@RequestMapping(value = "/user/search", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public String listUsersSort(
			@RequestParam(value="weight") String weight,
			@RequestParam(value="gender") String gender,
			@RequestParam(value="place") String place,
			@RequestParam(value="age") String age,
			Model model)
	{
	model.addAttribute("users", new Users());
		model.addAttribute("listUsersSort", usersService.listUsersSort(weight, gender, place, age));
		return "searchingUser";
	}
	
}
