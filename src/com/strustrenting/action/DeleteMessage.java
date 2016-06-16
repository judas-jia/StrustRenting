package com.strustrenting.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.Message;

public class DeleteMessage extends ActionSupport{
	private String id;
	private String information;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String deleteMessage () {
		Dao dao = new Dao();
		Message message = new Message();
		message.setId(Long.parseLong(id));
		System.out.println (id);
		try {
			dao.deleteHouse(message);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
