package com.strustrenting.table;

import java.sql.Date;

public class User {
	private long id;
	private String username;
	private String password;
	private String mobile;
	private String sex;
	private String picture;
	private String id_card;
	private String paypassword;
	private int typeuser;
	private double money;
	private String realname;
	private Date birthday;
	private String city;
	public User () {
		money = 0;
		typeuser = 1;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getPaypassword() {
		return paypassword;
	}
	public void setPaypassword(String paypassword) {
		this.paypassword = paypassword;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	

	public int getTypeuser() {
		return typeuser;
	}
	public void setTypeuser(int typeuser) {
		this.typeuser = typeuser;
	}
	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", mobile=" + mobile + ", sex="
				+ sex + ", picture=" + picture + ", id_card=" + id_card + ", paypassword=" + paypassword + ", typeuser="
				+ typeuser + ", money=" + money + ", realname=" + realname + ", birthday=" + birthday + ", city=" + city
				+ "]";
	}
	
	
	
}
