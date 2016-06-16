package com.strustrenting.table;

public class Message {
	private long id;
	private long house_id;
	private String user_name;
	private String message;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getHouse_id() {
		return house_id;
	}
	public void setHouse_id(long house_id) {
		this.house_id = house_id;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", house_id=" + house_id + ", user_name=" + user_name + ", message=" + message
				+ "]";
	}
	
	
}
