package com.cg.digi.model;

import java.util.List;

public class DeviceCatalog implements Comparable<DeviceCatalog> {

	private String devicecatalogid;
	private String devicename;
	private String model;
	private String os;
	private String version;
	private String launchdate;
	private String resolution;
	private String devicetype;
	private String vendor;
	private String manufacturer;
	private String status;
	private String vendordeviceid;
	private String availability;
	private String location;
	private String simno;
	private List<String> browsers;
	private String connectivity;
	private String remarks;
	private String procurementdate;
	private String belongsto;
	private String imei;

	public DeviceCatalog() {
		super();
	}

	public DeviceCatalog(String devicecatalogid, String devicename,
			String model, String os, String version, String launchdate,
			String resolution, String devicetype, String vendor,
			String manufacturer, String status, String vendordeviceid,
			String availability, String location, String simno,
			List<String> browsers, String connectivity, String remarks,
			String procurementdate, String belongsto, String imei) {
		super();
		this.devicecatalogid = devicecatalogid;
		this.devicename = devicename;
		this.model = model;
		this.os = os;
		this.version = version;
		this.launchdate = launchdate;
		this.resolution = resolution;
		this.devicetype = devicetype;
		this.vendor = vendor;
		this.manufacturer = manufacturer;
		this.status = status;
		this.vendordeviceid = vendordeviceid;
		this.availability = availability;
		this.location = location;
		this.simno = simno;
		this.browsers = browsers;
		this.connectivity = connectivity;
		this.remarks = remarks;
		this.procurementdate = procurementdate;
		this.belongsto = belongsto;
		this.imei = imei;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public String getDevicecatalogid() {
		return devicecatalogid;
	}

	public void setDevicecatalogid(String devicecatalogid) {
		this.devicecatalogid = devicecatalogid;
	}

	public String getDevicename() {
		return devicename;
	}

	public void setDevicename(String devicename) {
		this.devicename = devicename;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getLaunchdate() {
		return launchdate;
	}

	public void setLaunchdate(String launchdate) {
		this.launchdate = launchdate;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public String getDevicetype() {
		return devicetype;
	}

	public void setDevicetype(String devicetype) {
		this.devicetype = devicetype;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVendordeviceid() {
		return vendordeviceid;
	}

	public void setVendordeviceid(String vendordeviceid) {
		this.vendordeviceid = vendordeviceid;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSimno() {
		return simno;
	}

	public void setSimno(String simno) {
		this.simno = simno;
	}

	public List<String> getBrowsers() {
		return browsers;
	}

	public void setBrowsers(List<String> browsers) {
		this.browsers = browsers;
	}

	public String getConnectivity() {
		return connectivity;
	}

	public void setConnectivity(String connectivity) {
		this.connectivity = connectivity;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getProcurementdate() {
		return procurementdate;
	}

	public void setProcurementdate(String procurementdate) {
		this.procurementdate = procurementdate;
	}

	public String getBelongsto() {
		return belongsto;
	}

	public void setBelongsto(String belongsto) {
		this.belongsto = belongsto;
	}

	@Override
	public String toString() {
		return "DeviceCatalog [devicecatalogid=" + devicecatalogid
				+ ", devicename=" + devicename + ", model=" + model + ", os="
				+ os + ", version=" + version + ", launchdate=" + launchdate
				+ ", resolution=" + resolution + ", devicetype=" + devicetype
				+ ", vendor=" + vendor + ", manufacturer=" + manufacturer
				+ ", status=" + status + ", vendordeviceid=" + vendordeviceid
				+ ", availability=" + availability + ", location=" + location
				+ ", simno=" + simno + ", browsers=" + browsers
				+ ", connectivity=" + connectivity + ", remarks=" + remarks
				+ ", procurementdate=" + procurementdate + ", belongsto="
				+ belongsto + ", imei=" + imei + "]";
	}

	@Override
	public int compareTo(DeviceCatalog arg1) {
		return Integer.parseInt(arg1.getVersion().split("\\.")[0].trim())
				- Integer.parseInt(this.getVersion().split("\\.")[0].trim());
	}

}
