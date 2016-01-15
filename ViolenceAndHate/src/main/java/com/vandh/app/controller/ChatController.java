package com.vandh.app.controller;

import java.security.Principal;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Date;
import com.vandh.app.models.Dialog;
import com.vandh.app.models.Feedback;
import com.vandh.app.models.Message;
import com.vandh.app.models.UserRole;
import com.vandh.app.models.Users;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.MessageService;

@Controller
public class ChatController {

	@Autowired
	private DialogService dialogService;

	@Autowired
	private MessageService messageService;

	public void createDialog(String sender, String reciever) {
		Users user = new Users();
		user.setUsername(sender);
		Dialog dialog = new Dialog();
		dialog.setReciever(reciever);
		dialog.setUser(user);
		this.dialogService.addDialog(dialog);
	}

	public void sendMessage(int iddialog, String text, String messender) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// get current date time with Date()
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		Dialog dialog = new Dialog();
		dialog.setIddialog(iddialog);
		Message mess = new Message();
		mess.setText(text);
		mess.setDialog(dialog);
		mess.setDate(dateFormat.format(date));
		mess.setMessender(messender);
		this.messageService.addMessage(mess);

	}

	public boolean checkingMessage(String text)
	{
		if(text.contains("<")||text.contains(">")||text.contains("script")||text.contains("$"))
		{
			return true;
		}
		else
			return false;
	}
	
	
	@RequestMapping(value = "/user/search/{username}", method = RequestMethod.POST)
	public String addMessage(@ModelAttribute("message") Message message, @RequestParam(value = "text") String text,
			@PathVariable(value = "username") String username, Model model, Principal principal) {

		int dialogid = dialogService.findExistingDialog(principal.getName(), username);
		int idCreateddialog = 0;
		if (dialogid == 0) {
			createDialog(principal.getName(), username);
			idCreateddialog = dialogService.findExistingDialog(principal.getName(), username);
			sendMessage(idCreateddialog, text, principal.getName());
		} else {
			if(checkingMessage(text)!=false){
			sendMessage(dialogid, text, principal.getName());
			return "redirect:/user/messages";}
			else
			{
				return "redirect:/user/messages";		
			}
			
		}
		return "redirect:/user/messages";
		
	}

	@RequestMapping(value = "/user/messages/{iddialog}", method = RequestMethod.POST)
	public String messages(@ModelAttribute("message") Message message, @RequestParam(value = "text") String text,
			@PathVariable(value = "iddialog") int iddialog, Model model, Principal principal) {
		if(checkingMessage(text)!=true)
		{
		sendMessage(iddialog, text, principal.getName());
		System.out.println("message sent!");
		return "messagesWithUser";
		}
		else
		{
			return "redirect:/user/messages";
		}
	}

}
