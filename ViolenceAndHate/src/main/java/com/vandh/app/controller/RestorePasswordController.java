package com.vandh.app.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vandh.app.models.Users;
import com.vandh.app.service.UsersService;
@Controller
public class RestorePasswordController {
	@Autowired
	UsersService usersService;
	@Autowired
	private JavaMailSender mailSender;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@RequestMapping(value = "/restorepass", method = RequestMethod.GET)
	public String restorePassPage(Model model) {
		model.addAttribute("users", new Users());
		return "restorePassword";
	}

	@RequestMapping(value = "/restorepass", method = RequestMethod.POST)
	public String sendEmail(Model m, @RequestParam(value = "email") String email) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
		System.out.println("ПОЧТА: "+email);
		if(this.usersService.checkingEmail(email)!=false)
		{
		byte[]   bytesEncoded = Base64.encode(email.getBytes());
		System.out.println("ecncoded value is " + new String(bytesEncoded ));
		
		String subject = "Восстановление пароля | Violence and Hate";
		String message = "Здравствуйте! Вы запросили восстановление пароля. Перейдите по ссылке: "+"http://localhost:8080/app/updatepassword/"+new String(bytesEncoded);
		System.out.println(message);
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setTo(email);
		mail.setSubject(subject);
		mail.setText(message);
		// sends the e-mail
		System.out.println("Sending....");
		mailSender.send(mail);
		return "redirect:/login?passsend";
		}
		else
		{
			return "redirect:/login?emailnotexists";
		}
	}
	

	
	
	@RequestMapping(value = "/updatepassword/{mail}", method = RequestMethod.POST)
	public String updatePass(@PathVariable(value="mail") String mail, @RequestParam(value="password") String newPassword)  {
		System.out.println("ЗАШИФРОВАНАЯ ПОЧТА: "+mail);
		System.out.println("ВВЕДЁНЫЙ ПАРОЛЬ: "+newPassword);
		byte[] valueDecoded= Base64.decode(mail.getBytes());
		System.out.println("Decoded value is " + new String(valueDecoded));
		String toAddress= new String(valueDecoded);
		this.usersService.restorePassUser(toAddress, encoder.encode(newPassword));
		System.out.println("PASSWORD CHANGED!!!!!");
		return "redirect:/login?passupd";
	}
	
	@RequestMapping(value = "/updatepassword/{mail}", method = RequestMethod.GET)
	public String updatePassPage(Model model, @PathVariable(value="mail") String mail) {
		model.addAttribute("users", new Users());
		return "updatePass";
	}
	

	
	
}
