package com.strustrenting.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.House;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ChangeHouseInformation extends ActionSupport implements ModelDriven<House>{
	private House house = new House();
	
	public String changHouseInformation () {
		System.out.println ("aaaaa" + house);
		Dao dao = new Dao();
		try {
			dao.updateHouse(house);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str = getUsersHouseInfromation();
		ActionContext.getContext().getSession().put("usersHouseInformation", str);
		return SUCCESS;
	}
	public String getUsersHouseInfromation () {
		Dao dao = new Dao();
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		long id = (long)ActionContext.getContext().getSession().get("user_id");
		System.out.println (id);
		try {
			ArrayList<House> list = dao.getList(new House ());
			Iterator<House> it = list.iterator();
			while (it.hasNext()) {
				House house = it.next();
				
				if (house.getUser_id() == id) {
					JSONObject obj = new JSONObject();
					obj.accumulate("id", house.getId());
					obj.accumulate("city", house.getCity());
					obj.accumulate("house_name", house.getHouse_name());
					obj.accumulate("house_type", house.getHouse_type());
					obj.accumulate("people", house.getPeople());
					obj.accumulate("house_address", house.getHouse_address());
					obj.accumulate("house_price", house.getHouse_price());
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
			
			return jsonObject.toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public House getModel() {
		// TODO Auto-generated method stub
		return house;
	}
	
}
