package com.vandh.app.controller;

import java.util.HashSet;
import java.util.Set;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vandh.app.dao.UserRoleDaoImpl;
import com.vandh.app.models.UserRole;
import com.vandh.app.models.Users;
import com.vandh.app.service.UserRoleService;
import com.vandh.app.service.UsersService;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class RegistrationController {
	public static String userReg;
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	@Autowired
	private UsersService usersService;
	@Autowired
	private UserRoleService userRoleService;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registrationPage(Model model) {
		model.addAttribute("users", new Users());
		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("users") Users u, @RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, BindingResult bindingResult) {
		UserRoleDaoImpl userRoleDaoImpl = new UserRoleDaoImpl();
		userReg = username;
		userRoleDaoImpl.setUsername(username);
		System.out.println(userReg);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		u.setPassword(encoder.encode(password));
		// new person, add it
		Set<UserRole> userRoleSet = new HashSet<UserRole>();
		UserRole userRole = new UserRole();
		userRole.setRole("ROLE_USER");
		userRole.setUser(u);
		userRoleSet.add(userRole);
		u.setUserRole(userRoleSet);
		this.usersService.addUser(u);
		this.userRoleService.addRole(userRole);
		return "redirect:/login";
	}
}
