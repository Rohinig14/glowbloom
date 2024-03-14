package com.rohini.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rohini.beans.UserBean;
import com.rohini.beans.UserRegisterBean;
import com.rohini.constants.IUserConstants;
import com.rohini.service.UserService;
import com.rohini.utility.DBUtil;
import com.rohini.utility.MailMessage;

public class UserServiceImpl implements UserService {

	@Override
	public String registerUser(String userName, Long mobileNo, String emailId, String role, String address, int pinCode,
			String password) {

		UserBean user = new UserBean(userName, mobileNo, emailId, role, address, pinCode, password);

		String status = registerUser(user);

		return status;
	}

	@Override
	public String registerUser(UserBean user) {

		String status = "User Registration Failed!";

		boolean isRegtd = isRegistered(user.getEmail());

		if (isRegtd) {
			status = "Email Id Already Registered!";
			return status;
		}
		Connection conn = DBUtil.provideConnection();
		PreparedStatement ps = null;
		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {

			ps = conn.prepareStatement("insert into " + IUserConstants.TABLE_USER + " values(?,?,?,?,?,?,?)");

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setString(3, user.getRole());
			ps.setLong(4, user.getMobile());
			ps.setString(5, user.getAddress());
			ps.setInt(6, user.getPinCode());
			ps.setString(7, user.getPassword());

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "User Registered Successfully!";
				MailMessage.registrationSuccess(user.getEmail(), user.getName().split(" ")[0]);
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps);

		return status;
	}

	@Override
	public boolean isRegistered(String emailId) {
		boolean flag = false;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user where email=?");

			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return flag;
	}

	@Override
	public String isValidCredential(String emailId, String password) {
		String status = "Login Denied! Incorrect Username or Password";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from user where email=? and password=?");

			ps.setString(1, emailId);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next())
				status = "valid";

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		return status;
	}

	@Override
	public UserRegisterBean getUserDetails(String emailId, String password) {

		UserRegisterBean user = null;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
		    ps = con.prepareStatement("select * from user where email=? and password=?");
		    ps.setString(1, emailId);
		    ps.setString(2, password);
		    
		    rs = ps.executeQuery();
		    
		    if (rs.next()) { // Move the cursor to the first row and then check if the row exists
		        user = new UserRegisterBean();
		        user.setName(rs.getString("name"));
		        user.setMobile(rs.getLong("mobile"));
		        user.setEmail(rs.getString("email"));
		        user.setAddress(rs.getString("address"));
		        user.setPinCode(rs.getInt("pincode"));
		        user.setPassword(rs.getString("password"));
		        user.setRole(rs.getString("role"));
		        return user;
		    } else {
		        System.out.println("No user found with the provided email and password.");
		    }

		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    // Close resources in the finally block to ensure they are closed regardless of exceptions
		    try {
		        if (rs != null) rs.close();
		        if (ps != null) ps.close();
		        if (con != null) con.close();
		    } catch (SQLException ex) {
		        ex.printStackTrace();
		    }
		}
		// If user is not found, this will return null.
		return user;

	}

	@Override
	public String getFName(String emailId) {
		String fname = "";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select name from user where email=?");
			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next()) {
				fname = rs.getString(1);

				fname = fname.split(" ")[0];

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return fname;
	}

	@Override
	public String getUserAddr(String userId) {
		String userAddr = "";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select address from user where email=?");

			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next())
				userAddr = rs.getString(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return userAddr;
	}

}
