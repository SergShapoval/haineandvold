package com.vandh.app.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.vandh.app.models.Dialog;
import com.vandh.app.models.Message;
import com.vandh.app.service.DialogService;
import com.vandh.app.service.MessageService;
import com.vandh.app.service.UsersService;

@Controller
public class MessagesController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private DialogService dialogService;
	@Autowired
	private MessageService messageService;

	public void sendMessage(int iddialog, String text) {
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
		this.messageService.addMessage(mess);

	}

	@RequestMapping(value = "/user/messages", method = RequestMethod.GET)
	public String messagesPage(Model model, Principal principal) {
		model.addAttribute("dialog", new Dialog());
		model.addAttribute("message", new Message());
		model.addAttribute("listDialogRec", dialogService.listDialogUserReciever(principal.getName()));
		model.addAttribute("listDialogSend", dialogService.listDialogUserSender(principal.getName()));
		return "messages";
	}
	

	@RequestMapping(value = "/user/messages/{iddialog}", method = RequestMethod.GET)
	public String messagesList(@PathVariable(value = "iddialog") int iddialog, Model model, Principal principal) {
		model.addAttribute("message", new Message());
		model.addAttribute("listMessagesForUser", messageService.listMessagesForUser(iddialog));
		model.addAttribute("userDialogWith", dialogService.usernameDialogWith(iddialog, principal.getName()));
		System.out.println("ID dialog is: " + iddialog);
		return "messagesWithUser";
	}

	@RequestMapping(value = "/user/mess/{iddialog}", method = RequestMethod.GET)
	public String messPage(@PathVariable(value = "iddialog") int iddialog, Model model, Principal principal) {
		model.addAttribute("message", new Message());
		model.addAttribute("listMessagesForUser", messageService.listMessagesForUser(iddialog));
		System.out.println("ID dialog is: " + iddialog);
		return "mess";
	}


	@RequestMapping(value = "/user/messages/history/{username}", method = RequestMethod.GET)
	public String fullMessageList(@PathVariable(value="username") String username, Model model, Principal principal){ 
		model.addAttribute("message", new Message());
		model.addAttribute("fullMessageList", messageService.messageHistory(username, principal.getName()));
		model.addAttribute("usernameHistoryWith", username);
	return "fullMessageList";	
	}


}
