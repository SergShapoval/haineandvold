package com.vandh.app.controller;

import java.security.Principal;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.vandh.app.models.Message;

import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;

@Controller
@SessionAttributes("username")
public class UserPageController {

	@Autowired
	private UsersService usersService;
	@Autowired
    ServletContext context;
	
	@RequestMapping(value="/user", method = RequestMethod.POST)
	public String postAvatar(@RequestParam("file") MultipartFile file, HttpServletRequest request)
	{ 
		if(file.isEmpty())
		{
			return "redirect:/user";
		}
	
		if (!file.isEmpty()) {
		    try {	    	
		   /*     byte[] bytes = file.getBytes();
		        System.out.println(file.getOriginalFilename());
				String name=file.getOriginalFilename();
				File convFile = new File("../main/webapp/resources/avatars/" + file.getOriginalFilename()); 
				file.transferTo(convFile);
		        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(convFile));
		        stream.write(bytes);
		        stream.close();
		        
		        System.out.println("You have uploaded file");
		    */
		    	String relativeWebPath = "/resources/avatars/";
		    	String absoluteFilePath = context.getRealPath(relativeWebPath);
		    			    	String name=file.getOriginalFilename(); 
		    	//String name=file.getOriginalFilename(); 
		    			    	System.out.println(absoluteFilePath);
		    	File convFile = new File(absoluteFilePath+"/"+name); 
		    	System.out.println(convFile.getAbsolutePath());
		    	file.transferTo(convFile);
		    	System.out.println("You have uploaded file");


		    	
		    } catch (Exception e) {
		    	e.printStackTrace();
		      System.out.println("Failed to upload");
		      return "redirect:/user";
		    }
		}
		return"user";
	}
	
	
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

