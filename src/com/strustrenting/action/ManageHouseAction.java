package com.strustrenting.action;

import java.sql.SQLException;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.House;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ManageHouseAction extends ActionSupport{
	private String id;
	private String manage;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getManage() {
		return manage;
	}

	public void setManage(String manage) {
		this.manage = manage;
	}

	public String manageHouse () {
		String houseinformation = (String)ActionContext.getContext().getSession().get("allHouseinformation");
		JSONObject json = new JSONObject (houseinformation);
		JSONArray array = new JSONArray();
		JSONArray jsonArray = json.getJSONArray("data");
		House house = null;
		for (int i = 0; i < jsonArray.length(); i ++) {
			JSONObject obj = jsonArray.getJSONObject(i);
			if ((obj.getLong("id") + "").equals(id)) {
				house = new House ();
				house.setId(obj.getLong("id"));
				house.setUser_id(obj.getLong("user_id"));
				house.setCity(obj.getString("city"));
				house.setHouse_name(obj.getString("house_name"));
				house.setHouse_type(obj.getString("house_type"));
				house.setPeople(obj.getString("people"));
				house.setHouse_address(obj.getString("house_address"));
				house.setHouse_price(Long.parseLong(obj.getString("house_price")));
				house.setHouse_describle(obj.getString("house_describle"));
				house.setContact(obj.getString("contact"));
				house.setMobile(obj.getString("mobile"));
				house.setHouse_picture1(obj.getString("picture1"));
				house.setHouse_picture2(obj.getString("picture2"));
				house.setHouse_picture3(obj.getString("picture3"));
				house.setArea(obj.getDouble("area"));
				
				System.out.println (id);
			}
			else {
				array.put(obj);
			}
		}
		if (manage.equals("拒绝")) {
			
			house.setState("4");
		
			Dao dao = new Dao();
			try {
				dao.updateHouse(house);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (manage.equals("发布")) {
			house.setState("3");
		//	System.out.println("askldfhk" + house);
			Dao dao = new Dao();
			try {
				System.out.println(house);
				dao.updateHouse(house);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (manage.equals("查看详情")) {
			
		} else {}
		//System.out.println("dlkf" + array.toString());
		JSONObject jsonObj = new JSONObject();
		jsonObj.accumulate("data", array);
		ActionContext.getContext().getSession().put("allHouseinformation", jsonObj.toString());
		System.out.println (jsonObj.toString());
		return SUCCESS;
	}

}
