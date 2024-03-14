package com.rohini.beans;

import java.io.Serializable;

public class TestimonialBean implements Serializable {

	private String name;
	private String mail;
	private String message;
	
	public TestimonialBean() {
		super();
	}
	
	public TestimonialBean(String name, String mail, String message) {
		super();
		this.name = name;
		this.mail = mail;
		this.message = message;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
