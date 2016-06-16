package com.strustrenting.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.strustrenting.dao.Dao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ManageOrdersAction extends ActionSupport{
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
	public String manageOrders () {
		Dao dao = new Dao ();
		System.out.println(manage + "aaa" + id);
		if (manage.equals("»∑»œ∂©µ•")) {
			try {
				dao.updateRent(Long.parseLong(id), "3");
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				dao.updateRent(Long.parseLong(id), "2");
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String landlordOrdersInformation = getlandlordOrdersInformation();
		ActionContext.getContext().getSession().put("landlordOrdersInformation", landlordOrdersInformation);
		return SUCCESS;
	}
	public String getlandlordOrdersInformation () {
		Dao dao = new Dao();
		long id = (long)ActionContext.getContext().getSession().get("user_id");
		try {
			ResultSet result = dao.getlandlord(id);
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			while (result.next()) {
				JSONObject obj = new JSONObject();
				obj.accumulate("order_id", result.getLong("orders.id"));
				obj.accumulate("house_id", result.getLong("house.id"));
				obj.accumulate("order_state", result.getString("orders.state"));
				obj.accumulate("mobile", result.getString("user.mobile"));
				obj.accumulate("user_name", result.getString("user.username"));
				obj.accumulate("house_name", result.getString("house.house_name"));
				obj.accumulate("house_address", result.getString("house.house_address"));
				obj.accumulate("house_price", result.getDouble("house.house_price"));
				obj.accumulate("checkindate", result.getString("orders.checkindate"));
				obj.accumulate("checkoutdate", result.getString("orders.checkoutdate"));
				jsonArray.put(obj);
			}
			jsonObject.accumulate("data", jsonArray);
			return jsonObject.toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
