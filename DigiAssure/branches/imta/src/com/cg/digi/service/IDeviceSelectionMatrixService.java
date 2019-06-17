package com.cg.digi.service;

import java.io.File;
import java.time.LocalDate;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.cg.digi.model.Account;
import com.cg.digi.model.DeviceCatalog;
import com.cg.digi.model.Market;
import com.cg.digi.model.MobileLabCatalog;
import com.cg.digi.model.OsDetails;
import com.cg.digi.model.OsDistribution;
import com.cg.digi.model.Project;
import com.cg.digi.model.Reservation;
import com.cg.digi.model.User;
import com.cg.digi.model.VendorMarketTrend;
import com.cg.digi.model.Vendor_MarketShare;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public interface IDeviceSelectionMatrixService {

	public List<Market> getMarkets();

	public List<DeviceCatalog> getDevices();
	
	//Adding for Market selection
	//public List<DeviceCatalog> getPopularDevices(String market, String count);
	
	public List<Vendor_MarketShare> getHighestMarket(String market);

	public List<DeviceCatalog> getRecommendedDevices(String market, String count);

	boolean addReservationDetails(Reservation reserve);

	public boolean updateReservationDetails(String deviceid);

	public boolean updateDeviceCatalog();

	public String getPerfectoReserveId(String deviceId);
	
	//public String getpCloudyReserveId(String deviceId);


	public boolean bookDevice(Reservation reservation);

	public List<MobileLabCatalog> getdeviceRequests();
	public JsonArray getVendorMarketShare(String marketid);
	Market getMarket(String marketid);
	boolean addMarketTrend(String market, String filePath, String type);
	public JsonArray getOsMarketShare(String marketid);


	public boolean updateDeviceReservations(String reservationid,
			String status, String comment);



	boolean addDeviceDetails(DeviceCatalog device, String vendor);

	public DeviceCatalog getDeviceDetails(String devicecatalogid);

	public boolean deleteDevice(String devicecatalogid);

	public boolean updateDeviceCatalog(DeviceCatalog device);

	//ALL REQUESTSS
		public List<MobileLabCatalog> getAllRequests();
		public List<MobileLabCatalog> getAllRequests(String createdby);
		
		//REQUESTED BOOKINGS
		public List<MobileLabCatalog> getAllRequestedBookings();
		public List<MobileLabCatalog> getUserRequestedBookings(String createdby);

		///USERS
		
		public List<User> viewUsers();
		public boolean addUser(User user);

	public	List<Reservation> getReservations(List<String> deviceId,
				String startDate, String endDate);

	
	///PROJECTS
			public List<Project> viewProjects();
			public boolean deleteProject(String projectId);
			public boolean checkProject(String userName);
			public boolean addProject(Project project);
			public boolean editProject(Project project);
			public List<Account> getAccounts();

			List<Reservation> getAllReservationsDetails(String string,
					String string2);

			public JSONArray getDeviceUsage();

			public JSONArray getUserUsage();

			public boolean addDeviceDeatils(File file);

			public List<DeviceCatalog> getDevices(String vendor);

			public List<String> getVendors();

			public List<Reservation> getEverydayReservation(List<String> deviceId,String startDate,
					String endDate);

			public List<Reservation> getReservations(String userid,
					String deviceId, String startDate);

			public JSONArray getDeviceStatusRate();

			public List<Reservation> getReservationCount();

			public JSONArray getDeviceUsage(String time);

			public JSONArray getDeviceUsage(String start, String end);

			public JSONArray getUserUsage(String time);

			public JSONArray getUserUsage(String start, String end);

			public JSONArray getReservationCount(String time);

			public JSONArray getReservationCount(String start, String end);


			public List<Reservation> updateDeviceStatus(List<Reservation> reservation, LocalDate startDate,
					LocalDate plusDays);


			public JSONArray getOsDistribution(String osid);

			public OsDetails getOsDetails(String osName);

			public JsonArray filterVendorMarketShare(String marketid, String duration);

			public JsonArray filterOsMarketShare(String marketid, String duration);
			public List<String> getmonthsdata(String marketid);

			public JsonArray getandroidversion(String marketid);

			public JsonArray getiosversion(String marketid);

			public JsonArray filterAndroidVersion(String marketid, String duration);

			public JsonArray filteriOSVersion(String marketid, String duration);
			

			

			

}
