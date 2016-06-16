package com.strustrenting.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SeekHouseDetailAction extends ActionSupport{
	private String house_id;

	public String getHouse_id() {
		return house_id;
	}

	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public String seekHouseDetails () {
		
		ActionContext.getContext().getSession().put("seeked_house_id", house_id);
		return SUCCESS;
	}
}
