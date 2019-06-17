package com.cg.digi.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;

import org.apache.http.HttpResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Chat;
import com.cg.digi.model.DeviceCatalog;
import com.cg.digi.model.Market;
import com.cg.digi.model.MobileLabCatalog;
import com.cg.digi.model.OsDetails;
import com.cg.digi.model.Project;
import com.cg.digi.model.Reservation;
import com.cg.digi.model.Run;
import com.cg.digi.model.User;
import com.cg.digi.service.DeviceCloudService;
import com.cg.digi.service.IAdminService;
import com.cg.digi.service.IDeviceSelectionMatrixService;
import com.cg.digi.service.IExecutionConsoleService;
import com.cg.digi.service.ILoginService;
import com.cg.digi.utilities.CalendarUtils;
import com.cg.digi.utilities.DeviceDetails;
import com.cg.digi.utilities.FileUtils;
import com.cg.digi.utilities.JenkinsUtilities;
import com.cg.digi.utilities.PCloudyAPI;
import com.cg.digi.utilities.PerfectoAPI1;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.ssts.pcloudy.dto.device.MobileDevice;
import com.ssts.pcloudy.dto.generic.BookingDtoResult;
import com.sun.speech.freetts.en.us.FeatureProcessors.SylOut;

@Scope("session")
@Controller
public class MobileLab {
	@Value("${macroFile}")
	String macroFile;
	@Value("${deviceDetailTemplate}")
	String deviceDetailTemplate;

	@Value("${deviceDetailsPath}")
	String deviceDetailsPath;

	@Value("${mobileLabPath}")
	String mobileLabPath;

	@Value("${basePath}")
	String basePath;

	@Value("${imtaFrameworkMaster}")
	String imtaFrameworkMaster;

	@Value("${continonusDeliveryHome}")
	String continonusDeliveryHome;

	@Value("${jenkinsURL}")
	String jenkinsURL;

	@Value("${jenkinsUserName}")
	String jenkinsUserName;

	@Value("${jenkinsPassword}")
	String jenkinsPassword;

	@Autowired
	ILoginService loginService;
	@Autowired
	IAdminService adminService;
	@Autowired
	DeviceCloudService deviceCloudService;
	@Autowired
	IDeviceSelectionMatrixService matrixService;
	@Autowired
	IExecutionConsoleService executionConsoleService;

	HttpSession sessionpcloudy = null;

	/*************************************************
	 * chatbot
	 **************************************************/
	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/Chatbotinput")
	public void getInputfrombot(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String inputmsg = request.getParameter("input");
		System.out.println("input data is: " + inputmsg);
		String userid = (String) session.getAttribute("userid");
		String sessionid = session.toString();
		System.out.println("userid inside save input : " + userid + "session id is: " + sessionid);
		loginService.saveuserinput(inputmsg, userid, sessionid);

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/Chatbotoutput")
	public void getOutputfrombot(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {

		String outputmsg = request.getParameter("output");
		System.out.println("output data is: " + outputmsg);
		String userid = (String) session.getAttribute("userid");
		String sessionid = session.toString();
		System.out.println("userid inside save output : " + userid);
		loginService.savebotoutput(outputmsg, userid, sessionid);
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/chathistory")
	public String getchatfromdb(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {

		String userid = (String) session.getAttribute("userid");
		String sessionid = session.toString();
		System.out.println("userid inside getsender chat : " + userid);

		ArrayList<Chat> userinput = loginService.getuserchat(userid, sessionid);// done
		System.out.println("entering bot chat fetching dao");
		ArrayList<Chat> botoutput = loginService.getbotchat(userid, sessionid);
		System.out.println("Collected bot chat adding into allchat list"); // successful
		ArrayList<Chat> allchat = new ArrayList<Chat>();

		allchat.addAll(userinput);
		// System.out.println("All chat(1): "+ allchat+ "size "+allchat.size());

		allchat.addAll(botoutput);
		response.setContentType("application/json");
		// System.out.println("All chat(2): "+ allchat +"size "+allchat.size());

		JSONArray jsonArr = new JSONArray();
		JSONArray sortedJsonArray = new JSONArray();
		for (Chat chat : allchat) {
			JSONObject obj = new JSONObject();
			obj.put("creation time", chat.getStarttime());
			obj.put("message", chat.getMessage());
			obj.put("sender", chat.getSender());
			obj.put("sessionid", chat.getSessionid());
			jsonArr.add(obj);
		}
		List<JSONObject> jsonValues = new ArrayList<JSONObject>();
		for (int i = 0; i < jsonArr.size(); i++) {
			jsonValues.add((JSONObject) jsonArr.get(i));
		}
		Collections.sort(jsonValues, new Comparator<JSONObject>() {

			private static final String KEY_NAME = "creation time";

			@Override
			public int compare(JSONObject a, JSONObject b) {
				String valA = new String();
				String valB = new String();

				valA = (String) a.get(KEY_NAME);
				valB = (String) b.get(KEY_NAME);

				return valA.compareTo(valB);

			}
		});

		for (int i = 0; i < jsonArr.size(); i++) {

			sortedJsonArray.add(jsonValues.get(i));
		}
		System.out.println("json chat: " + sortedJsonArray.toString());
		request.setAttribute("history", sortedJsonArray);
		RequestDispatcher rd = request.getRequestDispatcher("demobot.jsp");
		rd.forward(request, response);
		return "demobot";
	}

	/************************************************
	 * chatbot ends
	 ***********************************************/

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/confirmmail")
	public void confirmMail(Model model, @ModelAttribute("User") User userDetails, @RequestParam("id") String id1,
			HttpSession session) throws IOException, MalformedURLException {
		try {
			String id = (String) session.getAttribute("userid");
			int idd = Integer.parseInt(id);
			User user = adminService.getUser(idd);
			String emailid = user.getUserName();
			String status = "Y";
			boolean reserve = deviceCloudService.addMail(id1, emailid, status);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/recommendDevice")
	public String recommendDevice(@RequestParam("market") String market, @RequestParam("count") String count,
			Model model) {
		System.out.println("entering update device catalog");
		System.out.println("recommend device market: " + market);
		matrixService.updateDeviceCatalog(); // step 1 showing devices 11_jan(0)
		System.out.println("inside recommend device");
		List<DeviceCatalog> resultingDevice = matrixService.getRecommendedDevices(market, count);// 14_jan(0)
		model.addAttribute("marketNames", matrixService.getMarkets());
		System.out.println("market: " + matrixService.getMarkets());
		String vendorname = null;
		for (DeviceCatalog vendor : resultingDevice) {
			vendorname = vendor.getVendor().toString();
		}
		model.addAttribute("vendorname", vendorname);
		model.addAttribute("deviceList", resultingDevice);
		model.addAttribute("market", market);
		System.out.println("Mobile Lab Resulting devices" + resultingDevice); // successful
		System.out.println("showing recommend device");
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/recommendDevice";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/reserveDevice")
	@ResponseBody
	public String reserveDevice(Model model, @RequestParam("deviceid") String deviceid,
			@RequestParam("vendorDeviceid") String vendorDeviceid, @RequestParam("vendor") String vendor,
			@RequestParam("time") String time, HttpServletRequest request, HttpServletResponse response) {
		Reservation reserve = null;
		System.out.println("inside reservedevice");
		try {
			// see test devices are removed, so see test methods are not being used
			if (vendor.equalsIgnoreCase("seetest")) {
				Date date = new Date();
				reserve = DeviceDetails.reserveSeetestDevice(vendorDeviceid, date, Integer.parseInt(time));
				reserve.setDevicecatalogid(deviceid);
				matrixService.addReservationDetails(reserve);
			}
//pcloudy
			if (vendor.equalsIgnoreCase("pcloudy")) {
				System.out.println("Time: " + time);
				System.out.println("Device id (Mobile Lab) recommend device: " + deviceid);// successful
				System.out.println("Vendor Device id (Mobile Lab) recommend device: " + vendorDeviceid); // successful
				SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd-HH-mm-ss");

				Date dateobj = new Date();
				// final long hour = 3600 * 1000;
				int timeInt = Integer.parseInt(time);
				System.out.println("time in Int: " + timeInt);
				int timemin = timeInt * 60;

				Calendar now = Calendar.getInstance();
				now.add(Calendar.MINUTE, timemin);
				Date endDate = now.getTime();

				System.out.println("Date Format: " + df.format(dateobj.getTime()));
				System.out.println("Booking Duration: " + timemin);
				System.out.println("Starttime: " + df.format(dateobj));// successful
				System.out.println("Endtime: " + df.format(endDate));
				System.out.println("entering reservedevice ->pcloudyAPI"); // successful

				BookingDtoResult reservid = new PCloudyAPI().reserveDevice(vendorDeviceid, timemin);
				System.out.println("reserve device reserve id obtained: " + reservid);
				String reservationid = reservid.toString();

				sessionpcloudy = request.getSession();
				sessionpcloudy.setAttribute("reservationid", reservid);

				reserve = new Reservation();
				reserve.setDevicecatalogid(deviceid);
				reserve.setReservationsessionid(reservationid);
				reserve.setStarttime(df.format(dateobj).toString());
				reserve.setEndtime(df.format(endDate).toString());
				matrixService.addReservationDetails(reserve);// 14_jan(5)

			}
//pcloudy ends			
			if (vendor.equalsIgnoreCase("Perfecto Partner")) {
				SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd-HH-mm-ss");

				Date dateobj = new Date();
				final long hour = 3600 * 1000;
				int timeInt = Integer.parseInt(time);
				Date newDate = new Date(dateobj.getTime() + timeInt * hour);
				String reservationid = new PerfectoAPI1().reserveDevice(vendorDeviceid);
				reserve = new Reservation();
				reserve.setDevicecatalogid(deviceid);
				reserve.setReservationsessionid(reservationid);
				reserve.setStarttime(df.format(dateobj).toString());
				reserve.setEndtime(df.format(newDate).toString());
				matrixService.addReservationDetails(reserve);

			}
			DigiLoggerUtils.log("SeeTest Devices:" + reserve, LEVEL.info);

		} catch (IOException e) {
			e.printStackTrace();
			DigiLoggerUtils.log("Error while getting SeeTest Cloud devices SeeTest Devices", LEVEL.warn);
		}
		return reserve.getEndtime();

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/releaseDevice")
	@ResponseBody
	public String releaseDevice(Model model, @RequestParam("deviceid") String deviceid,
			@RequestParam("vendorDeviceid") String vendorDeviceid, @RequestParam("vendor") String vendor,
			HttpServletRequest request, HttpServletResponse response) {
		String device = null;
		try {
			if (vendor.equalsIgnoreCase("seetest")) {
				device = DeviceDetails.releaseSeetestDevice(vendorDeviceid);
				matrixService.updateReservationDetails(deviceid);
			}

			if (vendor.equalsIgnoreCase("Perfecto Partner")) {
				new PerfectoAPI1().releaseDevice(matrixService.getPerfectoReserveId(deviceid));
				matrixService.updateReservationDetails(deviceid);
			}

			if (vendor.equalsIgnoreCase("pCloudy")) {
				System.out.println("Inside pcloudy release device");
				System.out.println("Device id: " + deviceid);

				BookingDtoResult reservationid = (BookingDtoResult) sessionpcloudy.getAttribute("reservationid");

				System.out.println("Inside Release device method reserbation ID" + reservationid); // successful
				System.out.println("Entering pcloudy release device");
				new PCloudyAPI().releaseDevice(reservationid);
				matrixService.updateReservationDetails(deviceid);
			}

			else {
			}
			DigiLoggerUtils.log("SeeTest Devices:" + device, LEVEL.info);

		} catch (IOException e) {
			e.printStackTrace();
			DigiLoggerUtils.log("Error while getting SeeTest Cloud devices SeeTest Devices", LEVEL.warn);
		}
		return device;

	}

// donee
	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/getDeviceStatus", produces = MediaType.APPLICATION_JSON)
	@ResponseBody
	public String getDeviceStatus(Model model) {
		matrixService.updateDeviceCatalog();
		List<DeviceCatalog> devices = matrixService.getDevices();
		Gson gson = new Gson();
		String jsonTask = gson.toJson(devices);
		return jsonTask;

	}

//start from here
	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/searchNBook")
	public String searchNBook(Model model, @RequestParam("device") String deviceId,
			@RequestParam("startDate") String startDate, @RequestParam("startTime") String startTime,
			@RequestParam("endDate") String endDate, @RequestParam("endTime") String endTime, HttpSession session,
			HttpServletRequest request) {
		int minutes = 0;
		String searchDate = startDate;
		startDate = startDate + " " + startTime + ":59";
		endDate = endDate + " " + endTime + ":59";

		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		Date datestart;
		try {
			datestart = format.parse(startTime + ":59");
			Date dateend = format.parse(endTime + ":59");

			System.out.println(datestart.getTime());
			System.out.println(dateend.getTime());

			long difference = (dateend.getTime() - datestart.getTime());
			System.out.println("difference: " + difference);
			minutes = (int) TimeUnit.MILLISECONDS.toMinutes(difference);

		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		System.out.println("minutes: " + minutes);

		// System.out.println("Diff b/w time: "+difference);

		Timestamp startDateTime = Timestamp.valueOf(startDate); // not used for pcloudy
		Timestamp endDateTime = Timestamp.valueOf(endDate); // not used for pcloudy

		/*
		 * Timestamp endDateTime = new Timestamp(startDateTime.getTime() + (1000 * 60 *
		 * 60 * 3));
		 */
		ArrayList<String> deviceids = new ArrayList<String>();
		deviceids.add(deviceId);
		System.out.println("device ID: " + deviceids);
		String userid = (String) session.getAttribute("userid");
		// check for device reservation by user. User cannot book a device more
		// than 3 hours per day
		DeviceCatalog device = matrixService.getDeviceDetails(deviceId);
		System.out.println("session: " + session);
		System.out.println("after get device details"); // sucessful
		System.out.println("UserId: " + userid); // successful
		User user = loginService.getuserDetails(Integer.parseInt(userid));
		System.out.println("after get user details");
		List<Reservation> deviceReservation = matrixService.getReservations(userid, deviceId, searchDate);
		System.out.println("After get reservation1");
		String msg = "";
		if (deviceReservation.size() == 0) {
			System.out.println("inside if 1");
			// check for device availability for given date and time
			deviceReservation = matrixService.getReservations(deviceids, startDateTime.toString(), endDate.toString());
			System.out.println("After get reservation2");
			if (deviceReservation.size() == 0) {
				System.out.println("inside if 2");
				Reservation reservation = null;

				if (device.getVendor().equalsIgnoreCase("Seetest")) {

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					// use SimpleDateFormat to define how to PARSE the INPUT
					try {
						Date sdfStartDate = sdf.parse(startDate);
						Date sdfEndDate = sdf.parse(endDate);

						/*
						 * reservation =
						 * DeviceDetails.reserveSeetest(user.getUserName(),user.getUserPassword(),
						 * device.getVendordeviceid(), sdfStartDate, sdfEndDate);
						 */
						reservation = DeviceDetails.reserveSeetest(user.getUserName(), user.getUserPassword(),
								device.getVendordeviceid(), sdfStartDate, sdfEndDate);

						reservation.setApprovalStatus("Approved");
					} catch (java.text.ParseException e) {
						/*
						 * message= "Reservation Unsuccessfull. Please Contact Admin." ;
						 */
						DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
					} catch (MalformedURLException e) {
						/*
						 * message= "Reservation Unsuccessfull. Please Contact Admin." ;
						 */
						DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
					} catch (IOException e) {
						/*
						 * message= "Reservation Unsuccessfull. Please Contact Admin." ;
						 * 
						 */
						// msg=e.getMessage();
						DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
					} catch (Exception e) {
						if (e.getMessage().contains("PRECONDITION_FAILED")) {
							msg = "Maximum allowed duration is 3 Hours";
						}

						DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
					}

				} else if (device.getVendor().equalsIgnoreCase("Perfecto Partner")) {

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					String reservationid = new PerfectoAPI1().reserveDevice(device.getVendordeviceid(),
							startDateTime.getTime(), endDateTime.getTime());
					reservation = new Reservation();
					reservation.setDevicecatalogid(deviceId);
					reservation.setReservationsessionid(reservationid);
					reservation.setStarttime(startDate);
					reservation.setEndtime(endDate.toString());
					reservation.setCreatedby(userid);
					reservation.setApprovalStatus("Approved");
					matrixService.addReservationDetails(reservation);

				}

				else if (device.getVendor().equalsIgnoreCase("pCloudy")) {
					System.out.println("inside pcloudy partner (Mobile lab)");

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					/*
					 * String reservationid = new
					 * PCloudyAPI().reserveDevice(device.getVendordeviceid(),
					 * startDateTime.getTime(), endDateTime.getTime()); //comment this tomorrow
					 */ BookingDtoResult reservid = new PCloudyAPI().reserveDevice(device.getVendordeviceid(), minutes); // tomorrow
																															// uncomment
																															// this
					String reservationid = reservid.toString();
					sessionpcloudy = request.getSession();
					sessionpcloudy.setAttribute("reservationid", reservid);
					reservation = new Reservation();
					reservation.setDevicecatalogid(deviceId);
					reservation.setReservationsessionid(reservationid);
					reservation.setStarttime(startDate);
					reservation.setEndtime(endDate.toString());
					reservation.setCreatedby(userid);
					reservation.setApprovalStatus("Approved");
					matrixService.addReservationDetails(reservation);
				} else {
					reservation = new Reservation();
					reservation.setStarttime(startDate);
					reservation.setEndtime(endDate.toString());
					reservation.setApprovalStatus("Requested");
				}

				boolean result = false;
				if (reservation != null) {
					reservation.setCreatedby(userid);
					reservation.setDevicecatalogid(deviceId);
					System.out.println("Booking:" + reservation);
					result = matrixService.bookDevice(reservation);
				}
				if (result) {
					if (device.getVendor().equalsIgnoreCase("Lab")) {
						model.addAttribute("reservationSuccess",
								device.getDevicename() + " reservation request sent to admin..!");
					} else {
						model.addAttribute("reservationSuccess", device.getDevicename() + " Reserved Sucessfully..!");
					}
				} else {
					model.addAttribute("reservationFailure", device.getDevicename() + " Reservation Failed..!" + msg);
				}
			} else {
				model.addAttribute("reservationFailure", device.getDevicename() + " Device Unavailable..!");
			}
		} else {
			model.addAttribute("reservationFailure",
					device.getDevicename() + ": booking already exists for the day..! ");
		}
		List<DeviceCatalog> devices = matrixService.getDevices();
		// matrixService.getDevices("Lab");
		Gson gson = new Gson();
		String deviceList = gson.toJson(devices);

		JsonParser parser = new JsonParser();
		model.addAttribute("devices", parser.parse(deviceList));
		List<String> vendorList = matrixService.getVendors();
		model.addAttribute("vendors", vendorList);
		
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/searchBook";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/searchNBookPage")
	public String searchNBook2(Model model, @RequestParam("vendor") String vendorname,
			@RequestParam("dname") String devicename) {
		System.out.println("inside search N book page");
		System.out.println("vendorname, device name: " + vendorname + " " + devicename);
		List<String> vendorList = matrixService.getVendors();

		List<DeviceCatalog> devices = matrixService.getDevices();
		Gson gson = new Gson();
		String deviceList = gson.toJson(devices);
		JsonParser parser = new JsonParser();
		model.addAttribute("devices", parser.parse(deviceList));
		model.addAttribute("vendors", vendorList);
		model.addAttribute("vendorname", vendorname);
		model.addAttribute("devicename", devicename);
		model.addAttribute("marketNames", matrixService.getMarkets());
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/searchBook";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/searchSlots")
	public String searchSlots(Model model, @RequestParam("devicecatalogid") String devicecatalogid,
			@RequestParam("date") String date) {
		List<String> vendorList = matrixService.getVendors();
		List<DeviceCatalog> devices = matrixService.getDevices();
		DeviceCatalog device = matrixService.getDeviceDetails(devicecatalogid);
		Gson gson = new Gson();
		String deviceList = gson.toJson(devices);
		JsonParser parser = new JsonParser();
		model.addAttribute("devices", parser.parse(deviceList));
		model.addAttribute("vendors", vendorList);
		model.addAttribute("deviceid", devicecatalogid);
		model.addAttribute("date", date);
		model.addAttribute("vendor", device.getVendor());

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/searchBook";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/availabilityDetails")
	public String availabilityDetails(Model model) {
		List<DeviceCatalog> devices = matrixService.getDevices();
		model.addAttribute("devices", devices);
		LocalDate startDate = LocalDate.now();
		List<Reservation> reservation = matrixService.getAllReservationsDetails(startDate.toString(),
				startDate.plusDays(30).toString());

		// additional
		List<Reservation> reservationStatus = matrixService.updateDeviceStatus(reservation, startDate,
				startDate.plusDays(30));

		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		model.addAttribute("allReservationData", parser.parse(gson.toJson(reservation)));
		model.addAttribute("dates",
				CalendarUtils.getDatesBetween(LocalDate.now().toString(), LocalDate.now().plusDays(30).toString()));

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/availability";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/nextAvailability")
	public String nextAvailability(Model model, @RequestParam("currentDate") String currentDate,
			@RequestParam("pointer") String pointer) {
		List<DeviceCatalog> devices = matrixService.getDevices("Lab");
		model.addAttribute("devices", devices);
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE;
		LocalDate startDate = LocalDate.parse(currentDate, formatter);
		if (pointer.equalsIgnoreCase("next")) {
			model.addAttribute("allReservationData",
					matrixService.getAllReservationsDetails(startDate.toString(), startDate.plusDays(12).toString()));
			model.addAttribute("dates",
					CalendarUtils.getDatesBetween(startDate.toString(), startDate.plusDays(12).toString()));
		} else {
			model.addAttribute("allReservationData",
					matrixService.getAllReservationsDetails(startDate.minusDays(12).toString(), startDate.toString()));
			model.addAttribute("dates",
					CalendarUtils.getDatesBetween(startDate.minusDays(12).toString(), startDate.toString()));
		}

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/availability";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/bookDevice")
	@ResponseBody
	public String bookDevice(Model model, @RequestParam("deviceid") String deviceCatalogId,
			@RequestParam("startDate") String startDate, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		Reservation reservation = null;
		String message = "";

		DeviceCatalog device = matrixService.getDeviceDetails(deviceCatalogId);
		System.out.println(device.getVendor());
		if (device.getVendor().equalsIgnoreCase("Seetest")) {

			/*
			 * DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_TIME; LocalDate
			 * sDate = LocalDate.parse(startDate, formatter);
			 */

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");

			// use SimpleDateFormat to define how to PARSE the INPUT
			Date date = null;
			try {
				date = sdf.parse(startDate + "-00-00-01");

				reservation = DeviceDetails.reserveSeetestDevice(device.getVendordeviceid(), date, 24);
				reservation.setApprovalStatus("Approved");
			} catch (java.text.ParseException e) {
				message = "Reservation Unsuccessfull. Please Contact Admin.";
				DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
			} catch (MalformedURLException e) {
				message = "Reservation Unsuccessfull. Please Contact Admin.";
				DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
			} catch (IOException e) {
				message = "Reservation Unsuccessfull. Please Contact Admin.";
				DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
			} catch (Exception e) {
				DigiLoggerUtils.log(e, LEVEL.error, this.getClass());
			}

		} else if (device.getVendor().equalsIgnoreCase("Perfecto Partner")) {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");

			final long hour = 3600 * 1000;
			Date startDateTime = null;
			try {
				startDateTime = sdf.parse(startDate + "-00-00-01");
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Calendar cal = Calendar.getInstance();
			cal.setTime(startDateTime);
			cal.add(Calendar.HOUR_OF_DAY, 3);
			Date endDateTime = cal.getTime();
			/* Date newDate = new Date(dateobj.getTime() + timeInt * hour); */
			System.out.println(endDateTime);
			String reservationid = new PerfectoAPI1().reserveDevice(device.getVendordeviceid(), startDateTime.getTime(),
					endDateTime.getTime());
			System.out.println(reservationid);
			reservation = new Reservation();
			reservation.setDevicecatalogid(deviceCatalogId);
			reservation.setReservationsessionid(reservationid);
			reservation.setStarttime(startDateTime.toString());
			reservation.setEndtime(endDateTime.toString());
			// matrixService.addReservationDetails(reserve);

		} else if (device.getVendor().equalsIgnoreCase("pCloudy")) { // do this tomorrow

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");

			/*
			 * System.out.println("Time: "+ time);
			 * System.out.println("Device id (Mobile Lab) recommend device: "+
			 * deviceid);//successful
			 * System.out.println("Vendor Device id (Mobile Lab) recommend device: "+
			 * vendorDeviceid); //successful SimpleDateFormat df = new
			 * SimpleDateFormat("YYYY-MM-dd-HH-mm-ss");
			 * 
			 * Date dateobj = new Date(); //final long hour = 3600 * 1000; int timeInt =
			 * Integer.parseInt(time); System.out.println("time in Int: "+ timeInt); int
			 * timemin = timeInt* 60;
			 * 
			 * Calendar now = Calendar.getInstance(); now.add(Calendar.MINUTE, timemin);
			 * Date endDate = now.getTime();
			 * 
			 * 
			 * 
			 * 
			 * System.out.println("Date Format: "+df.format(dateobj.getTime()) );
			 * System.out.println("Booking Duration: "+timemin);
			 * System.out.println("Starttime: "+ df.format(dateobj));//successful
			 * System.out.println("Endtime: "+df.format(endDate));
			 * System.out.println("entering reservedevice ->pcloudyAPI"); //successful
			 * 
			 * BookingDtoResult reservid = new PCloudyAPI().reserveDevice(vendorDeviceid,
			 * timemin); System.out.println("reserve device reserve id obtained: "+reservid
			 * ); String reservationid= reservid.toString();
			 * 
			 * sessionpcloudy=request.getSession();
			 * sessionpcloudy.setAttribute("reservationid", reservid);
			 * 
			 * reserve = new Reservation(); reserve.setDevicecatalogid(deviceid);
			 * reserve.setReservationsessionid(reservationid);
			 * reserve.setStarttime(df.format(dateobj).toString());
			 * reserve.setEndtime(df.format(endDate).toString());
			 * matrixService.addReservationDetails(reserve);// 14_jan(5)
			 */
			final long hour = 3600 * 1000;
			Date startDateTime = null;
			try {
				startDateTime = sdf.parse(startDate + "-00-00-01");
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Calendar cal = Calendar.getInstance();
			cal.setTime(startDateTime);
			cal.add(Calendar.HOUR_OF_DAY, 3);
			Date endDateTime = cal.getTime();
			/* Date newDate = new Date(dateobj.getTime() + timeInt * hour); */
			System.out.println(endDateTime);
			String reservationid = new PCloudyAPI().reserveDevice(device.getVendordeviceid(), startDateTime.getTime(),
					endDateTime.getTime());
			System.out.println(reservationid);
			reservation = new Reservation();
			reservation.setDevicecatalogid(deviceCatalogId);
			reservation.setReservationsessionid(reservationid);
			reservation.setStarttime(startDateTime.toString());
			reservation.setEndtime(endDateTime.toString());
			// matrixService.addReservationDetails(reserve);
		} else {
			reservation = new Reservation();
			reservation.setStarttime(startDate);
			reservation.setEndtime(startDate);
			reservation.setApprovalStatus("Requested");
		}

		boolean result = false;
		if (reservation != null) {
			reservation.setCreatedby(userid);
			reservation.setDevicecatalogid(deviceCatalogId);
			result = matrixService.bookDevice(reservation);
		}

		if (result) {
			return "Reserved Successfully";
		} else {
			return "Reservation Unsuccessfull";
		}

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/adminShowDeviceRequests")
	public String adminShowDeviceRequests(Model model) {
		List<MobileLabCatalog> requests = matrixService.getdeviceRequests();
		model.addAttribute("deviceRequests", requests);
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/adminApproval";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/requestApproval")
	@ResponseBody
	public String requestApproval(Model model, @RequestParam("status") String status,
			@RequestParam("reservationid") String reservationid, @RequestParam("comment") String comment,
			@RequestParam("vendor") String vendor, HttpSession session) {
		if (vendor.equalsIgnoreCase("Seetest")
				&& status.equalsIgnoreCase("Approved")) {/*
															 * 
															 * matrixService. getDeviceDetails (devicecatalogid); device
															 * = DeviceDetails .releaseSeetestDevice (vendorDeviceid);
															 * matrixService .updateReservationDetails (deviceid);
															 */
		}
		boolean result = matrixService.updateDeviceReservations(reservationid, status, comment);
		if (result) {
			return "Device " + status + " Successfully..!";
		} else {
			return "Device " + status + " Failed..!";
		}

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/showRequestDetails")
	public String showRequestDetails(Model model) {
		List<MobileLabCatalog> requests = matrixService.getdeviceRequests();
		model.addAttribute("deviceRequests", requests);
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/adminApproval";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/addDeviceDeatils")
	public String addDeviceDeatils(Model model) {
		List<Project> projects = loginService.getProjects();
		DeviceCatalog device = new DeviceCatalog();
		model.addAttribute("device", device);
		model.addAttribute("projects", projects);
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addDeviceDeatils";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/addDevice")
	public String addDevice(@ModelAttribute("device") DeviceCatalog device, Model model) {
		device.setAvailability("Available");
		if (device.getDevicecatalogid() != null) {
			device.setVendor("Lab");
			boolean result = matrixService.updateDeviceCatalog(device);
			if (result) {
				List<DeviceCatalog> devices = matrixService.getDevices();
				Gson gson = new Gson();

				JsonParser parser = new JsonParser();
				JsonArray deviceList = (JsonArray) parser.parse(gson.toJson(devices));
				model.addAttribute("devices", deviceList);

				model.addAttribute("vendors", matrixService.getVendors());
				model.addAttribute("message", "Device details modified Successfully..!");
				return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";

			} else {
				model.addAttribute("device", device);
				model.addAttribute("message", "Failed to modify device details..!");
			}
		} else {
			boolean result = matrixService.addDeviceDetails(device, "Lab");
			if (result) {
				List<DeviceCatalog> devices = matrixService.getDevices();
				Gson gson = new Gson();

				JsonParser parser = new JsonParser();
				JsonArray deviceList = (JsonArray) parser.parse(gson.toJson(devices));
				model.addAttribute("devices", deviceList);

				model.addAttribute("vendors", matrixService.getVendors());
				model.addAttribute("message", "Device Added Successfully..!");
				return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";
			} else {
				model.addAttribute("device", device);
				model.addAttribute("message", "Failed to add Device..!");
			}

		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addDeviceDeatils";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/showLabDetails")
	public String showLabDetails(Model model) {

		List<DeviceCatalog> devices = matrixService.getDevices();
		Gson gson = new Gson();

		JsonParser parser = new JsonParser();
		JsonArray deviceList = (JsonArray) parser.parse(gson.toJson(devices));
		model.addAttribute("devices", deviceList);

		model.addAttribute("vendors", matrixService.getVendors());
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/showLabDevices")
	public String showLabDevices(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {
		DigiLoggerUtils.log("Form Details :: User Name :: " + username + " :: Password ::" + password + "", LEVEL.info,
				DigiAssure.class);

		User user = loginService.loginValidation(username, password);

		// Checking user name and password initially before DB validation
		if (username == "" || password == "") {
			model.addAttribute("error", "UserName and Password is Mandatory");
			return "login";
		}

		// Post DB validation; user name and password
		if (user == null) {
			// TexttoSpeech.dospeak("Hello User !! Invalid Credentials", "kevin16");
			model.addAttribute("error", "Invalid Login Credentials");
			return "login";
		} else {
			session.setAttribute("userName", user.getFirstName() + "  " + user.getLastName());
			session.setAttribute("userNameNoSpace", user.getFirstName() + "_" + user.getLastName());
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("projectid", user.getProjectid());
			session.setAttribute("rolename", user.getRolename());
			System.out.println("Rolename " + user.getRolename());

		}
		model.addAttribute("username", username);

		List<DeviceCatalog> devices = matrixService.getDevices();
		Gson gson = new Gson();

		JsonParser parser = new JsonParser();
		JsonArray deviceList = (JsonArray) parser.parse(gson.toJson(devices));
		model.addAttribute("devices", deviceList);

		model.addAttribute("vendors", matrixService.getVendors());
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/editLabDevice")
	public String editLabDevice(Model model, @RequestParam("devicecatalogid") String devicecatalogid) {
		DeviceCatalog device = matrixService.getDeviceDetails(devicecatalogid);
		model.addAttribute("device", device);
		List<Project> projects = loginService.getProjects();
		model.addAttribute("projects", projects);

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addDeviceDeatils";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/deleteLabDevice")
	public String deleteLabDevice(Model model, @RequestParam("devicecatalogid") String devicecatalogid) {
		boolean result = matrixService.deleteDevice(devicecatalogid);
		if (result) {
			model.addAttribute("message", "Device deleted Successfully..!");
		} else {
			model.addAttribute("message", "Failed to delete the device..!");
		}
		List<DeviceCatalog> devices = matrixService.getDevices("Lab");
		model.addAttribute("devices", devices);
		model.addAttribute("vendor", "Lab");
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/getUsers")
	public String getUsers(Model model) {
		List<User> users = loginService.getUsers();
		model.addAttribute("device", users);
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addDeviceDeatils";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/allRequests")
	public String allRequests(Model model, HttpSession session) {
		String role = (String) session.getAttribute("rolename");
		if (role.equalsIgnoreCase("admin")) {
			List<MobileLabCatalog> allRequests = matrixService.getAllRequests();
			Collections.sort(allRequests);
			model.addAttribute("allRequests", allRequests);

		} else if (role.equalsIgnoreCase("user")) {
			String userid = (String) session.getAttribute("userid");
			List<MobileLabCatalog> allUserRequests = matrixService.getAllRequests(userid);
			Collections.sort(allUserRequests);
			model.addAttribute("allRequests", allUserRequests);
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/allRequests";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/requestedBookings")
	public String requestedBookings(Model model, HttpSession session) {
		String role = (String) session.getAttribute("rolename");
		if (role.equalsIgnoreCase("admin")) {
			List<MobileLabCatalog> requestedBookings = matrixService.getAllRequestedBookings();
			Collections.sort(requestedBookings);
			model.addAttribute("requestedBookings", requestedBookings);

		} else if (role.equalsIgnoreCase("user")) {
			String userid = (String) session.getAttribute("userid");

			List<MobileLabCatalog> userRequestedBookings = matrixService.getUserRequestedBookings(userid);
			Collections.sort(userRequestedBookings);
			model.addAttribute("requestedBookings", userRequestedBookings);
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/requestedBookings";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser")
	public String viewUser(HttpServletRequest request, Model model, HttpSession session) {
		List<User> users = loginService.getUsers();
		model.addAttribute("users", users);
		if (request.getParameter("message") != null) {
			model.addAttribute("message", request.getParameter("message"));
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddUser")
	public String beforeAddUser(HttpServletRequest request, Model model, HttpSession session) {

		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("projects", loginService.getProjects());
		if (request.getParameter("message") != null) {
			model.addAttribute("message", request.getParameter("message"));
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addUser";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/addUser")
	public String addUser(Model model, HttpSession session, @ModelAttribute("user") User user) {

		if (user.getUserid() != null) {
			boolean result = loginService.editUser(user);
			if (result) {
				List<User> users = loginService.getUsers();
				model.addAttribute("users", users);
				model.addAttribute("message", "User details modified Successfully..!");
				return "integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";

			} else {
				model.addAttribute("user", user);
				model.addAttribute("message", "Failed to modify user details..!");
			}
		}

		else {
			if (loginService.checkUserName(user.getUserName())) {
				model.addAttribute("message", "User already exists...");
				return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddUser";
			} else {
				boolean result = matrixService.addUser(user);
				if (result == true) {

					model.addAttribute("message", "User added successfully...");
					return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";
				} else {
					model.addAttribute("message", "user addition Failed");

					return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddUser";
				}
			}
		}
		return "/integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/deleteUser")
	public String deleteUser(@RequestParam("userid") String userId, Model model) {
		if (loginService.deleteUser(userId)) {
			model.addAttribute("message", "User deleted successfully..!");
		} else {
			model.addAttribute("message", "User not deleted successfully..!");

		}
		List<User> users = loginService.getUsers();
		model.addAttribute("users", users);
		return "/integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";

	}

	/*
	 * @RequestMapping(value =
	 * "integratedQALabs/mobileLab/deviceSelectionMatrix/beforeEditUser") public
	 * String beforeEditUser(HttpServletRequest request,
	 * 
	 * @RequestParam("userName")String userName,Model model){
	 * model.addAttribute("projects",loginService.getProjects()); User user=new
	 * User(); model.addAttribute("user",user);
	 * if(request.getParameter("messageEdit")!=null){
	 * model.addAttribute("messageEdit",request.getParameter("messageEdit")); }
	 * return "integratedQALabs/mobileLab/deviceSelectionMatrix/editUser";
	 * 
	 * }
	 */

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/editUser")
	public String editUser(Model model, @RequestParam("userid") String userid) {
		try {
			User user = loginService.getuserDetails(Integer.parseInt(userid.trim()));
			model.addAttribute("user", user);
			List<Project> projects = loginService.getProjects();
			model.addAttribute("projects", projects);
		} catch (Exception e) {
			List<User> users = loginService.getUsers();
			model.addAttribute("users", users);
			model.addAttribute("message", "Problem in editing the user details...");

			return "integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";
		}

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addUser";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/editUserDetails")
	public String editUser(Model model, @ModelAttribute("user") User user,
			@RequestParam("project") String projectName) {
		// user.setProjectName(projectName);
		if (loginService.editUser(user)) {
			model.addAttribute("messageEdit", "User edited successfully");
			return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/viewUser";
		}
		{
			model.addAttribute("messageEdit", "User edit failed");
			return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeEditUser";
		}
	}

	// ///////////////////////PROJECTS////////////////////////////////

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddProject")
	public String beforeAddProject(HttpServletRequest request, Model model, HttpSession session) {

		Project project = new Project();
		model.addAttribute("project", project);
		model.addAttribute("accounts", matrixService.getAccounts());
		if (request.getParameter("messageError") != null) {
			model.addAttribute("messageError", request.getParameter("messageError"));
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/addProject";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/addProject")
	public String addProject(Model model, HttpSession session, @ModelAttribute("project") Project project,
			@RequestParam("startDate") String startDate, @RequestParam("account") String accountName,
			@RequestParam("endDate") String endDate) {
		project.setStartDate(startDate);
		project.setEndDate(endDate);
		project.setAccountname(accountName);
		if (matrixService.checkProject(project.getProjectName()) == true) {
			model.addAttribute("messageError", "Project already present");
			return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddProject";
		} else {
			boolean result = matrixService.addProject(project);
			if (result == true) {

				model.addAttribute("messageSuccess", "Project addition successful");
				return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/viewProjects";
			} else {
				model.addAttribute("messageError", "Project addition Failed");

				return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeAddProject";
			}
		}
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/viewProjects")
	public String viewProjects(HttpServletRequest request, Model model, HttpSession session) {
		List<Project> projects = matrixService.viewProjects();
		model.addAttribute("projects", projects);
		if (request.getParameter("messageSuccess") != null) {
			model.addAttribute("messageSuccess", request.getParameter("messageSuccess"));
		}
		if (request.getParameter("messageEdit") != null) {
			model.addAttribute("messageEdit", request.getParameter("messageEdit"));
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/viewProjects";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/deleteProject")
	public @ResponseBody String deleteProject(@RequestParam("projectId") String projectId) {
		JsonObject obj = new JsonObject();
		if (matrixService.deleteProject(projectId) == true) {
			obj.addProperty("result", "success");
		} else {
			obj.addProperty("result", "failure");

		}
		return obj.toString();

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/beforeEditProject")
	public String beforeEditProject(HttpServletRequest request, @RequestParam("projectName") String projectName,
			Model model) {
		Project project = new Project();
		project.setProjectName(projectName);
		model.addAttribute("project", project);
		model.addAttribute("accounts", matrixService.getAccounts());

		if (request.getParameter("messageEdit") != null) {
			model.addAttribute("messageEdit", request.getParameter("messageEdit"));
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/editProject";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/editProject")
	public String editProject(Model model, @ModelAttribute("project") Project project,
			@RequestParam("projectName") String projectName, @RequestParam("startDate") String startDate,
			@RequestParam("account") String accountName, @RequestParam("endDate") String endDate) {
		project.setStartDate(startDate);
		project.setEndDate(endDate);
		project.setProjectName(projectName);
		project.setAccountname(accountName);

		if (matrixService.editProject(project)) {
			model.addAttribute("messageEdit", "Project edited successfully");
			return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/viewProjects";
		} else {
			model.addAttribute("messageEdit", "Project edit failed");
			return "redirect:/integratedQALabs/mobileLab/deviceSelectionMatrix/beforeEditProject";
		}
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/cancelBooking")
	public String cancelBooking(Model model, @RequestParam("reservationid") String reservationid, HttpSession session) {

		matrixService.updateDeviceReservations(reservationid, "Cancelled",
				"Cancelled by" + session.getAttribute("userName"));

		String role = (String) session.getAttribute("rolename");
		if (role.equalsIgnoreCase("admin")) {
			List<MobileLabCatalog> requestedBookings = matrixService.getAllRequestedBookings();
			model.addAttribute("requestedBookings", requestedBookings);

		} else if (role.equalsIgnoreCase("user")) {
			String userid = (String) session.getAttribute("userid");
			List<MobileLabCatalog> userRequestedBookings = matrixService.getUserRequestedBookings(userid);
			model.addAttribute("requestedBookings", userRequestedBookings);
		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/requestedBookings";
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/dashboard")
	public String viewDashboard(Model model) {

		JSONArray deviceList = matrixService.getDeviceStatusRate();
		model.addAttribute("deviceDashboard", deviceList);
		JSONArray reservationCount = matrixService.getReservationCount("week");

		model.addAttribute("reservationCount", reservationCount);

		DigiLoggerUtils.log("Device Status Rate:" + deviceList, DigiLoggerUtils.LEVEL.info, this.getClass());

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/dashboard";
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/getReservationHistory")
	@ResponseBody
	public String getReservationHistory(Model model, @RequestParam("time") String time) {
		JSONArray array = matrixService.getReservationCount(time);

		return array.toJSONString();
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/getReservationData")
	@ResponseBody
	public String getReservationData(Model model, @RequestParam("start") String start,
			@RequestParam("end") String end) {
		JSONArray array = matrixService.getReservationCount(start, end);
		return array.toJSONString();
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/report")
	public String viewReport(Model model) {

		JSONArray array = matrixService.getDeviceUsage("week");

		model.addAttribute("deviceDashboard", array);

		array = matrixService.getUserUsage("week");

		model.addAttribute("userDashboard", array);

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/report";
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/deviceUsage")
	@ResponseBody
	public String deviceUsage(Model model, @RequestParam("time") String time) {
		JSONArray array = matrixService.getDeviceUsage(time);
		return array.toJSONString();
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/deviceUsageTimeSpan")
	@ResponseBody
	public String deviceUsageTimeSpan(Model model, @RequestParam("start") String start,
			@RequestParam("end") String end) {
		JSONArray array = matrixService.getDeviceUsage(start, end);
		return array.toJSONString();
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/userUsage")
	@ResponseBody
	public String userUsage(Model model, @RequestParam("time") String time) {
		JSONArray array = matrixService.getUserUsage(time);
		return array.toJSONString();
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/userUsageTimeSpan")
	@ResponseBody
	public String userUsageTimeSpan(Model model, @RequestParam("start") String start, @RequestParam("end") String end) {
		JSONArray array = matrixService.getUserUsage(start, end);
		return array.toJSONString();
	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/bulkDeviceDetails")
	public String bulkDeviceDetails() {

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/bulkDeviceDetails";

	}

	@RequestMapping("integratedQALabs/mobileLab/deviceSelectionMatrix/importDeviceDetails")
	public String importDeviceDetails(Model model,
			@RequestParam(value = "deviceFile", required = false) MultipartFile deviceFile) {
		if (FileUtils.uploadMultipartFile(deviceDetailsPath, deviceFile)) {
			if (matrixService.addDeviceDeatils(new File(deviceDetailsPath + "/" + deviceFile.getOriginalFilename()))) {
				model.addAttribute("message", "Device details added successfully");
			} else {
				model.addAttribute("message", "Failed to add device details");
			}

		}
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/bulkDeviceDetails";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/getDeviceDetailTemplate")
	public String getDeviceDetailTemplate(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		FileUtils.downloadFile(deviceDetailTemplate, session, response, request);

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/bulkDeviceDetails";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/showSeetestDevices")
	public String showSeetestDevices(Model model, HttpSession session) {
		matrixService.updateDeviceCatalog();
		List<DeviceCatalog> devices = matrixService.getDevices("Seetest");
		model.addAttribute("devices", devices);
		model.addAttribute("vendor", "Seetest");
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/showPerfectoDevices")
	public String showPerfectoDevices(Model model, HttpSession session) {
		matrixService.updateDeviceCatalog();
		List<DeviceCatalog> devices = matrixService.getDevices("Perfecto Partner");
		model.addAttribute("devices", devices);
		model.addAttribute("vendor", "Perfecto Partner");

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/showpCloudyDevices")
	public String showpCloudyDevices(Model model, HttpSession session) {
		matrixService.updateDeviceCatalog();
		List<DeviceCatalog> devices = matrixService.getDevices("pCloudy");
		model.addAttribute("devices", devices);
		model.addAttribute("vendor", "pCloudy");

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/showDevices";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/updateData")
	public String updateData(@RequestParam("market") String market, @RequestParam("type") String type,
			@RequestParam(value = "marketData", required = false) MultipartFile marketData,
			RedirectAttributes redirectAttributes, Model model, HttpSession session) {
		File dataPath = FileUtils.createFolder(basePath, "MobileLab");
		System.out.println("basepath:  " + basePath);
		System.out.println("datapah: " + dataPath);
		System.out.println("abs path data path: " + dataPath.getAbsolutePath());
		FileUtils.uploadMultipartFile(dataPath.getAbsolutePath(), marketData);
		matrixService.addMarketTrend(market, dataPath.getAbsolutePath() + "/" + marketData.getOriginalFilename(), type);
		redirectAttributes.addAttribute("market", market);
		return "redirect:marketTrends";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends")
	public String marketTrend(@RequestParam("market") String market, Model model, HttpSession session) {
		System.out.println("Market: " + market);
		// System.out.println("Duration: "+duration);

		JsonArray vendorMarketTrend = matrixService.getVendorMarketShare(market);
		JsonArray osMarketTrend = matrixService.getOsMarketShare(market); //
		Market marketDetails = matrixService.getMarket(market);
		JsonArray androidversionlist = matrixService.getandroidversion(market);
		JsonArray iosversionlist = matrixService.getiosversion(market);
		// OsDetails androidDetails = matrixService.getOsDetails("Android");
		// JSONArray androidDistribution =
		// matrixService.getOsDistribution(androidDetails.getIdosdetails());//refer
		// OsDetails iOSDetails = matrixService.getOsDetails("iOS");
		// JSONArray iOSDistribution =
		// matrixService.getOsDistribution(iOSDetails.getIdosdetails()); //refer
		List<String> monthsdata = matrixService.getmonthsdata(market);
		System.out.println("Months data: " + monthsdata);
		String timeperiod = null;
		if (monthsdata.isEmpty()) {
			timeperiod = "duration";
		} else {
			timeperiod = monthsdata.get(0) + " to " + monthsdata.get(12);
		}
		// System.out.println("timeperiod: " + timeperiod);
		// System.out.println("monthsdata markettrends: "+monthsdata);

		// System.out.println("vendor data: "+vendorMarketTrend);
		// System.out.println("os data: "+osMarketTrend);
		// System.out.println("android data: "+androidDistribution);
		// System.out.println("ios data: "+iOSDistribution);
		model.addAttribute("marketNames", matrixService.getMarkets());
		model.addAttribute("marketVendorData", vendorMarketTrend);
		model.addAttribute("marketOsData", osMarketTrend);
		model.addAttribute("marketName", marketDetails.getMarketname());
		model.addAttribute("market", market);
		model.addAttribute("androidDistribution", androidversionlist);
		model.addAttribute("iOSDistribution", iosversionlist);
		model.addAttribute("monthsdata", monthsdata);
		model.addAttribute("timeperiod", timeperiod);

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/userTrends")
	public String userTrends(Model model, HttpSession session) {
		JsonArray vendorMarketTrend = matrixService.getVendorMarketShare("1");
		JsonArray osMarketTrend = matrixService.getOsMarketShare("1");
		Market marketDetails = matrixService.getMarket("1");
		JsonArray androidversionlist = matrixService.getandroidversion("1");
		JsonArray iosversionlist = matrixService.getiosversion("1");
		// OsDetails androidDetails = matrixService.getOsDetails("Android");
		// androidDistribution =
		// matrixService.getOsDistribution(androidDetails.getIdosdetails());
		// OsDetails iOSDetails = matrixService.getOsDetails("iOS");
		// JSONArray iOSDistribution =
		// matrixService.getOsDistribution(iOSDetails.getIdosdetails());
		List<String> monthsdata = matrixService.getmonthsdata("1");
		System.out.println("Months data: " + monthsdata);
		String timeperiod = null;
		if (monthsdata.isEmpty()) {
			timeperiod = "duration";
		} else {
			timeperiod = monthsdata.get(0) + " to " + monthsdata.get(1);
		}
		model.addAttribute("marketNames", matrixService.getMarkets());
		model.addAttribute("marketVendorData", vendorMarketTrend);
		model.addAttribute("marketOsData", osMarketTrend);
		model.addAttribute("marketName", marketDetails.getMarketname());
		model.addAttribute("market", "1");
		model.addAttribute("androidDistribution", androidversionlist);
		model.addAttribute("iOSDistribution", iosversionlist);
		model.addAttribute("monthsdata", monthsdata);
		model.addAttribute("timeperiod", timeperiod);

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/userTrends";
	}

	// edit to refresh duration
	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/duration")
	public String manageduration(@RequestParam("market") String marketid, @RequestParam("duration") String duration,
			Model model, HttpSession session) {
		System.out.println("Market: " + marketid + " duration: " + duration);
		System.out.println("Market: " + marketid);
		System.out.println("Duration: " + duration);

		JsonArray vendorMarketTrend = matrixService.filterVendorMarketShare(marketid, duration); // change
		JsonArray osMarketTrend = matrixService.filterOsMarketShare(marketid, duration); // change
		Market marketDetails = matrixService.getMarket(marketid);
		JsonArray androidversion = matrixService.filterAndroidVersion(marketid, duration);
		JsonArray iOSversion = matrixService.filteriOSVersion(marketid, duration);
		// OsDetails androidDetails = matrixService.getOsDetails("Android");
		// JSONArray androidDistribution =
		// matrixService.getOsDistribution(androidDetails.getIdosdetails());
		// OsDetails iOSDetails = matrixService.getOsDetails("iOS");
		// JSONArray iOSDistribution =
		// matrixService.getOsDistribution(iOSDetails.getIdosdetails());
		List<String> monthsdata = matrixService.getmonthsdata(marketid);
		String timeperiod = null;

		if (monthsdata.isEmpty()) {
			timeperiod = "duration";
		} else {
			if (duration.equals("q1")) {
				timeperiod = monthsdata.get(0) + " to " + monthsdata.get(3);
			} else if (duration.equals("q2")) {
				timeperiod = monthsdata.get(4) + " to " + monthsdata.get(7);
			} else if (duration.equals("q3")) {
				timeperiod = monthsdata.get(8) + " to " + monthsdata.get(12);
			} else if (duration.equals("s1")) {
				timeperiod = monthsdata.get(0) + " to " + monthsdata.get(5);
			} else if (duration.equals("s2")) {
				timeperiod = monthsdata.get(6) + "-" + monthsdata.get(12);
			}
		}

		System.out.println("Months in json: " + monthsdata);

		// System.out.println("MarketNames: "+marketnames);

		// System.out.println("timeperiod: " + timeperiod);
		// System.out.println("vendor data: "+vendorMarketTrend);
		// System.out.println("os data: "+osMarketTrend);
		// System.out.println("android data: "+androidDistribution);
		// System.out.println("ios data: "+iOSDistribution);
		model.addAttribute("marketNames", matrixService.getMarkets());
		model.addAttribute("marketVendorData", vendorMarketTrend);
		model.addAttribute("marketOsData", osMarketTrend);
		model.addAttribute("marketName", marketDetails.getMarketname());
		model.addAttribute("market", marketid);
		model.addAttribute("androidDistribution", androidversion);
		model.addAttribute("iOSDistribution", iOSversion);
		model.addAttribute("monthsdata", monthsdata);
		model.addAttribute("timeperiod", timeperiod);

		return "integratedQALabs/mobileLab/deviceSelectionMatrix/marketTrends";

	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/executionRun")
	public String executionNewRun(Model model, @RequestParam("toolName") String toolName, HttpSession session) {
		Run run = new Run();
		model.addAttribute("newRun", run);
		model.addAttribute("projectName",
				adminService.getProject((String) session.getAttribute("projectid")).getProjectName());
		model.addAttribute("toolName", toolName);
		JsonArray vendorMarketTrend = matrixService.getVendorMarketShare("1");
		JsonArray osMarketTrend = matrixService.getOsMarketShare("1");
		Market marketDetails = matrixService.getMarket("1");
		OsDetails androidDetails = matrixService.getOsDetails("Android");
		JSONArray androidDistribution = matrixService.getOsDistribution(androidDetails.getIdosdetails());
		OsDetails iOSDetails = matrixService.getOsDetails("iOS");
		JSONArray iOSDistribution = matrixService.getOsDistribution(iOSDetails.getIdosdetails());
		List<String> monthsdata = matrixService.getmonthsdata("1");
		String timeperiod = null;
		if (monthsdata.isEmpty()) {
			timeperiod = "duration";
		} else {
			timeperiod = monthsdata.get(0) + " to " + monthsdata.get(1);
		}
		model.addAttribute("marketNames", matrixService.getMarkets());
		model.addAttribute("marketVendorData", vendorMarketTrend);
		model.addAttribute("marketOsData", osMarketTrend);
		model.addAttribute("marketName", marketDetails.getMarketname());
		model.addAttribute("market", "1");
		model.addAttribute("androidDistribution", androidDistribution);
		model.addAttribute("iOSDistribution", iOSDistribution);
		model.addAttribute("monthsdata", monthsdata);
		model.addAttribute("timeperiod", timeperiod);
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/executionRun";
	}

	@RequestMapping(value = "integratedQALabs/mobileLab/deviceSelectionMatrix/dashboardRun")
	public String dashboardRun(Model model, HttpSession session, @RequestParam("toolName") String toolName) {
		String projectid = (String) session.getAttribute("projectid");
		DigiLoggerUtils.log("Tool Nmae selected by user " + toolName, LEVEL.info);
		List<Run> runs = executionConsoleService.getRuns(projectid, adminService.getTool(toolName).getToolid());
		model.addAttribute("toolName", toolName);
		List<String> runNames = new ArrayList<String>();
		for (Run run : runs) {
			runNames.add(run.getRunName());
		}
		model.addAttribute("runs", runs);
		model.addAttribute("runNames", runNames);
		DigiLoggerUtils.log("Run belonging to tool :: " + toolName + "  :: Run Values " + runs, LEVEL.info);
		JsonArray vendorMarketTrend = matrixService.getVendorMarketShare("1");
		JsonArray osMarketTrend = matrixService.getOsMarketShare("1");
		Market marketDetails = matrixService.getMarket("1");
		OsDetails androidDetails = matrixService.getOsDetails("Android");
		JSONArray androidDistribution = matrixService.getOsDistribution(androidDetails.getIdosdetails());
		OsDetails iOSDetails = matrixService.getOsDetails("iOS");
		JSONArray iOSDistribution = matrixService.getOsDistribution(iOSDetails.getIdosdetails());
		List<String> monthsdata = matrixService.getmonthsdata("1");
		String timeperiod = null;
		if (monthsdata.isEmpty()) {
			timeperiod = "duration";
		} else {
			timeperiod = monthsdata.get(0) + " to " + monthsdata.get(1);
		}
		model.addAttribute("marketNames", matrixService.getMarkets());
		model.addAttribute("marketVendorData", vendorMarketTrend);
		model.addAttribute("marketOsData", osMarketTrend);
		model.addAttribute("marketName", marketDetails.getMarketname());
		model.addAttribute("market", "1");
		model.addAttribute("androidDistribution", androidDistribution);
		model.addAttribute("iOSDistribution", iOSDistribution);
		model.addAttribute("monthsdata", monthsdata);
		model.addAttribute("timeperiod", timeperiod);
		return "integratedQALabs/mobileLab/deviceSelectionMatrix/dashboardRun";

	}
}
