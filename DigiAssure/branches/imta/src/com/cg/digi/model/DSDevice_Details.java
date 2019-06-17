package com.cg.digi.model;

public class DSDevice_Details {

	private int id;
	private String vendor;
	private String device_id;
	
	private String name;
	private String version;
	
	private String os;
	private String status;
	private String reservation;
	private String reservation_id;
	private String time;
	private String reservation_time;
	private String udid;
	private String devicecategory;
	private String agentlocation;
	private String resolution;
	
	public DSDevice_Details() {
		
	}
	
	
	public void setTime(String time) {
		this.time = time;
	}

	
	public String getTime() {
		return time;
	}



	



	


	



	
	public DSDevice_Details(String vendor,String name,String version, String os,String status, String device_id,
			  String reservation,String time, String reservation_time,String udid,String devicecategory,String agentlocation,
			  String resolution) {
		
		this.vendor = vendor;
		this.name = name;
		this.version = version;
		this.os = os;
		this.status = status;
		this.device_id = device_id;
		this.reservation = reservation;
		this.time = time;
		this.reservation_time = reservation_time;
		this.udid = udid;
		this.devicecategory = devicecategory;
		this.agentlocation = agentlocation;
		this.resolution = resolution;
		
	}


	public int getid() {
		return id;
	}
	public void setid(int id) {
		this.id = id;
	}
	public String getvendor() {
		return vendor;
	}
	public void setvendor(String vendor) {
		this.vendor = vendor;
	}
	public String getdevice_id() {
		return device_id;
	}
	public void setdevice_id(String device_id) {
		this.device_id = device_id;
	}
	/*public int getversion() {
		return Integer.parseInt(version);
	}*/
	public String getversion() {
		return version;
	}
	public void setversion(String version) {
		this.version = version;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getos() {
		return os;
	}
	public void setos(String os) {
		this.os = os;
	}
	public String getstatus() {
		return status;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	
	public String getreservation() {
		return reservation;
	}
	public void setreservation(String reservation) {
		this.reservation = reservation;
	}
	public String getreservation_id() {
		return reservation_id;
	}
	public void setreservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}
	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getReservation_time() {
		return reservation_time;
	}
	public void setUdid(String udid) {
		this.udid = udid;
	}

	public String getUdid() {
		return udid;
	}
	public void setdevicecategory(String devicecategory) {
		this.devicecategory = devicecategory;
	}

	public String getdevicecategory() {
		return devicecategory;
	}
	public void setagentlocation(String agentlocation) {
		this.agentlocation = agentlocation;
	}

	public String getagentlocation() {
		return agentlocation;
	}
	public void setresolution(String resolution) {
		this.resolution = resolution;
	}

	public String getresolution() {
		return resolution;
	}

	@Override
	public String toString() {
		return "DSDevice_Details [id=" + id + ", vendor=" + vendor
				+ ", device_id=" + device_id + ", name=" + name + ", version="
				+ version + ", os=" + os + ", status=" + status
				+ ", reservation=" + reservation + ", reservation_id="
				+ reservation_id + ", time=" + time + ", reservation_time="
				+ reservation_time + ", udid=" + udid + ", deviceCategory="
				+ devicecategory + ", agentlocation=" + agentlocation + ", resolution=" + resolution + "]";
	}
	
	
}
