/**
 * 
 */
package com.cg.digi.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cg.digi.dao.IDeviceCloudDao;
import com.cg.digi.model.Basic_Details;
import com.cg.digi.model.DSDevice_Details;
import com.cg.digi.model.Reserve;
import com.cg.digi.model.Vendor_MarketShare;
import com.cg.digi.model.Vendor_Names;
import com.cg.digi.model.Consolidate_Details;

/**
 * @author hp818661
 * 
 */
@Component("deviceCloudService")
public class DeviceCloudService implements IDeviceCloudService {

	@Autowired
	IDeviceCloudDao iDeviceCloudDao;

	public List<Vendor_MarketShare> getVendorData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.getVendorData();
	}

	@Override
	public List<Basic_Details> BasicDeviceData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.BasicDeviceData();
	}

	@Override
	public List<DSDevice_Details> DeviceData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.DeviceData();
	}

	@Override
	public boolean BasicToConsolidatedData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.BasicToConsolidatedData();
	}




	@Override
	public List<Consolidate_Details> ConsolidatedData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.ConsolidatedData();
	}

	@Override
	public List<Vendor_Names> DisplayVendor_Names() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.DisplayVendor_Names();
	}


	@Override
	public List<Consolidate_Details> AppleSelectDevices(int os, int vn,
			String tp, int max) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.AppleSelectDevices(os, vn, tp, max);
	}

	@Override
	public int apple_versp(int vn, int nsp) {
		return iDeviceCloudDao.apple_versp(vn, nsp);
	}

	@Override
	public int apple_vertb(int vn, int ntb) {
		return iDeviceCloudDao.apple_vertb(vn, ntb);
	}

	@Override
	public int android_versp(int vn, int nsp) {
		return iDeviceCloudDao.android_versp(vn, nsp);
	}

	@Override
	public int android_vertb(int vn, int ntb) {
		return iDeviceCloudDao.android_vertb(vn, ntb);
	}

	@Override
	public List<Consolidate_Details> AndroidSelectDevices(int os, int vn,
			String tp, int max) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.AndroidSelectDevices(os, vn, tp, max);
	}

	@Override
	public int MWindows_versp(int vns, int nsp) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.MWindows_versp(vns, nsp);
	}

	@Override
	public int MWindows_vertb(int vnt, int ntb) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.MWindows_vertb(vnt, ntb);
	}

	@Override
	public List<Consolidate_Details> MWindowsSelectDevices(int os, int vn,
			String tp, int max) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.MWindowsSelectDevices(os, vn, tp, max);
	}

	@Override
	public int Rim_versp(int vns, int nsp) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.Rim_versp(vns, nsp);
	}

	@Override
	public int Rim_vertb(int vnt, int ntb) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.Rim_vertb(vnt, ntb);
	}

	@Override
	public List<Consolidate_Details> RIMSelectDevices(int os, int vn,
			String tp, int max) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.RIMSelectDevices(os, vn, tp, max);
	}

	@Override
	public boolean InsertVendor_MarketShare(String vend_names,
			String vend_namesm, double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertVendor_MarketShare(vend_names,
				vend_namesm, data_values);
	}

	@Override
	public boolean TruncateVendor_MarketShare() {
		return iDeviceCloudDao.TruncateVendor_MarketShare();
	}

	@Override
	public boolean InsertOS_MarketShare(String os_names, String os_namesm,
			double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertOS_MarketShare(os_names, os_namesm,
				data_values);
	}

	@Override
	public boolean Insert_BasicDeviceData(int vend_id, int OS_id, int ver_id,
			String ver_nm, String model_nm, String tp, String resolution) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.Insert_BasicDeviceData(vend_id, OS_id, ver_id,
				ver_nm, model_nm, tp, resolution);
	}

	@Override
	public List<Consolidate_Details> Suggestions(int os, int p, int n) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.Suggestions(os, p, n);
	}

	@Override
	public int SuggestionsPriorityCount(int os, int p, int npd) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.SuggestionsPriorityCount(os, p, npd);
	}

	@Override
	public boolean TruncateTemp_Data() {
		return iDeviceCloudDao.TruncateTemp_Data();
	}

	@Override
	public List<Vendor_MarketShare> getUKVendorData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.getUKVendorData();
	}

	@Override
	public List<Vendor_MarketShare> getAustraliaVendorData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.getAustraliaVendorData();
	}

	@Override
	public List<Vendor_MarketShare> getGlobalVendorData() {
		return iDeviceCloudDao.getGlobalVendorData();
	}

	@Override
	public List<Vendor_MarketShare> getUserVendorData() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.getUserVendorData();
	}


	@Override
	public boolean TruncateUKVendor_MarketShare() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.TruncateUKVendor_MarketShare();
	}

	@Override
	public boolean TruncateUserVendor_MarketShare() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.TruncateUserVendor_MarketShare();
	}

	@Override
	public boolean TruncateGlobalVendor_MarketShare() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.TruncateGlobalVendor_MarketShare();
	}

	@Override
	public boolean InsertUKVendor_MarketShare(String vend_names,
			String vend_namesm, double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertUKVendor_MarketShare(vend_names,
				vend_namesm, data_values);
	}

	@Override
	public boolean InsertUserVendor_MarketShare(String vend_names,
			String vend_namesm, double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertUserVendor_MarketShare(vend_names,
				vend_namesm, data_values);
	}

	@Override
	public boolean InsertGlobalVendor_MarketShare(String vend_names,
			String vend_namesm, double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertGlobalVendor_MarketShare(vend_names,
				vend_namesm, data_values);
	}

	@Override
	public boolean InsertUKOS_MarketShare(String os_names, String os_namesm,
			double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertUKOS_MarketShare(os_names, os_namesm,
				data_values);
	}

	@Override
	public boolean InsertUserOS_MarketShare(String os_names, String os_namesm,
			double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertUserOS_MarketShare(os_names, os_namesm,
				data_values);
	}

	@Override
	public boolean InsertGlobalOS_MarketShare(String os_names,
			String os_namesm, double data_values) {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.InsertGlobalOS_MarketShare(os_names, os_namesm,
				data_values);
	}

	@Override
	public int Count_Records() {
		// TODO Auto-generated method stub
		return iDeviceCloudDao.Count_Records();
	}

	@Override
	public boolean updateData(Consolidate_Details cd) {
		// TODO Auto-generated method stub
		return false;
	}

	// for perfecto

	public int addDevices(int id, String vendor, String device_id, String name,
			String version, String os, String status, String reservation,
			String reservation_id, String udid, String deviceCategory,
			String location, String resolution) {
		return iDeviceCloudDao.addDevices(id, vendor, device_id, name, version,
				os, status, reservation, reservation_id, udid, deviceCategory,
				location, resolution);

	}

	public int addPerfectoDevices(String deviceId, String reservationId) {
		return iDeviceCloudDao.addPerfectoDevices(deviceId, reservationId);
	}

	public int updateReservationId(String deviceId, String reservationId) {
		return iDeviceCloudDao.updateReservationId(deviceId, reservationId);
	}

	public String getPerfectoResevationId(String device_id) {
		return iDeviceCloudDao.getPerfectoResevationId(device_id);
	}

	public String getDeviceResevationId(String device_id) {
		return iDeviceCloudDao.getDeviceResevationId(device_id);
	}

	public int deletePerfectoDevice(String device_id) {
		return iDeviceCloudDao.deletePerfectoDevice(device_id);
	}

	public int deleteAllVendorDevice(String vendor) {
		return iDeviceCloudDao.deleteAllVendorDevice(vendor);
	}

	public int updateReservationtime(String deviceId, String reservation_time) {
		return iDeviceCloudDao
				.updateReservationtime(deviceId, reservation_time);
	}

	public int addReservationTime(String deviceId, String reservation_time) {
		return iDeviceCloudDao.addReservationTime(deviceId, reservation_time);
	}

	public int updateReservationTimeDB() {
		return iDeviceCloudDao.updateReservationTimeDB();
	}

	public int deleteReservationTime(String device_id) {
		return iDeviceCloudDao.deleteReservationTime(device_id);
	}

	@Override
	public boolean addMail(String deviceid, String mailid, String status) {

		return iDeviceCloudDao.addMail(deviceid, mailid, status);
	}

	@Override
	public Reserve getCheckMail(String deviceid) {

		return iDeviceCloudDao.getCheckMail(deviceid);
	}



	
}
