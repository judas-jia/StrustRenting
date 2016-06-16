package com.strustrenting.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.Orders;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class OrdersAction extends ActionSupport implements ModelDriven<Orders>{
	private Orders orders = new Orders();
	
	public String placeOrder () {
		Dao dao = new Dao();
		try {
			dao.save(orders);
			dao.updateHouseRent(orders.getHouse_id(), "1");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ordersInformation = getUsersOrdersInformation();	
	//	System.out.println ("cccccccc"+ ordersInformation);
		ActionContext.getContext().getSession().put("usersOrdersInformation", ordersInformation);
		return SUCCESS;
	}
	public String getUsersOrdersInformation () {
		Dao dao = new Dao();
		long id = (long)ActionContext.getContext().getSession().get("user_id");
		try {
			ResultSet result = dao.get(id);
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			while (result.next()) {
				JSONObject obj = new JSONObject();
				obj.accumulate("order_id", result.getLong("orders.id"));
				obj.accumulate("house_id", result.getLong("house.id"));
				obj.accumulate("order_state", result.getString("orders.state"));
				obj.accumulate("mobile", result.getString("house.mobile"));
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

	@Override
	public Orders getModel() {
		// TODO Auto-generated method stub
		return orders;
	}
	
}
