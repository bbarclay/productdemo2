package com.cg.digi.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Reservation implements Comparable<Reservation> {

	private String reservationid;
	private String devicecatalogid;
	private String reservationsessionid;
	private String starttime;
	private String endtime;
	private String status;
	private String creationtime;
	private String createdby;
	private String modifiedby;
	private String modifiedtime;
	private String message;
	private String approvalStatus;
	private String devicename;

	public Reservation() {
		super();
	}

	public Reservation(String reservationid, String devicecatalogid, String reservationsessionid, String starttime,
			String endtime, String status, String creationtime, String createdby, String modifiedby,
			String modifiedtime, String message, String approvalStatus, String devicename) {
		super();
		this.reservationid = reservationid;
		this.devicecatalogid = devicecatalogid;
		this.reservationsessionid = reservationsessionid;
		this.starttime = starttime;
		this.endtime = endtime;
		this.status = status;
		this.creationtime = creationtime;
		this.createdby = createdby;
		this.modifiedby = modifiedby;
		this.modifiedtime = modifiedtime;
		this.message = message;
		this.approvalStatus = approvalStatus;
		this.devicename = devicename;
	}

	public String getReservationid() {
		return reservationid;
	}

	public void setReservationid(String reservationid) {
		this.reservationid = reservationid;
	}

	public String getDevicecatalogid() {
		return devicecatalogid;
	}

	public void setDevicecatalogid(String devicecatalogid) {
		this.devicecatalogid = devicecatalogid;
	}

	public String getReservationsessionid() {
		return reservationsessionid;
	}

	public void setReservationsessionid(String reservationsessionid) {
		this.reservationsessionid = reservationsessionid;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreationtime() {
		return creationtime;
	}

	public void setCreationtime(String creationtime) {
		this.creationtime = creationtime;
	}

	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getDevicename() {
		return devicename;
	}

	public void setDevicename(String devicename) {
		this.devicename = devicename;
	}

	@Override
	public String toString() {
		return "Reservation [reservationid=" + reservationid + ", devicecatalogid=" + devicecatalogid
				+ ", reservationsessionid=" + reservationsessionid + ", starttime=" + starttime + ", endtime=" + endtime
				+ ", status=" + status + ", creationtime=" + creationtime + ", createdby=" + createdby + ", modifiedby="
				+ modifiedby + ", modifiedtime=" + modifiedtime + ", message=" + message + ", approvalStatus="
				+ approvalStatus + ", devicename=" + devicename + "]";
	}

	@Override
	public int compareTo(Reservation res) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int result = 0;
		try {
			Date resDate = sdf.parse(res.getStarttime());
			Date thisDate = sdf.parse(starttime);
			result = thisDate.compareTo(resDate);
		} catch (ParseException e) {
			e.printStackTrace();
			result = -1;
		}

		return result;
	}

}