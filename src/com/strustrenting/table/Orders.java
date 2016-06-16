package com.strustrenting.table;

import java.util.Date;

public class Orders {
	private long id;
	private long landlord_id;
	private long house_id;
	private long user_id;
	private Date checkindate;
	private Date checkoutdate;
	private String state;
	private double unitprice;

	public Orders () {
		state = "4";
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public long getLandlord_id() {
		return landlord_id;
	}
	public void setLandlord_id(long landlord_id) {
		this.landlord_id = landlord_id;
	}
	public long getHouse_id() {
		return house_id;
	}
	public void setHouse_id(long house_id) {
		this.house_id = house_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	
	public Date getCheckindate() {
		return checkindate;
	}
	public void setCheckindate(Date checkindate) {
		this.checkindate = checkindate;
	}
	public Date getCheckoutdate() {
		return checkoutdate;
	}
	public void setCheckoutdate(Date checkoutdate) {
		this.checkoutdate = checkoutdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(double unitprice) {
		this.unitprice = unitprice;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", landlord_id=" + landlord_id + ", house_id=" + house_id + ", user_id=" + user_id
				+ ", checkindate=" + checkindate + ", checkoutdate=" + checkoutdate + ", state=" + state
				+ ", unitprice=" + unitprice + "]";
	}
	
	
	
}
