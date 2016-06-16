package com.strustrenting.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.Message;
import com.sun.net.httpserver.Authenticator.Success;

public class MessageAction extends ActionSupport implements ModelDriven<Message>{
	private Message message = new Message();
	public String getMessage () {
		Dao dao = new Dao();
		System.out.println (message);
		try {
			dao.save(message);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@Override
	public Message getModel() {
		// TODO Auto-generated method stub
		return message;
	}
	
}
