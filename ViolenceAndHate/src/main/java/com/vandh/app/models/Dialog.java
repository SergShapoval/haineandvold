package com.vandh.app.models;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "dialog", catalog = "spring_social_db")
public class Dialog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "iddialog", unique = true, nullable = false)
	private Integer iddialog;
	
	@Column(name="reciever", length = 50)
	private String reciever;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username", nullable = false)
	private Users user;

	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dialog")
	private List<Message> message = new ArrayList<Message>(0);
	
	
	
	public List<Message> getMessage() {
		return message;
	}

	public void setMessage(List<Message> message) {
		this.message = message;
	}

	public Integer getIddialog() {
		return iddialog;
	}

	public void setIddialog(Integer iddialog) {
		this.iddialog = iddialog;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	
	
}
