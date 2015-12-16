package com.vandh.app.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "feedback", catalog = "spring_social_db")
public class Feedback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idfeed", unique = true, nullable = false)
	private Integer idfeed;
	
	@Column(name="emailforfb", length = 50)
	private String emailforfb;

	@Column(name="message", length = 30)
	private String message;

	public Integer getIdfeed() {
		return idfeed;
	}

	public void setIdfeed(Integer idfeed) {
		this.idfeed = idfeed;
	}

	public String getEmailforfb() {
		return emailforfb;
	}

	public void setEmailforfb(String emailforfb) {
		this.emailforfb = emailforfb;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
