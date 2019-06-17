package com.cg.digi.dao;

import java.time.LocalDate;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Account;
import com.cg.digi.model.Dashboard;
import com.cg.digi.model.DeviceCatalog;
import com.cg.digi.model.Market;
import com.cg.digi.model.MobileLabCatalog;
import com.cg.digi.model.OSVersion;
import com.cg.digi.model.OsDetails;
import com.cg.digi.model.OsDistribution;
import com.cg.digi.model.Project;
import com.cg.digi.model.Reservation;
import com.cg.digi.model.User;
import com.cg.digi.model.VendorMarketTrend;
import com.cg.digi.model.Vendor_MarketShare;

@Component("matrixDao")
public class DeviceSelectionMatrixDaoImpl implements IDeviceSelectionMatrixDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public String getPerfectoReserveIdDao(String deviceId) {

		// System.out.println(deviceId+"Perfecto");
		String query = "SELECT * FROM  mobilelab.reservation WHERE devicecatalogid='" + deviceId + "' and status='Y'";
		Reservation reservation;
		String reservationId = "";
		try {
			reservation = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(Reservation.class));
			reservationId = reservation.getReservationsessionid();
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getPerfectoReserveIdDao() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getPerfectoReserveIdDao() :: " + e, LEVEL.error);
		}
		return reservationId;
	}
	
	/*@Override
	public String getpCloudyReserveIdDao(String deviceId) {

	   System.out.println("inside getpCloudyReserveIdDao");
		String query = "SELECT * FROM  mobilelab.reservation WHERE devicecatalogid='" + deviceId + "' and status='Y'";
		Reservation reservation;
		String reservationId = "";
		try {
			reservation = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(Reservation.class));
			reservationId = reservation.getReservationsessionid();
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getpCloudyReserveIdDao() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getpClouyReserveIdDao() :: " + e, LEVEL.error);
		}
		return reservationId;
	}*/

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Market> getMarkets() {
		String query = "SELECT * FROM  mobilelab.market WHERE status= 'Y'";
		List<Market> markets = null;
		try {
			markets = jdbcTemplate.query(query, new BeanPropertyRowMapper(Market.class));
			DigiLoggerUtils.log("Market details in Dao  : " + markets, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getMarkets() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getMarkets() :: " + e, LEVEL.error);
		}
		return markets;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<DeviceCatalog> getDevices() {
		System.out.println("Fetching details from device catalog");
		String query = "SELECT device_catalog.devicecatalogid,device_catalog.devicename,device_catalog.model,device_catalog.os,device_catalog.version,device_catalog.launchdate,device_catalog.resolution,device_catalog.devicetype,device_catalog.vendor,device_catalog.manufacturer,device_catalog.status,device_catalog.vendordeviceid,device_catalog.availability,device_catalog.imei,device_catalog.simno,CASE WHEN  device_catalog.belongsto is  null THEN 'None' WHEN  device_catalog.belongsto =0 THEN 'None' WHEN device_catalog.belongsto is not null THEN (select projectname from digiassure.project, mobilelab.device_catalog where  device_catalog.belongsto=project.projectid) END as belongsto,device_catalog.location,device_catalog.browsers,device_catalog.connectivity,device_catalog.remarks,device_catalog.procurementdate \r\n" + 
				"FROM mobilelab.device_catalog ;";
		System.out.println("Executed querry");
		List<DeviceCatalog> devices = null;
		System.out.println("catalog list created");
		try {
			devices = jdbcTemplate.query(query, new BeanPropertyRowMapper(DeviceCatalog.class));
			DigiLoggerUtils.log("Devices in Dao  : " + devices, LEVEL.trace);
			System.out.println("inside try");
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getDevices() :: " + e, LEVEL.error);
			System.out.println("inside catch 1");
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getDevices() :: " + e, LEVEL.error, DeviceSelectionMatrixDaoImpl.class);
			System.out.println("inside catch2");

		}
		System.out.println("recommend device dao successful");
		// System.out.println("overall Devices (dev sel matrix dao):"+devices); //successful
		return devices;
	}
	
	//Adding for Market Selection
	/*@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<DeviceCatalog> getPopularDevices(String market, String count) {
		String queryGlobal = "SELECT * FROM mobilelab.device_catalog where status='Y' AND marketname='GLOBAL'";
		String queryUs = "SELECT * FROM mobilelab.device_catalog where status='Y' AND marketname='GLOBAL'";
		String queryUk = "SELECT * FROM mobilelab.device_catalog where status='Y' AND marketname='GLOBAL'";
		String query = null;
		
		String constQuery = "SELECT * FROM mobilelab.device_catalog where status='Y' AND marketname=";
		String limitRecordQuery = " LIMIT ";
		String query = null;
		
		List<DeviceCatalog> devices = null;
		try {
			if(market.equals("GLOBAL"))
			{
				query = constQuery+"'"+market+"'"+limitRecordQuery+count;
				System.out.println("Global Query is========"+query);
			}
			if(market.equals("US"))
			{
				query = constQuery+"'"+market+"'"+limitRecordQuery+count;
				System.out.println("US Query is========"+query);
			}
			if(market.equals("UK"))
			{
				query = constQuery+"'"+market+"'"+limitRecordQuery+count;
				System.out.println("UK Query is========"+query);
			}
			if(market.equals("Australia"))
			{
				query = constQuery+"'GLOBAL'"+limitRecordQuery+count;
				System.out.println("Other Query is========"+query);
			}
			
			devices = jdbcTemplate.query(query, new BeanPropertyRowMapper(DeviceCatalog.class));
			DigiLoggerUtils.log("Devices in Dao  : " + devices, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getDevices() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getDevices() :: " + e, LEVEL.error, DeviceSelectionMatrixDaoImpl.class);

		}
		// System.out.println("overall Devices:"+devices);
		return devices;
	}*/

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Vendor_MarketShare> getHighestMarket(String market) { //14_jan(4)
		List<Vendor_MarketShare> marketData = null;
		String marketTable = "dscglobalvendor_marketshare";
		if (market.equalsIgnoreCase("US")) {
			marketTable = "DSCVendor_MarketShare";
		} else if (market.equalsIgnoreCase("UK")) {
			marketTable = "dscukvendor_marketshare";
		} else if (market.equalsIgnoreCase("AUSTRALIA")) {
			marketTable = "dscaustraliavendor_marketshare";
		} else if (market.equalsIgnoreCase("GLOBAL")) {
			marketTable = "dscglobalvendor_marketshare";
		} else if (market.equalsIgnoreCase("Canada")) {
			marketTable = "dsccanadavendor_marketshare";
		}
		String query = "SET sql_mode='';Select * from ( SELECT  a.Sr_No,a.Vendor_Name,str_to_date(a.Month,'%Y-%m') as Month,a.Value FROM  "
				+ marketTable + " a) as c "
				+ "INNER JOIN       (        SELECT   MAX(str_to_date(Month,'%Y-%m')) mxdate FROM    "
				+ marketTable + " )b  ON  c.Month=b.mxdate";

		try {
			marketData = jdbcTemplate.query(query, new BeanPropertyRowMapper(Vendor_MarketShare.class));
			DigiLoggerUtils.log("Market Data in Dao  : " + marketData, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getHighestMarket() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getHighestMarket() :: " + e, LEVEL.error,
					DeviceSelectionMatrixDaoImpl.class);
		}
		return marketData;
	}

	@Override
	public boolean addReservationDetails(Reservation reserve) {
		int result = 0;
		String query = "INSERT INTO mobilelab.reservation(devicecatalogid,reservationsessionid,starttime,endtime,message,status,creationtime,createdby,approvalStatus) VALUES (?,?,?,?,?,'Y',current_time,?,?)";
		Object[] params = new Object[] { reserve.getDevicecatalogid(), reserve.getReservationsessionid(),
				reserve.getStarttime(), reserve.getEndtime(), reserve.getMessage(), reserve.getCreatedby(),
				reserve.getApprovalStatus() };
		try {
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error inaddReservationDetails(Reservation reserve) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean updateDeviceCatalog(String devicecatalogid, String status) {
		int result = 0;
		String query = "UPDATE mobilelab.device_catalog SET availability=? where devicecatalogid=?";
		try {
			Object[] params = new Object[] { status, devicecatalogid };
			result = jdbcTemplate.update(query, params);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error updateDeviceCatalog(String devicecatalogid) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean updateReservationDetails(String deviceid) {
		int result = 0;
		String query = "UPDATE mobilelab.reservation SET status=?,endtime=current_time where devicecatalogid=? and status=?";
		try {
			Object[] params = new Object[] { "N", deviceid, "Y" };
			result = jdbcTemplate.update(query, params);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error updateReservationDetails(String deviceid) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean updateDeviceCatalog(JSONArray devices, String vendor) {    //11_jan(2)
		System.out.println("inside updateDeviceCatalog in DeviceSelectionmatrixDaoImpl");
		String query = "UPDATE  mobilelab.device_catalog SET  status=? where vendor=?";
		System.out.println("successfully executed querry");
		try {
System.out.println("inside try");
			Object[] params = new Object[] { "N", vendor };
			jdbcTemplate.update(query, params);
			for (Object deviceObj : devices) {

				JSONObject device = (JSONObject) deviceObj;
				//System.out.println("Device in device sel matrixdalimpl"+device);
			//	System.out.println("inside for");

				// check for availability of device
				if (!checkDevice(device)) {
					// insert new data
					//System.out.println("inside if");
					//if (!device.get("osVersion").equals("")) 
					//{
					System.out.println("entering adddevice method");
						addDevice(device, vendor);    //11_jan(3)
						//System.out.println("insde if ->if");
					//}
				} else {
					//System.out.println("inside else");
					String location = "-";
					String imei = "-";
					/*if (vendor.equalsIgnoreCase("Seetest")) {
						location = device.get("agentLocation").toString();
						imei = device.get("udid").toString();
						System.out.println("inside elseif 1");
					}*/
					if (vendor.equalsIgnoreCase("Perfecto Partner")) {
						imei = device.get("id").toString();
						location = device.get("location").toString();
						//System.out.println("inside elseif 2");
					}
					
					if(vendor.equalsIgnoreCase("pCloudy")) {
						imei = device.get("id").toString();
						location = device.get("location").toString();
						//System.out.println("inside elseif 3");
					}

					query = "UPDATE  mobilelab.device_catalog SET  availability=?, status=?,imei=?,location=? where vendordeviceid=?";
					params = new Object[] { device.get("displayStatus").toString(), "Y", imei, location,
							device.get("id").toString() };
					jdbcTemplate.update(query, params);
				}

			}
		} catch (Exception e) {
			DigiLoggerUtils.log("Error updateDeviceCatalog() Dao :: " + e.getMessage(), LEVEL.error);
			System.out.println("inside catch");

		}
		System.out.println("exiting updateDeviceCatalog in DeviceSelectionmatrixDaoImpl");
		return true;
	}

	private boolean addDevice(JSONObject device, String vendor) { //11_jan(4)
		int result = 0;
		try {
			String query = "INSERT INTO mobilelab.device_catalog(imei,devicename,model,os,version,devicetype,vendor,manufacturer,status,vendordeviceid,availability,location) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			String location = "-";
			String imei = "-";
			if (vendor.equalsIgnoreCase("Seetest")) {
				location = device.get("agentLocation").toString();
				imei = device.get("udid").toString();
			}
			if (vendor.equalsIgnoreCase("Perfecto Partner")) {
				imei = device.get("id").toString();
				location = device.get("location").toString();
			}
			if (vendor.equalsIgnoreCase("pCloudy Partner")) {
				imei = device.get("id").toString();
				location = device.get("location").toString();
			}
			
			Object[] params = new Object[] { imei, device.get("deviceName").toString(), device.get("model").toString(),
					device.get("deviceOs").toString(), device.get("osVersion").toString(),
					device.get("deviceCategory").toString(), vendor, device.get("manufacturer").toString(), "Y",
					device.get("id").toString(), device.get("displayStatus").toString(), location };
			result = jdbcTemplate.update(query, params);
			DigiLoggerUtils.log("Device Inserted " + device, LEVEL.info);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error addDevice() Dao :: " + e.getMessage(), LEVEL.error);
		}

		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("deprecation")
	public boolean checkDevice(JSONObject device) {
	//	System.out.println("inside check device");
		int result = 0;
		try {
			//System.out.println("vendor id "+ device.get("id").toString() );
			String query = "SELECT COUNT(*) FROM mobilelab.device_catalog where vendordeviceid='"
					+ device.get("id").toString() + "'";
			
			result = jdbcTemplate.queryForInt(query);
          // System.out.println("inside try (checkdevice)");
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error checkDevice() Dao :: " + e.getMessage(), LEVEL.error);

		}

		if (result > 0) {
			//System.out.println("result>0");
			return true;
		} else {
			//System.out.println("result!>0");
			return false;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Reservation> getReservations(List<String> deviceId, String startDate, String endDate) {
		String deviceIdSeries = "";
		for (String string : deviceId) {
			deviceIdSeries += string + ",";
		}
		deviceIdSeries = deviceIdSeries.substring(0, deviceIdSeries.lastIndexOf(","));
		String query = "SELECT reservationid,d.devicename,r.devicecatalogid,reservationsessionid,r.starttime,r.endtime as endtime,message,r.status,creationtime,createdby,modifiedby,modifiedtime,approvalStatus"
				+ " FROM  mobilelab.reservation r, mobilelab.device_catalog d where (r.starttime BETWEEN '" + startDate
				+ "' AND '" + endDate + "' OR r.endtime BETWEEN '" + startDate + "' AND '" + endDate
				+ "' ) and r.status='Y' and d.devicecatalogid=r.devicecatalogid and r.devicecatalogid IN ("
				+ deviceIdSeries + ")";
		List<Reservation> reservations = null;
		try {
			reservations = jdbcTemplate.query(query, new BeanPropertyRowMapper(Reservation.class));
			DigiLoggerUtils.log("getReservations in Dao  : " + reservations, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getReservations() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getReservations() :: " + e, LEVEL.error,
					DeviceSelectionMatrixDaoImpl.class);

		}
		return reservations;
	}

	@Override
	public DeviceCatalog getDeviceDetails(String devicecatalogid) {
		String query = "SELECT * FROM  mobilelab.device_catalog WHERE devicecatalogid='" + devicecatalogid
				+ "' and status='Y'";
		DeviceCatalog device = null;
		try {
			device = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(DeviceCatalog.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getDeviceDetails() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getDeviceDetails() :: " + e, LEVEL.error);
		}
		return device;

	}

	/*
	 * @SuppressWarnings({ "unchecked", "rawtypes" })
	 * 
	 * @Override public List<DeviceCatalog> getdeviceRequests() { String query =
	 * "SELECT reservationid,d.devicename,r.devicecatalogid,d.os,d.version,d.resolution,d.vendor,date(r.starttime) as starttime,date(r.endtime) as endtime,r.approvalStatus,u.username as createdby "
	 * +
	 * "from mobilelab.device_catalog d,mobilelab.reservation r,digiassure.users u where d.devicecatalogid=r.devicecatalogid and r.status='Y' and r.approvalStatus='Requested' and u.userid=r.createdby "
	 * ; List<DeviceCatalog> catalog = null; try { catalog =
	 * jdbcTemplate.query(query, new BeanPropertyRowMapper( DeviceCatalog.class)); }
	 * catch (DataAccessException e) {
	 * DigiLoggerUtils.log("DataAccessException in getdeviceRequests()" +
	 * e.getMessage(), DigiLoggerUtils.LEVEL.error, this.getClass()); } catch
	 * (Exception e) { e.printStackTrace(); }
	 * System.out.println("catalog:"+catalog); return catalog; }
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<MobileLabCatalog> getdeviceRequests() {
		String query = "SELECT reservationid,d.devicename,r.devicecatalogid,d.os,d.version,d.resolution,d.vendor,date(r.starttime) as starttime,date(r.endtime) as endtime,r.approvalStatus,u.username as createdby "
				+ "from mobilelab.device_catalog d,mobilelab.reservation r,digiassure.users u where d.devicecatalogid=r.devicecatalogid and r.status='Y' and r.approvalStatus='Requested' and u.userid=r.createdby ";
		List<MobileLabCatalog> catalog = null;
		try {
			catalog = jdbcTemplate.query(query, new BeanPropertyRowMapper(MobileLabCatalog.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getdeviceRequests()" + e.getMessage(),
					DigiLoggerUtils.LEVEL.error, this.getClass());
		} catch (Exception e) {

		}
		return catalog;
	}

	@Override
	public boolean updateDeviceReservations(String reservationid, String status, String comment) {
		int result = 0;
		try {
			String query = "UPDATE  mobilelab.reservation SET  approvalStatus=?,message=? where reservationid=?";
			Object[] params = new Object[] { status, comment, reservationid };
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in updateDeviceReservations(String reservationid, String status)"
					+ e.getMessage(), DigiLoggerUtils.LEVEL.error, this.getClass());
		} catch (Exception e) {

		}
		if (result > 0) {
			return true;
		}

		return false;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<DeviceCatalog> getDevices(String vendor) {
		// String query =
		// "SELECT * FROM mobilelab.device_catalog where status='Y' and vendor='Lab'";

		String query = "SELECT devicecatalogid,devicename,model,os,version,launchdate,resolution,devicetype,vendor,manufacturer,status,vendordeviceid,availability,imei,simno,location,"
				+ "browsers,connectivity,remarks,procurementdate, case when belongsto='0' then 'none' else (select projectname from digiassure.project where projectid=belongsto) end as belongsto"
				+ "	FROM mobilelab.device_catalog d where vendor='" + vendor + "' and status='Y' ";

		List<DeviceCatalog> devices = null;
		try {
			devices = jdbcTemplate.query(query, new BeanPropertyRowMapper(DeviceCatalog.class));
			DigiLoggerUtils.log("Devices in Dao  : " + devices, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getDevices(String vendor) :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getDevices() :: " + e, LEVEL.error, DeviceSelectionMatrixDaoImpl.class);

		}
		return devices;
	}

	@Override
	public boolean addDeviceDetails(DeviceCatalog device, String vendor) {
		int result = 0;
		String browsers = "";
		for (String browser : device.getBrowsers()) {
			browsers += browser + ",";
		}

		try {
			String query = "INSERT INTO mobilelab.device_catalog(devicename,model,os,version,devicetype,vendor,manufacturer,status,vendordeviceid,availability,location,simno,browsers,connectivity,remarks,procurementdate,belongsto,imei) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = new Object[] { device.getDevicename(), device.getModel(), device.getOs(),
					device.getVersion(), device.getDevicetype(), vendor, device.getManufacturer(), "Y",
					device.getVendordeviceid(), device.getAvailability(), device.getLocation(), device.getSimno(),
					browsers, device.getConnectivity(), device.getRemarks(), device.getProcurementdate(),
					device.getBelongsto(), device.getImei() };
			result = jdbcTemplate.update(query, params);
			DigiLoggerUtils.log("Device added: " + device, LEVEL.info);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error addDeviceDetails(DeviceCatalog  device, String vendor) Dao :: " + e.getMessage(),
					LEVEL.error);
		}

		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteDevice(String devicecatalogid) {
		String query = "UPDATE  mobilelab.device_catalog SET  status=? where devicecatalogid=?";
		int result = 0;
		try {

			Object[] params = new Object[] { "N", devicecatalogid };
			result = jdbcTemplate.update(query, params);
		} catch (Exception e) {

		}
		if (result > 0) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean updateDeviceCatalog(DeviceCatalog device) {
		String browsers = "";
		for (String browser : device.getBrowsers()) {
			browsers += browser + ",";
		}
		String query = "UPDATE  mobilelab.device_catalog SET  devicecatalogid=?,devicename=?,model=?,os=?,version=?,launchdate=?,resolution=?,devicetype=?,vendor=?,manufacturer=?,status=?,vendordeviceid=?,availability=?,imei=?,simno=?,belongsto=?,location=?,browsers=?,connectivity=?,remarks=?,procurementdate=? where devicecatalogid=?";
		int result = 0;
		try {

			Object[] params = new Object[] { device.getDevicecatalogid(), device.getDevicename(), device.getModel(),
					device.getOs(), device.getVersion(), device.getLaunchdate(), device.getResolution(),
					device.getDevicetype(), device.getVendor(), device.getManufacturer(), "Y",
					device.getVendordeviceid(), "Available In Lab", device.getImei(), device.getSimno(),
					device.getBelongsto(), device.getLocation(), browsers, device.getConnectivity(),
					device.getRemarks(), device.getProcurementdate(), device.getDevicecatalogid() };
			result = jdbcTemplate.update(query, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public List<MobileLabCatalog> getAllRequestsDao() {

		String query = "SELECT d.devicename,d.os,d.version,d.resolution,d.vendor,r.starttime,r.endtime,r.approvalStatus,u.username as createdby,r.message  from users u, mobilelab.device_catalog d,mobilelab.reservation r where d.devicecatalogid=r.devicecatalogid and r.status='Y' and u.userid=r.createdby";
		List<MobileLabCatalog> catalog = jdbcTemplate.query(query, new BeanPropertyRowMapper(MobileLabCatalog.class));

		return catalog;
	}

	@Override
	public List<MobileLabCatalog> getAllRequestsDao(String createdby) {
		String query = "SELECT d.devicename,d.os,d.version,d.resolution,d.vendor,r.starttime,r.endtime,r.approvalStatus,u.username as createdby,r.message from users u,mobilelab.device_catalog d,mobilelab.reservation r where d.devicecatalogid=r.devicecatalogid and r.status='Y' and r.createdby='"
				+ createdby + "'  and u.userid=r.createdby";
		List<MobileLabCatalog> catalog = jdbcTemplate.query(query, new BeanPropertyRowMapper(MobileLabCatalog.class));

		return catalog;
	}

	@Override
	public List<MobileLabCatalog> getUserRequestedBookingsDao(String createdby) {
		String query = "SELECT d.devicename,d.os,d.version,d.resolution,d.vendor,r.starttime,r.endtime,r.approvalStatus,u.username as createdby,r.reservationid,r.message  from users u, mobilelab.device_catalog d,mobilelab.reservation r where d.devicecatalogid=r.devicecatalogid and r.status='Y' and r.approvalStatus='requested' and r.createdby='"
				+ createdby + "' and u.userid=r.createdby";
		List<MobileLabCatalog> catalog = jdbcTemplate.query(query, new BeanPropertyRowMapper(MobileLabCatalog.class));

		return catalog;
	}

	@Override
	public List<MobileLabCatalog> getAllRequestedBookingsDao() {
		String query = "SELECT d.devicename,d.os,d.version,d.resolution,d.vendor,r.starttime,r.endtime,r.approvalStatus,u.username as createdby,r.reservationid,r.message  from users u, mobilelab.device_catalog d,mobilelab.reservation r where d.devicecatalogid=r.devicecatalogid and r.status='Y' and r.approvalStatus='requested' and u.userid=r.createdby";
		List<MobileLabCatalog> catalog = jdbcTemplate.query(query, new BeanPropertyRowMapper(MobileLabCatalog.class));

		return catalog;
	}

	@Override
	public List<User> viewUsersDao() {

		String query = "SELECT u.firstname,u.lastname,u.username,u.phonenumber,u.email,r.rolename from users u, roles r where r.roleid=u.roleid and u.status='Y'";
		List<User> users = jdbcTemplate.query(query, new BeanPropertyRowMapper(User.class));
		return users;
	}

	@Override
	public boolean addUserDao(User user) {

		try {
			String query2 = "SELECT roleid from roles where rolename='" + user.getRolename() + "'";
			int roleId = jdbcTemplate.queryForInt(query2);
			String query = "INSERT INTO users(username,userpassword,firstname,lastname,email,phonenumber,roleid,status,projectid) VALUES (?,?,?,?,?,?,?,?,?)";
			Object[] params = new Object[] { user.getUserName(), user.getUserPassword(), user.getFirstName(),
					user.getLastName(), user.getEmail(), user.getPhoneNumber(), roleId, "Y", user.getProjectid() };

			int result = jdbcTemplate.update(query, params);
			if (result > 0) {
				return true;
			} else {
				return false;
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}

	// ///////// /////////////PROJETCS //////////// ////////////

	@Override
	public List<Project> viewProjectsDao() {
		String query = "SELECT p.projectid,p.projectname,p.projectdescription,p.startdate,p.enddate,p.status,a.accountname from project p, accounts a where a.accountid=p.accountid and p.status='Y' ORDER BY p.projectname ASC";
		List<Project> projects = jdbcTemplate.query(query, new BeanPropertyRowMapper(Project.class));
		return projects;
	}

	@Override
	public boolean deleteProjectDao(String projectId) {

		String query = "UPDATE project SET  status='N' where projectid='" + projectId + "'";
		int result = jdbcTemplate.update(query);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean checkProjectDao(String projectname) {
		int result = 0;
		try {
			String query = "SELECT COUNT(*) FROM project where status='Y' and projectname='" + projectname.toLowerCase()
					+ "'";
			result = jdbcTemplate.queryForInt(query);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error checkUserDAo Dao :: " + e.getMessage(), LEVEL.error);

		}

		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addProjectDao(Project project) {
		/*
		 * String query2="SELECT accountid from accounts where  accountname='"+project
		 * .getAccountname().toLowerCase()+"'"; int
		 * accountId=jdbcTemplate.queryForInt(query2);
		 */

		String query = "INSERT INTO project(projectname,projectdescription,startdate,enddate,status,accountid,creationtime) VALUES (?,?,?,?,'Y',?,current_time)";
		Object[] params = new Object[] { project.getProjectName().toLowerCase(), project.getProjectDescription(),
				project.getStartDate(), project.getEndDate(), "1" };

		int result = jdbcTemplate.update(query, params);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean editProjectDao(Project project) {
		int result = 0;
		/*
		 * String query1=
		 * "SELECT accountid from accounts where status='Y' and accountname='"
		 * +project.getAccountname()+"'"; int
		 * accountId=jdbcTemplate.queryForInt(query1);
		 */
		String query2 = "UPDATE project set projectdescription=?, startdate=?,enddate=?,accountid=? where projectname=?";
		try {

			Object[] params = new Object[] { project.getProjectDescription(), project.getStartDate(),
					project.getEndDate(), "1", project.getProjectName() };
			result = jdbcTemplate.update(query2, params);
		} catch (Exception e) {

		}
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public List<Account> getAccountsDao() {
		String query = "Select * from accounts where status='Y'";
		List<Account> accounts = jdbcTemplate.query(query, new BeanPropertyRowMapper(Account.class));
		return accounts;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Dashboard> getDeviceUsage() {
		String query = "SELECT count(*) * 3 as value,devicename as 'key' FROM mobilelab.reservation r, mobilelab.device_catalog d where d.devicecatalogid=r.devicecatalogid"
				+ " and approvalStatus='Approved' Group by devicename";
		List<Dashboard> dashboard = null;
		try {
			dashboard = jdbcTemplate.query(query, new BeanPropertyRowMapper(Dashboard.class));
			DigiLoggerUtils.log("Dashboard details in Dao  : " + dashboard, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getDeviceUsage() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getDeviceUsage() :: " + e, LEVEL.error);
		}
		return dashboard;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Dashboard> getUserUsage() {
		String query = "SELECT count(*) * 3 as value,CONCAT(firstname,' ',lastname)  as 'key' FROM mobilelab.reservation r, users u, mobilelab.device_catalog d  "
				+ "where u.userid=r.createdby and d.devicecatalogid=r.devicecatalogid and approvalStatus='Approved' Group by username";
		List<Dashboard> dashboard = null;
		try {
			dashboard = jdbcTemplate.query(query, new BeanPropertyRowMapper(Dashboard.class));
			DigiLoggerUtils.log("Dashboard details in Dao  : " + dashboard, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getUserUsage() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getUserUsage() :: " + e, LEVEL.error);
		}
		return dashboard;
	}

	@Override
	public List<String> getVendors() {
		String query = "SELECT DISTINCT vendor FROM mobilelab.device_catalog";
		List<String> vendors = null;
		try {
			vendors = jdbcTemplate.queryForList(query, String.class);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(e, LEVEL.error);
		}
		return vendors;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Reservation> getReservations(String userid, String deviceId, String startDate) {
		String query = "SELECT reservationid,d.devicename,r.devicecatalogid,reservationsessionid,r.starttime,r.endtime as endtime,message,r.status,creationtime,createdby,modifiedby,modifiedtime,approvalStatus FROM  mobilelab.reservation r, mobilelab.device_catalog d WHERE r.status='Y' and d.devicecatalogid=r.devicecatalogid  AND r.createdby='"
				+ userid + "' AND r.devicecatalogid='" + deviceId + "' AND DATE(r.starttime)='" + startDate
				+ "' AND (r.approvalStatus='Approved' OR r.approvalStatus='Requested')";
		System.out.println(query);
		List<Reservation> reservations = null;
		try {
			reservations = jdbcTemplate.query(query, new BeanPropertyRowMapper(Reservation.class));
		} catch (DataAccessException e) {
			e.printStackTrace();
			DigiLoggerUtils.log(e, LEVEL.error);
		}
		return reservations;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Reservation> getReservationCount() {

		String query = "SELECT count(*) as devicecatalogid , Date(creationtime) as creationtime from mobilelab.reservation where approvalStatus='Approved' group by Date(creationtime);";
		List<Reservation> reservations = null;
		try {
			reservations = jdbcTemplate.query(query, new BeanPropertyRowMapper(Reservation.class));
		} catch (DataAccessException e) {
			e.printStackTrace();
			DigiLoggerUtils.log(e, LEVEL.error);
		}
		return reservations;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Dashboard> getDeviceUsage(LocalDate start, LocalDate end) {
		String query = "SELECT count(*) * 3 as value,devicename as 'key' FROM mobilelab.reservation r, mobilelab.device_catalog d where d.devicecatalogid=r.devicecatalogid"
				+ " AND approvalStatus='Approved' AND DATE(starttime)  between '" + start + "' AND '" + end
				+ "' Group by devicename";
		List<Dashboard> dashboard = null;
		System.out.println(query);
		try {
			dashboard = jdbcTemplate.query(query, new BeanPropertyRowMapper(Dashboard.class));
			System.out.println(dashboard);
			DigiLoggerUtils.log("Dashboard details in Dao  : " + dashboard, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getDeviceUsage() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getDeviceUsage() :: " + e, LEVEL.error);
		}
		return dashboard;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Dashboard> getUserUsage(LocalDate start, LocalDate end) {
		String query = "SELECT count(*) * 3 as value,CONCAT(firstname,' ',lastname)  as 'key' FROM mobilelab.reservation r, users u, mobilelab.device_catalog d  "
				+ "where u.userid=r.createdby and d.devicecatalogid=r.devicecatalogid and approvalStatus='Approved' AND DATE(starttime)  between '"
				+ start + "' AND '" + end + "' Group by username";
		List<Dashboard> dashboard = null;
		try {
			dashboard = jdbcTemplate.query(query, new BeanPropertyRowMapper(Dashboard.class));
			DigiLoggerUtils.log("Dashboard details in Dao  : " + dashboard, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getUserUsage() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getUserUsage() :: " + e, LEVEL.error);
		}
		return dashboard;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reservation> getReservationCount(LocalDate start, LocalDate end) {

		String query = "SELECT count(*) as devicecatalogid , Date(creationtime) as creationtime from mobilelab.reservation where approvalStatus='Approved' AND DATE(starttime)  between '" + 
				 start + "' AND '" + end + "' group by Date(creationtime)";
		List<Reservation> reservations = null;
		try {
			reservations = jdbcTemplate.query(query, new BeanPropertyRowMapper(Reservation.class));
		} catch (DataAccessException e) {
			e.printStackTrace();
			DigiLoggerUtils.log(e, LEVEL.error);
		}
		return reservations;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Reservation> getCurrentOfflinrDeviceReservations() {

		String query = "select * from mobilelab.reservation where (current_time between starttime and endtime) AND approvalStatus='Approved' AND reservation.devicecatalogid IN (SELECT devicecatalogid FROM mobilelab.device_catalog where device_catalog.vendor='Lab')";
		List<Reservation> reservations = null;
		try {
			reservations = jdbcTemplate.query(query, new BeanPropertyRowMapper(Reservation.class));
		} catch (DataAccessException e) {
			e.printStackTrace();
			DigiLoggerUtils.log(e, LEVEL.error);
		}
		return reservations;

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<VendorMarketTrend> getVendorMarketShare(String marketid) {

		String query = "Select * from mobilelab.vendormarkettrends where marketid="
				+ marketid +" and status='Y'";
		List<VendorMarketTrend> vendorMarketTrends = null;
		try {
			vendorMarketTrends = jdbcTemplate.query(query,
					new BeanPropertyRowMapper(VendorMarketTrend.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getVendorMarketShare() :: "
					+ e, LEVEL.error);
		}
		return vendorMarketTrends;

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<OSVersion> getandroidversion(String marketid) {

		String query = "Select * from mobilelab.androidversiondetail where marketid="
				+ marketid +" and status='Y'";
		List<OSVersion> androidversionlist = null;
		try {
			androidversionlist = jdbcTemplate.query(query,
					new BeanPropertyRowMapper(OSVersion.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getandroidversion() :: "
					+ e, LEVEL.error);
		}
		return androidversionlist;

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<OSVersion> getiosversion(String marketid) {

		String query = "Select * from mobilelab.iosversiondetail where marketid="
				+ marketid +" and status='Y'";
		List<OSVersion> iosversionlist = null;
		try {
			iosversionlist = jdbcTemplate.query(query,
					new BeanPropertyRowMapper(OSVersion.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getiosversion() :: "
					+ e, LEVEL.error);
		}
		return iosversionlist;

	}

	@Override
	public Market getMarket(String marketid) {

		String query = "Select * from mobilelab.market where marketid="
				+ marketid;
		Market market = null;
		try {
			market = jdbcTemplate.queryForObject(query,
					new BeanPropertyRowMapper<Market>(Market.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getMarket() :: " + e,
					LEVEL.error);
		}
		return market;
	}

	@Override
	public boolean addMarketVendorData(VendorMarketTrend marketTrend) {
		
		int result = 0;
		String query = "INSERT INTO mobilelab.vendormarkettrends(marketid,vendorname,month,value,status,creationtime,createdby)VALUES(?,?,?,?,?,current_time,?)";
		Object[] params = new Object[] { marketTrend.getMarketid(),
				marketTrend.getVendorname(), marketTrend.getMonth(),
				marketTrend.getValue(), marketTrend.getStatus(), 1 };
		try {
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error addMarketVendorData Dao :: "
							+ e.getMessage(), LEVEL.error);
		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}
	
	@Override
	public boolean addandroidversiondetail(VendorMarketTrend marketTrend) {
		
		int result = 0;
		String query = "INSERT INTO mobilelab.androidversiondetail(marketid,versionname,month,value,status,creationtime,createdby)VALUES(?,?,?,?,?,current_time,?)";
		Object[] params = new Object[] { marketTrend.getMarketid(),
				marketTrend.getVendorname(), marketTrend.getMonth(),
				marketTrend.getValue(), marketTrend.getStatus(), 1 };
		try {
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error addOSversion detail Data Dao :: "
							+ e.getMessage(), LEVEL.error);
		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean addiosversiondetail(VendorMarketTrend marketTrend) {
		
		int result = 0;
		String query = "INSERT INTO mobilelab.iosversiondetail(marketid,versionname,month,value,status,creationtime,createdby)VALUES(?,?,?,?,?,current_time,?)";
		Object[] params = new Object[] { marketTrend.getMarketid(),
				marketTrend.getVendorname(), marketTrend.getMonth(),
				marketTrend.getValue(), marketTrend.getStatus(), 1 };
		try {
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error addOSversion detail Data Dao :: "
							+ e.getMessage(), LEVEL.error);
		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	
	@Override
	public boolean addMarketOSData(VendorMarketTrend marketTrend) {
		int result = 0;
		String query = "INSERT INTO mobilelab.osmarkettrends(marketid,os,month,value,status,creationtime,createdby)VALUES(?,?,?,?,?,current_time,?)";
		Object[] params = new Object[] { marketTrend.getMarketid(),
				marketTrend.getVendorname(), marketTrend.getMonth(),
				marketTrend.getValue(), marketTrend.getStatus(), 1 };
		try {
			result = jdbcTemplate.update(query, params);
		} catch (Exception e) {
			DigiLoggerUtils.log(
					"Error addMarketVendorData Dao :: "
							+ e.getMessage(), LEVEL.error);
		}

		if (result >= 1) {
			return true;
		} else {
			System.out.println("Error");
			return false;
		}

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<VendorMarketTrend> getOsMarketShare(String marketid) {

		String query = "Select osmarkettrendsid as oemdistributionid,marketid,os as vendorname,month,value,status,creationtime,createdby,modifiedby,modifiedtime from mobilelab.osmarkettrends where marketid="
				+ marketid+" and status='Y'";
		List<VendorMarketTrend> vendorMarketTrends = null;
		try {
			vendorMarketTrends = jdbcTemplate.query(query,
					new BeanPropertyRowMapper(VendorMarketTrend.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getOsMarketShare() :: "
					+ e, LEVEL.error);
		}
		return vendorMarketTrends;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<OsDistribution> getOsDistribution(String osid) {

		String query = "Select * FROM mobilelab.osdistributiondetails where osid="
				+ osid;
		List<OsDistribution> osDistributions = null;
		try {
			osDistributions = jdbcTemplate.query(query,
					new BeanPropertyRowMapper(OsDistribution.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getOsDistribution() :: "
					+ e, LEVEL.error);
		}
		return osDistributions;

	}

	@Override
	public OsDetails getOsDetails(String osName) {
		String query = "SELECT * FROM  mobilelab.osdetails WHERE osname='" + osName
				+ "' and status='Y'";
		OsDetails osDetails = null;
		try {
			osDetails = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(OsDetails.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getOsDetails() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getOsDetails() :: " + e, LEVEL.error);
		}
		return osDetails;

	}

	@Override
	public boolean updateMarketVendorData(String status, String marketId) {
		int result = 0;
		String query = "UPDATE mobilelab.vendormarkettrends SET status=? where marketid=?";
		try {
			Object[] params = new Object[] { status, marketId };
			result = jdbcTemplate.update(query, params);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error updateMarketVendorData( String status, String marketId) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}
	
	@Override
	public boolean updateAndroidVersionData(String status, String marketId) {
		int result = 0;
		String query = "UPDATE mobilelab.androidversiondetail SET status=? where marketid=?";
		try {
			Object[] params = new Object[] { status, marketId };
			result = jdbcTemplate.update(query, params);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error updateAndroidVersionData( String status, String marketId) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}
     
	@Override
	public boolean updateiOSVersionData(String status, String marketId) {
		int result = 0;
		String query = "UPDATE mobilelab.iosversiondetail SET status=? where marketid=?";
		try {
			Object[] params = new Object[] { status, marketId };
			result = jdbcTemplate.update(query, params);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error updateiOSVersionData( String status, String marketId) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean removeMarketVendorOldData(String market) {
		int result = 0;
		String query = "DELETE FROM mobilelab.vendormarkettrends WHERE status='N' AND marketid='"+market+"'";
		try {
			result = jdbcTemplate.update(query);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error removeMarketVendorOldData(String market) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}
	@Override
	public boolean removeAndroidVersionOldData(String market) {
		int result = 0;
		String query = "DELETE FROM mobilelab.androidversiondetail WHERE status='N' AND marketid='"+market+"'";
		try {
			result = jdbcTemplate.update(query);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error removeAndroidVersionOldData(String market) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}
	@Override
	public boolean removeiOSVersionOldData(String market) {
		int result = 0;
		String query = "DELETE FROM mobilelab.iosversiondetail WHERE status='N' AND marketid='"+market+"'";
		try {
			result = jdbcTemplate.update(query);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error removeiosversionOldData(String market) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean updateMarketOSStatus(String status, String marketid) {
		int result = 0;
		String query = "UPDATE mobilelab.osmarkettrends SET status=? where marketid=?";
		try {
			Object[] params = new Object[] { status, marketid };
			result = jdbcTemplate.update(query, params);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error updateMarketOSStatus( String status, String marketId) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean removeOSOldData(String market) {
		int result = 0;
		String query = "DELETE FROM mobilelab.osmarkettrends WHERE status='N' AND marketid='"+market+"'";
		try {
			result = jdbcTemplate.update(query);

		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error removeOSOldData(String market) Dao :: " + e.getMessage(),
					LEVEL.error);

		}

		if (result >= 1) {
			return true;
		} else {
			return false;
		}

	}

}
