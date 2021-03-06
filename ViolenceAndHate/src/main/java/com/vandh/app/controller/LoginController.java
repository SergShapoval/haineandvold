package com.vandh.app.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.vandh.app.models.Users;


@Controller
public class LoginController {
	
	
	@RequestMapping(value = { "/", "/home" })
	public String getUserDefault() {
		return "redirect:/user";
	}


	
	@RequestMapping(value="/login")
	public ModelAndView getLoginForm(
			@ModelAttribute Users users,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value="passupd", required = false) String passupd,
			@RequestParam(value="confirm", required=false) String confirm,
			@RequestParam(value="emailnotexists", required=false) String emailnotexists,
			@RequestParam(value="passsend", required=false) String passsend
			)
	{
		String message = "";
		if (error != null) {
			message = "Неверный логин или пароль";
		} 
		else if(passupd!=null)
		{
			message = "Пароль обновлён";
		}
		else if(confirm!=null)
		{
			message = "Аккаунт подтверждён";
		}
		else if(emailnotexists!=null)
		{
			message="E-mail не существует";
		}
		else if(passsend!=null)
		{
			message="Проверьте свой e-mail";
		}
			
		return new ModelAndView("login", "message", message);
	}

	@RequestMapping("/admin**")
	public String getAdminProfile() {
		return "admin";
	}



	@RequestMapping("/403")
	public ModelAndView getAccessDenied() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = "";
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			username = userDetail.getUsername();
		}

		return new ModelAndView("403", "username", username);
	}
}
