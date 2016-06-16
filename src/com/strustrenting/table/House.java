package com.strustrenting.table;

import java.sql.Date;

public class House {
	private long id;
	private long user_id;
	private String city;
	private String house_name;
	private String house_type;
	private String people;
	private String house_address;
	private double house_price;
	private String house_describle;
	private String house_picture1;
	private String house_picture2;
	private String house_picture3;
	private String contact;
	private String mobile;
	private double area;
	private String state;	
	private Date startdate;
	private Date enddate;
	private String rentstate;
	
	public House () {
		state = "1";
		rentstate = "3";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getHouse_type() {
		return house_type;
	}

	public void setHouse_type(String house_type) {
		this.house_type = house_type;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getHouse_address() {
		return house_address;
	}

	public void setHouse_address(String house_address) {
		this.house_address = house_address;
	}

	public double getHouse_price() {
		return house_price;
	}

	public void setHouse_price(double house_price) {
		this.house_price = house_price;
	}

	public String getHouse_describle() {
		return house_describle;
	}

	public void setHouse_describle(String house_describle) {
		this.house_describle = house_describle;
	}

	public String getHouse_picture1() {
		return house_picture1;
	}

	public void setHouse_picture1(String house_picture1) {
		this.house_picture1 = house_picture1;
	}

	public String getHouse_picture2() {
		return house_picture2;
	}

	public void setHouse_picture2(String house_picture2) {
		this.house_picture2 = house_picture2;
	}

	
	public String getHouse_picture3() {
		return house_picture3;
	}

	public void setHouse_picture3(String house_picture3) {
		this.house_picture3 = house_picture3;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getRentstate() {
		return rentstate;
	}

	public void setRentstate(String rentstate) {
		this.rentstate = rentstate;
	}
	
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHouse_name() {
		return house_name;
	}

	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}

	@Override
	public String toString() {
		return "House [id=" + id + ", user_id=" + user_id + ", city=" + city + ", house_name=" + house_name
				+ ", house_type=" + house_type + ", people=" + people + ", house_address=" + house_address
				+ ", house_price=" + house_price + ", house_describle=" + house_describle + ", house_picture1="
				+ house_picture1 + ", house_picture2=" + house_picture2 + ", house_picture3=" + house_picture3
				+ ", contact=" + contact + ", mobile=" + mobile + ", area=" + area + ", state=" + state + ", startdate="
				+ startdate + ", enddate=" + enddate + ", rentstate=" + rentstate + "]";
	}

	
    
}
