package com.vandh.app.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users", catalog = "spring_social_db")
public class Users {

	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	private String username;

	@Column(name = "password", nullable = false, length = 60)
	private String password;

	@Column(name = "enabled", nullable = false)
	private boolean enabled;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Dialog> dialog = new HashSet<Dialog>(0);

	@Column(name = "name", nullable = false, length = 30)
	private String name;

	@Column(name = "surname", nullable = false, length = 30)
	private String surname;

	@Column(name = "email", nullable = false, length = 50)
	private String email;

	@Column(name = "gender", nullable = false, length = 10)
	private String gender;

	@Column(name = "age", nullable = false, length = 2)
	private String age;

	@Column(name = "weight", nullable = false, length = 2)
	private String weight;

	@Column(name = "height", nullable = false, length = 3)
	private String height;

	@Column(name = "sport", nullable = false, length = 50)
	private String sport;

	@Column(name = "place", nullable = false, length = 400)
	private String place;

	@Column(name = "photoa", nullable = false, length = 100)
	private String photoa;

	public void setPhotob(String photob) {
		this.photob = photob;
	}

	@Column(name = "photob", nullable = false, length = 100)
	private String photob;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getSport() {
		return sport;
	}

	public void setSport(String sport) {
		this.sport = sport;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<UserRole> getUserRole() {
		return userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}

	public Set<Dialog> getDialog() {
		return dialog;
	}

	public void setDialog(Set<Dialog> dialog) {
		this.dialog = dialog;
	}

	public String getPhotoa() {
		return photoa;
	}

	public void setPhotoa(String photoa) {
		this.photoa = photoa;
	}

	public String getPhotob() {
		return photob;
	}

}
