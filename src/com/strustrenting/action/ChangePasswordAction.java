package com.strustrenting.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.strustrenting.dao.Dao;

public class ChangePasswordAction extends ActionSupport{
	private String username;
	private String password;
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
	public String changePassword () {
		Dao dao = new Dao();
		try {
			dao.updatePassword(password, username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
