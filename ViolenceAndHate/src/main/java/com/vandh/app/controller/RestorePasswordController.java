package com.vandh.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.*;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.*;

import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;

@Controller
public class RestorePasswordController {

	@Autowired
	UsersService usersService;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/restorepass", method = RequestMethod.GET)
	public String restorePassPage(Model model) {
		model.addAttribute("users", new Users());
		return "restorePassword";
	}

	@RequestMapping(value = "/restorepass", method = RequestMethod.POST)
	public String sendEmail(Model m, @RequestParam(value = "email") String email) {
		System.out.println("Preparing for sending e-mail");
		String subject = "Восстановление пароля | Violence and Hate";
		String message = "Здравствуйте! Ваш пароль: " + this.usersService.restorePassUser(email)
				+ ". С ув. Администрация Violence and Hate";
		System.out.println(message);
		SimpleMailMessage mail = new SimpleMailMessage();
		
		mail.setTo(email);
		mail.setSubject(subject);
		mail.setText(message);
		// sends the e-mail
		System.out.println("Sending....");
		mailSender.send(mail);
		return "redirect:/restorepass";
	}
}
