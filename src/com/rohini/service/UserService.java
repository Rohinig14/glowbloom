package com.rohini.service;

import com.rohini.beans.UserBean;
import com.rohini.beans.UserRegisterBean;

public interface UserService {

	/*
	 * private String userName; private Long mobileNo; private String emailId;
	 * private String address; private int pinCode; private String password;
	 */

	public String registerUser(String userName, Long mobileNo, String emailId, String role, String address, int pinCode,
			String password);

	public String registerUser(UserBean user);

	public boolean isRegistered(String emailId);

	public String isValidCredential(String emailId, String password);

	public UserRegisterBean getUserDetails(String emailId, String password);

	public String getFName(String emailId);

	public String getUserAddr(String userId);

}
