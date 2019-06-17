package com.cg.digi.model;

public class Reserve {
	 private String device_id;
	 private String reservation_time;
	 private String status;
	 private String mailID;
	
	
	public Reserve() {
	}
	
	
	public String getDeviceId() {
		return device_id;
	}

	public void setDeviceId(String device_id) {
		this.device_id = device_id;
	}
	public String getTime() {
		return reservation_time;
	}

	public void setTime(String reservation_time) {
		this.reservation_time = reservation_time;
	}
	public String getMailId() {
		return mailID;
	}

	public void setMailId(String mailID) {
		this.mailID = mailID;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Reserve ["
				+(device_id != null ? "device_id=" + device_id + ", " : "")
				+(reservation_time != null ? "reservation_time=" + reservation_time + ", " : "")
				+(mailID != null ? "mailID=" + mailID + ", " : "")
				+(status != null ? "status=" + status + ", " : "")
				+ "]";
	}

}
