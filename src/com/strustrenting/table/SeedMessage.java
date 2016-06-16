package com.strustrenting.table;

public class SeedMessage {
	private long id;
	private String seed_name;
	private String receive_name;
	private String seedMessage;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getSeed_name() {
		return seed_name;
	}
	public void setSeed_name(String seed_name) {
		this.seed_name = seed_name;
	}
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}
	public String getSeedMessage() {
		return seedMessage;
	}
	public void setSeedMessage(String seedMessage) {
		this.seedMessage = seedMessage;
	}
	@Override
	public String toString() {
		return "SeedMessage [id=" + id + ", seed_name=" + seed_name + ", receive_name=" + receive_name
				+ ", seedMessage=" + seedMessage + "]";
	}
	
}
