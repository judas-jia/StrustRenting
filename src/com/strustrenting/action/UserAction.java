package com.strustrenting.action;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.apache.catalina.connector.Request;
import org.apache.catalina.startup.HomesUserDatabase;
import org.apache.commons.io.FileUtils;
import org.apache.tomcat.util.buf.UEncoder;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.House;
import com.strustrenting.table.Manager;
import com.strustrenting.table.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user = new User();
	
	private File upload;
	private String uploadCotentType;
	private String uploadFileName;
	//private String savePath;
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadCotentType() {
		return uploadCotentType;
	}
	public void setUploadCotentType(String uploadCotentType) {
		this.uploadCotentType = uploadCotentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	public String login () {
		JSONObject json = new JSONObject();
		ActionContext action = ActionContext.getContext();
		System.out.println (user.getTypeuser());
		if (user.getTypeuser() == 1) {
			Dao dao = new Dao();
			User user1 = new User();
			try {
				ArrayList<User> list = dao.getList(new User ());
				Iterator<User> it = list.iterator();
				while (it.hasNext()) {
					user1 = it.next();
					if (user1.getUsername().equals(user.getUsername()) && user1.getPassword().equals(user.getPassword())) {
						json.accumulate("username", user1.getUsername());
						System.out.println (user1);
						String pass = user1.getPassword();
						json.accumulate("mobile", user1.getMobile());
						json.accumulate("sex", user1.getSex());
						json.accumulate("money", user1.getMoney());
						json.accumulate("id_card", user1.getId_card());
						json.accumulate("realname", user1.getRealname());
						json.accumulate("picture", user1.getPicture());
						if (user1.getBirthday() != null)
							json.accumulate("birthday", user1.getBirthday().toString());
						else
							json.accumulate("birthday", "");
						json.accumulate("city", user1.getCity());
						action.getSession().put("user", json.toString());
						action.getSession().put("password", pass);
						action.getSession().put("user_id", user1.getId());
						action.getSession().put("username", user1.getUsername());
						action.getSession().put("mobile", user1.getMobile());
						String str = getUsersHouseInfromation();
						action.getSession().put("usersHouseInformation", str);
						String ordersInformation = getUsersOrdersInformation();	
						System.out.println ("usersorder" + ordersInformation);
						action.getSession().put("usersOrdersInformation", ordersInformation);
						String landlordOrdersInformation = getlandlordOrdersInformation();
						action.getSession().put("landlordOrdersInformation", landlordOrdersInformation);
						System.out.println ("landlord" + landlordOrdersInformation);
						return Action.SUCCESS;
					}
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (user.getTypeuser() == 2) {
			Dao dao = new Dao();
			Manager manager = new Manager();
			try {
				ArrayList<Manager> list = dao.getList(manager);
				Iterator<Manager> it = list.iterator();
				while (it.hasNext()) {
					manager = it.next();
					if (user.getUsername().equals(manager.getManagername()) && user.getPassword().equals(manager.getPassword())) {
						String userInformation = getUserInformation();
						String houseInformation = getHouseInformation();
						ActionContext.getContext().getSession().put("allUserInformation", userInformation);
						ActionContext.getContext().getSession().put("allHouseinformation", houseInformation);
						return "manager";
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		return "fail";
	}
	public String register () {
		System.out.println (user);
		Dao dao = new Dao();
		try {
			dao.save(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}
	public String changeInformation () {
		if (uploadFileName != null)
			getFile ();
		String pass;
		pass = (String) ActionContext.getContext().getSession().get("password");
		System.out.println (pass);
		Dao dao = new Dao();
		//String filename = (String)ActionContext.getContext().getSession().get("filename");
		String picture = "images/" + uploadFileName;
		System.out.println (picture);
		ActionContext action = ActionContext.getContext();
		user.setPassword(pass);
		user.setPicture(picture);
		JSONObject json = new JSONObject();
		json.accumulate("username", user.getUsername());
		System.out.println (user);
		json.accumulate("picture", user.getPicture());
		json.accumulate("mobile", user.getMobile());
		json.accumulate("sex", user.getSex());
		json.accumulate("money", user.getMoney());
		json.accumulate("id_card", user.getId_card());
		json.accumulate("realname", user.getRealname());
		if (user.getBirthday() != null)
			json.accumulate("birthday", user.getBirthday().toString());
		else
			
			json.accumulate("birthday", "");
		json.accumulate("city", user.getCity());
		action.getSession().put("user", json.toString());
		System.out.println (user);
		try {
			dao.update(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String deleteUser () {
		Dao dao = new Dao();
		try {
			dao.delete(user);
			String userInformation = getUserInformation();
			ActionContext.getContext().getSession().put("allUserInformation", userInformation);
			System.out.println ("aaaaaaaa" + user.getUsername());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String getUserInformation () {
		Dao dao = new Dao();
		try {
			JSONObject json = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			ArrayList<User> list = dao.getList(new User ());
			Iterator<User> it = list.iterator();
			while (it.hasNext()) {
				User user1 = it.next();
				JSONObject obj = new JSONObject();
				obj.accumulate("username", user1.getUsername());
				obj.accumulate("sex", user1.getSex());
				obj.accumulate("money", user1.getMoney());
				obj.accumulate("realname", user1.getRealname());
				obj.accumulate("id", user1.getId());
				jsonArray.put(obj);
			}
			json.accumulate("data", jsonArray);
			
			return json.toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String getHouseInformation () {
		Dao dao = new Dao();
		try {
			ArrayList<House> list = dao.getList(new House ());
			JSONArray josnArray = new JSONArray();
			JSONObject json = new JSONObject();
			Iterator<House> it = list.iterator();
			while (it.hasNext()) {
				House house = it.next();
				if (house.getState().equals("´ýÉóºË")) {
					JSONObject obj = new JSONObject();
					obj.accumulate("id", house.getId());
					obj.accumulate("user_id", house.getUser_id());
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
					obj.accumulate("rentstate", house.getRentstate());
					obj.accumulate("startdate", house.getStartdate());
					obj.accumulate("enddate", house.getEnddate());
					josnArray.put(obj);
				}
			}
			json.accumulate("data", josnArray);
			return json.toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public void getFile () {
		
		File file = new File ("F:\\eclipse\\main\\StrustRenting\\WebContent\\images");
		if (!file.exists()) {
			file.mkdirs();
		}
		
		try {
			FileUtils.copyFile(upload, new File (file, uploadFileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
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
	
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

}
