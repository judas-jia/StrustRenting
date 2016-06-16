package com.strustrenting.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.House;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class LookHouseInformation extends ActionSupport{
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String lookHouseInformation () {
		Dao dao = new Dao();
		System.out.println ("hhhhhh" + id);
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		try {
			ArrayList<House> list = dao.getList(new House ());
			Iterator<House> it = list.iterator();
			while (it.hasNext()) {
				House house = it.next();
				
				if ((house.getId() == Long.parseLong(id)) && house.getState().equals("ÒÑ·¢²¼")) {
					
					JSONObject obj = new JSONObject();
					obj.accumulate("id", house.getId());
					obj.accumulate("user_id", house.getUser_id());
					obj.accumulate("city", house.getCity());
					obj.accumulate("house_name", house.getHouse_name());
					obj.accumulate("house_type", house.getHouse_type());
					obj.accumulate("house_price", house.getHouse_price());
					obj.accumulate("people", house.getPeople());
					obj.accumulate("house_address", house.getHouse_address());
					obj.accumulate("house_describle", house.getHouse_describle());
					obj.accumulate("contact", house.getContact());
					obj.accumulate("mobile", house.getMobile());
					obj.accumulate("picture1", house.getHouse_picture1());
					obj.accumulate("picture2", house.getHouse_picture2());
					obj.accumulate("picture3", house.getHouse_picture3());
					obj.accumulate("area", house.getArea());
					obj.accumulate("state", house.getState());
					obj.accumulate("rentstate", house.getRentstate());
					jsonArray.put(obj);
				}
			}
			jsonObject.accumulate("data", jsonArray);
			System.out.println (jsonObject.toString());
			ActionContext.getContext().getSession().put("lookHouseInformation", jsonObject.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
