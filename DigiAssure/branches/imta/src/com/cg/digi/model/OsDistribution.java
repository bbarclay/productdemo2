package com.cg.digi.model;

public class OsDistribution {
private String osdistributiondetailsid;
private String osid;
private String version;
private String rate;
private String status;
private String createdby;
private String creationtime;
private String modifiedby;
private String modifiedtime;
public OsDistribution() {
	super();
}
public OsDistribution(String osdistributiondetailsid, String osid, String version, String rate, String status,
		String createdby, String creationtime, String modifiedby, String modifiedtime) {
	super();
	this.osdistributiondetailsid = osdistributiondetailsid;
	this.osid = osid;
	this.version = version;
	this.rate = rate;
	this.status = status;
	this.createdby = createdby;
	this.creationtime = creationtime;
	this.modifiedby = modifiedby;
	this.modifiedtime = modifiedtime;
}
public String getOsdistributiondetailsid() {
	return osdistributiondetailsid;
}
public void setOsdistributiondetailsid(String osdistributiondetailsid) {
	this.osdistributiondetailsid = osdistributiondetailsid;
}
public String getOsid() {
	return osid;
}
public void setOsid(String osid) {
	this.osid = osid;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
public String getRate() {
	return rate;
}
public void setRate(String rate) {
	this.rate = rate;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getCreatedby() {
	return createdby;
}
public void setCreatedby(String createdby) {
	this.createdby = createdby;
}
public String getCreationtime() {
	return creationtime;
}
public void setCreationtime(String creationtime) {
	this.creationtime = creationtime;
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
@Override
public String toString() {
	return "OsDistribution [osdistributiondetailsid=" + osdistributiondetailsid + ", osid=" + osid + ", version="
			+ version + ", rate=" + rate + ", status=" + status + ", createdby=" + createdby + ", creationtime="
			+ creationtime + ", modifiedby=" + modifiedby + ", modifiedtime=" + modifiedtime + "]";
}




}
