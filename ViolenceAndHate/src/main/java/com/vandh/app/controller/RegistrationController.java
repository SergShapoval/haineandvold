package com.vandh.app.controller;

import java.util.HashSet;
import java.util.Set;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registrationPage(Model model) {
		model.addAttribute("users", new Users());
		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("users") Users u, @RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, @RequestParam(value="email") String mailForConfirmation, BindingResult bindingResult) {

		String usernameHashed=new String(username);
		byte[]   bytesEncoded = Base64.encode(usernameHashed.getBytes());
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
		//-----------------------SENDING CONFIRMATION EMAIL-------------------------------------------------------
		String subject = "Подтверждение учётной записи | Violence and Hate";
		String message = "Здравствуйте! Вы зарегестрировались на сайте Violence And Hate. Перейдите по ссылке для подтверждения вашей учётной записи: "+"http://localhost:8080/app/confirmation/"+new String(bytesEncoded);
		System.out.println(message);
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setTo(mailForConfirmation);
		mail.setSubject(subject);
		mail.setText(message);
		// sends the e-mail
		System.out.println("Sending....");
		mailSender.send(mail);
		//------------------------------------------------------------------
		
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/confirmation/{username}", method = RequestMethod.GET)
	public String confirmationPage(Model model, @PathVariable(value="username") String username) {
		model.addAttribute("users", new Users());
		return "accountConfirmation";
	}
	
	@RequestMapping(value = "/confirmation/{username}", method = RequestMethod.POST)
	public String confirmAccount(@PathVariable(value="username") String username) {
		byte[] usernameDecoded= Base64.decode(username.getBytes());
		System.out.println("Decoded value is " + new String(usernameDecoded));
		this.usersService.confirmUserAccount(new String(usernameDecoded));
		return "redirect:/login?confirm";
	}
	
}
