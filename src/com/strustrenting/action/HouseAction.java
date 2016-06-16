package com.strustrenting.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.io.FileUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.strustrenting.dao.Dao;
import com.strustrenting.table.House;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class HouseAction extends ActionSupport implements ModelDriven<House> {
	private House house = new House ();
	private List<File> upload;
	private List<String> uploadCotentType;
	private List<String> uploadFileName;
	

	public List<File> getUpload() {
		return upload;
	}
	public void setUpload(List<File> upload) {
		this.upload = upload;
	}
	
	public List<String> getUploadCotentType() {
		return uploadCotentType;
	}
	public void setUploadCotentType(List<String> uploadCotentType) {
		this.uploadCotentType = uploadCotentType;
	}
	public List<String> getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String createHouse () throws IOException {
		long user_id = (long)ActionContext.getContext().getSession().get("user_id");
		house.setUser_id(user_id);
		Dao dao = new Dao();
		System.out.println (uploadFileName);
		System.out.println (house);
		String []str = new String[3];
		try {
			File file = new File ("F:\\eclipse\\main\\StrustRenting\\WebContent\\images");
			if (!file.exists()) {
				file.mkdirs();
			}
			for (int i = 0; i < upload.size(); i ++) {
				FileUtils.copyFile(upload.get(i), new File (file, uploadFileName.get(i)));
				System.out.println (uploadFileName.get(i));
				str[i] = uploadFileName.get(i);	
			}
			house.setHouse_picture1("images/" + str[0]);
			house.setHouse_picture2("images/" + str[1]);
			house.setHouse_picture3("images/" + str[2]);
			dao.save(house);
			ActionContext.getContext().getSession().put("usersHouseInformation", getUsersHouseInfromation());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String getUsersHouseInfromation () {
		Dao dao = new Dao();
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		long id = (long)ActionContext.getContext().getSession().get("user_id");
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
