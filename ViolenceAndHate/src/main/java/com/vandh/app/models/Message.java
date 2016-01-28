package com.vandh.app.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "message", catalog = "spring_social_db")
public class Message {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "idmessage", unique = true, nullable = false, length=40)
	private Long idmessage;

	@Column(name="text", length = 300)
	private String text;
	
	@Column(name="date", length = 40, nullable=false)
	private String date;
	
	@Column(name="messender", length = 50)
	private String messender;

	@Column(name="checkms")
	private boolean checkms;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "iddialog", nullable = false)
	private Dialog dialog;
	
	
	public Long getIdmessage() {
		return idmessage;
	}

	public void setIdmessage(Long idmessage) {
		this.idmessage = idmessage;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	public Dialog getDialog() {
		return dialog;
	}

	public void setDialog(Dialog dialog) {
		this.dialog = dialog;
	}
	
	public String getMessender() {
		return messender;
	}

	public void setMessender(String messender) {
		this.messender = messender;
	}
	
	public boolean isCheckms() {
		return checkms;
	}

	public void setCheckms(boolean checkms) {
		this.checkms = checkms;
	}
	

}
