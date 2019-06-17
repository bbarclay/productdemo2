/******************************************************************************
Copyright © 2016 Capgemini Group of companies. All rights reserved
(Subject to Limited Distribution and Restricted Disclosure Only.)
THIS SOURCE FILE MAY CONTAIN INFORMATION WHICH IS THE PROPRIETARY
INFORMATION OF Capgemini GROUP OF COMPANIES AND IS INTENDED FOR USE
ONLY BY THE ENTITY WHO IS ENTITLED TO AND MAY CONTAIN
INFORMATION THAT IS PRIVILEGED, CONFIDENTIAL, OR EXEMPT FROM
DISCLOSURE UNDER APPLICABLE LAW.
YOUR ACCESS TO THIS SOURCE FILE IS GOVERNED BY THE TERMS AND
CONDITIONS OF AN AGREEMENT BETWEEN YOU AND Capgemini GROUP OF COMPANIES.
The USE, DISCLOSURE REPRODUCTION OR TRANSFER OF THIS PROGRAM IS
RESTRICTED AS SET FORTH THEREIN.
******************************************************************************/

package com.cg.digi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;


import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Batch;
import com.cg.digi.model.Chat;
import com.cg.digi.model.Defect;
import com.cg.digi.model.ExecutionResults;
import com.cg.digi.model.Question;
import com.cg.digi.model.Results;
import com.cg.digi.model.Reviews;
import com.cg.digi.model.Survey;
import com.cg.digi.model.Task;
import com.cg.digi.model.Testcase;
import com.cg.digi.model.Tool;
import com.cg.digi.model.User;
import com.cg.digi.service.IAdminService;
import com.cg.digi.service.IDigitalQAService;
import com.cg.digi.service.ILoginService;
import com.cg.digi.utilities.Appbot;
import com.cg.digi.utilities.Appsee;
import com.cg.digi.utilities.DeviceDetails;
import com.cg.digi.utilities.InRoads;
import com.google.gson.Gson;

/**
 * @author hapemmas
 *
 */
@Scope("session")
@Controller
public class DigitalQAService {

	@Value("${macURL}")
	String macURL;

	@Value("${userReviews}")
	String userReviewPath;
	
	@Autowired
	ILoginService loginService;

	@Autowired
	IAdminService adminService;

	@Autowired
	IDigitalQAService digiQAService;

	@Value("${sentimentRecommendation}")
	String sentimentRecommendation;

	@Value("${documentTestingBase}")
	String documentTestingBase;
	/*****************************chatbot for accessibility testing*****************************/
	@RequestMapping(value = "digitalQAService/accessibilityTesting/Chatbotinput")
	 public void getInputfrombot(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			  throws ServletException, IOException {
			    String inputmsg = request.getParameter("input");
			    System.out.println("input data is: "+inputmsg);
			  String userid= (String) session.getAttribute("userid");
			  String sessionid= session.toString();
				System.out.println("userid inside save input : "+ userid+ "session id is: "+sessionid);
			    loginService.saveuserinput(inputmsg, userid, sessionid);
			  
			  }
	@RequestMapping(value = "digitalQAService/accessibilityTesting/Chatbotoutput")
	 public void getOutputfrombot(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			  throws ServletException, IOException {
			    
			    String outputmsg = request.getParameter("output");
			    System.out.println("output data is: "+outputmsg);
			    String userid= (String) session.getAttribute("userid");
			    String sessionid= session.toString();
				System.out.println("userid inside save output : "+ userid);
			    loginService.savebotoutput(outputmsg, userid, sessionid);
			  }
	@RequestMapping(value = "digitalQAService/accessibilityTesting/chathistory")
	public String getchatfromdb(HttpServletRequest request, HttpServletResponse response,HttpSession session) 
			throws ServletException, IOException, JSONException{
		
		String userid= (String) session.getAttribute("userid");
		 String sessionid= session.toString();
		System.out.println("userid inside getsender chat : "+ userid);
		
		ArrayList<Chat> userinput= loginService.getuserchat(userid, sessionid);//done
		System.out.println("entering bot chat fetching dao");
		ArrayList<Chat> botoutput= loginService.getbotchat(userid, sessionid);
		System.out.println("Collected bot chat adding into allchat list"); //successful
		ArrayList<Chat> allchat= new ArrayList<Chat>();
	
	
		allchat.addAll(userinput);
		//System.out.println("All chat(1): "+ allchat+ "size "+allchat.size());
		
		allchat.addAll(botoutput);
		response.setContentType("application/json");
		//System.out.println("All chat(2): "+ allchat +"size "+allchat.size());
		
		  JSONArray jsonArr= new JSONArray();
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
		    Collections.sort( jsonValues, new Comparator<JSONObject>() {
		     
		        private static final String KEY_NAME = "creation time";

		        @Override
		        public int compare(JSONObject a, JSONObject b) {
		            String valA = new String();
		            String valB = new String();

		            try {
						valA = (String) a.get(KEY_NAME);
						valB = (String) b.get(KEY_NAME);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				

		            return valA.compareTo(valB);
		          
		        }
		    });

		    for (int i = 0; i < jsonArr.size(); i++) {
		    	
		        sortedJsonArray.add(jsonValues.get(i));
		    }
		   System.out.println("json chat: "+ sortedJsonArray.toString());
	request.setAttribute("history", sortedJsonArray);
   RequestDispatcher rd = request.getRequestDispatcher("demobot.jsp");
	    rd.forward(request,response);
		return  "demobot";
	}

	/*****************************chatbot ends*****************************/
	@RequestMapping(value = "digitalQAService/accessibilityTesting/addManualChecklisttestCase")
	public String addManualChecklisttestCase(Model model) {

		Testcase testcase = new Testcase();
		model.addAttribute("testcase", testcase);

		List<Tool> tool = adminService.getAllTools();
		model.addAttribute("tools", tool);

		return "/digitalQAService/accessibilityTesting/addManualAccessibilityTC";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/addNewAccessibilityTestCase")
	public String addNewAccessibilityTestCase(Model model, @ModelAttribute("testcase") Testcase testcase,
			HttpSession session) {

		DigiLoggerUtils.log("Bean Values from user -->" + testcase, LEVEL.info);
		model.addAttribute("message", "TestCase Added Succesfully");

		Testcase successTestcase = digiQAService.addManualTestCases(testcase, (String) session.getAttribute("userid"));
		if (successTestcase == null) {
			model.addAttribute("errorMessage", "Failed to Add Testcase to Database");
		} else {
			model.addAttribute("successMessage", successTestcase.getTestcaseName() + " added Successfully");
		}

		List<Tool> tool = adminService.getAllTools();
		model.addAttribute("tools", tool);
		return "/digitalQAService/accessibilityTesting/addManualAccessibilityTC";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/viewTestcases")
	public String validateTestcases(Model model, @RequestParam("batchid") String batchid, HttpSession session) {

		List<Testcase> list = digiQAService.getAllocatedTestcasesToUser(batchid);
		model.addAttribute("testcases", list);
		model.addAttribute("batchid", batchid);

		List<Testcase> validatedTestcases = new ArrayList<Testcase>();
		model.addAttribute("validatedTestcases", validatedTestcases);
		return "digitalQAService/accessibilityTesting/viewTestcases";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/validateTestcases")
	public String validateTestcases(Model model, HttpSession session,
			@ModelAttribute("validatedTestcases") Testcase testcase, @RequestParam("batchid") String batchid) {

		List<Testcase> list = digiQAService.getAllTestcases(adminService.getTool("AccessibilityTesting").getToolid());
		model.addAttribute("testcases", list);

		String[] data = testcase.getTcstatus().split(",");
		double passCount = 0;
		double failCount = 0;
		double notApplicable = 0;
		double norun = 0;
		DigiLoggerUtils.log("Total Test case length -->>" + data.length, LEVEL.error);
		for (String string : data) {
			if (string.contains("PASSED")) {
				passCount++;
			} else if (string.contains("FAILED")) {
				failCount++;
			} else {
				if (string.contains("BLOCKED")) {
					failCount++;
				} else if (string.contains("NOT_COMPLETED") || string.contains("NO RUN")) {
					norun++;
				}
			}
		}
		double total = passCount + failCount + norun + notApplicable;
		DigiLoggerUtils.log("Count : Passed : " + passCount + " Failed : " + failCount + " NOT APPLICABLE : "
				+ notApplicable + " No Run ::" + norun + ":: Total ::" + total, LEVEL.error);

		boolean result = digiQAService.updateTestcaseResults(testcase, (String) session.getAttribute("userid"),
				passCount, failCount, total);
		if (result) {
			model.addAttribute("successMessage", "Results Submitted ");
		} else {
			model.addAttribute("errorMessage", "Failed to Update Results");
		}
		// transfered data
		List<Batch> batches = digiQAService.getAllAllocatedBatches((String) session.getAttribute("userid"));
		model.addAttribute("batches", batches);
		return "digitalQAService/accessibilityTesting/viewAllocatedBatches";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/addTestSuite")
	public String accessibilityTesting(Model model, @RequestParam("toolName") String toolName, HttpSession session) {

		Batch batch = new Batch();
		model.addAttribute("batch", batch);

		List<Tool> tool = adminService.getAllTools();
		model.addAttribute("tools", tool);

		List<User> users = adminService.getAllUsers((String) session.getAttribute("projectid"));
		model.addAttribute("users", users);

		return "digitalQAService/accessibilityTesting/addTestSuite";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/addNewTestSuite")
	public String addNewTestSuite(Model model, @ModelAttribute("batch") Batch batch, HttpSession session) {

		batch = adminService.newBatch(batch, (String) session.getAttribute("userid"));
System.out.println("batchname : "+batch);
		if (batch.getBatchname() != null) {
			model.addAttribute("successMessage", batch.getBatchname() + " successfully updated in Database");
		} else {
			System.out.println("batch already exist");
			model.addAttribute("successMessage", "Failed to Add Batch in Database");
		}
		Batch batch1 = new Batch();
		model.addAttribute("batch", batch1);

		List<Tool> tool = adminService.getAllTools();
		model.addAttribute("tools", tool);

		List<User> users = adminService.getAllUsers((String) session.getAttribute("projectid"));
		model.addAttribute("users", users);

		List<Batch> batch3 = adminService
				.getManualTestSuiteBatches(adminService.getTool("AccessibilityTesting").getToolid());
		model.addAttribute("batches", batch3);

		return "digitalQAService/accessibilityTesting/batchHome";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/batchHome")
	public String newBatch(Model model, HttpSession session) {
		List<Batch> batch = adminService
				.getManualTestSuiteBatches(adminService.getTool("AccessibilityTesting").getToolid());
		model.addAttribute("batches", batch);
		return "digitalQAService/accessibilityTesting/batchHome";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/testSuiteCreator")
	public String addTestCasesToBatch(Model model, HttpSession session, @RequestParam("batchid") String batchid) {
		Testcase testcase = new Testcase();
		model.addAttribute("selectedTestcases", testcase);
		List<Testcase> list = digiQAService.getAllTestcases(adminService.getTool("AccessibilityTesting").getToolid());
		// model.addAttribute("testcases", list);
		model.addAttribute("batchid", batchid);
		model.addAttribute("newtestcases", list);
		return "digitalQAService/accessibilityTesting/testSuiteCreator";
	}

	@RequestMapping(value = "digitalQAService/accessibilityTesting/addTestcasestoBatch")
	public String addTestcasestoBatch(Model model, @ModelAttribute("selectedTestcases") Testcase testcase,
			HttpSession session, @RequestParam("batchid") String batchid) {
		String[] data = testcase.getTestcaseid().split(",");
		int output = digiQAService.addTestcasestoBatch(data, batchid);
		List<Batch> batch = adminService
				.getManualTestSuiteBatches(adminService.getTool("AccessibilityTesting").getToolid());
		model.addAttribute("batches", batch);
		model.addAttribute("successMessage", output + " : Testcases added to Suite");
		return "digitalQAService/accessibilityTesting/batchHome";
	}
// this method is for  version
	/*@RequestMapping(value = "digitalQAService/accessibilityTesting/viewAllocatedBatch")
	public String viewAllocatedBatch(Model model, HttpSession session) {

		String str2 = (String) session.getAttribute("rolename");

		if (str2.equalsIgnoreCase("admin")) {
			List<Batch> batch = adminService
					.getManualTestSuiteBatches(adminService.getTool("AccessibilityTesting").getToolid());
			model.addAttribute("batches", batch);
		} else {
			List<Batch> batches = digiQAService.getAllAllocatedBatches((String) session.getAttribute("userid"));
			model.addAttribute("batches", batches);
		}
		return "digitalQAService/accessibilityTesting/viewAllocatedBatches";
	}*/
	//This has been taken from previous versions
	@RequestMapping(value = "digitalQAService/accessibilityTesting/viewAllocatedBatch")
	public String viewAllocatedBatch(Model model, HttpSession session) {

		List<Batch> batches = digiQAService
				.getAllAllocatedBatches((String) session.getAttribute("userid"));
		model.addAttribute("batches", batches);
		System.out.println("inside view allocated batch");
		return "digitalQAService/accessibilityTesting/viewAllocatedBatches";}

	@RequestMapping(value = "/digitalQAService/accessibilityTesting/viewExecutionResults")
	public String viewExecutionResults(Model model, @RequestParam("batchid") String batchid) {

		List<ExecutionResults> results = digiQAService.getExecutionResults(batchid);
		model.addAttribute("results", results);
		return "digitalQAService/accessibilityTesting/viewExecutionResults";
	}


		          
		     
	
	@RequestMapping(value = "/digitalQAService/crowdSourcing")
	public String crowdSourcing(Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		System.out.println("userid ---->" + userid);
		String projectid = (String) session.getAttribute("projectid");
		System.out.println("projectid ---->" + projectid);
		model.addAttribute("userid", userid);
		model.addAttribute("projectid", projectid);

		return "digitalQAService/crowdSourcing/index";
	}

	@RequestMapping(value = "/digitalQAService/crowdSourcing/userExistingProject")
	public String existingProject(Model model, HttpSession session) {

		String userid = (String) session.getAttribute("userid");
		System.out.println("userid ---->" + userid);
		model.addAttribute("userid", userid);

		return "digitalQAService/crowdSourcing/project";
	}

	@RequestMapping(value = "/digitalQAService/crowdSourcing/getProjects")
	@ResponseBody
	public String getProjects(Model model, HttpSession session) {

		System.out.println("in getprojects-----------------------");

		JSONObject listOfProjects = Appbot.projects();
		System.out.println("list of projects--------" + listOfProjects);
		model.addAttribute("listOfProjects", listOfProjects);
		return listOfProjects.toString();
	}

	// Deepika's code start

	@RequestMapping(value = "/digitalQAService/crowdSourcing/overall")
	public String overall(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("surveyid") String surveyid) {
		System.out.println(" surveyid = " + surveyid);
		String totaluser = null;
		String surveyname = null;
		String targetmails = null;
		session.setAttribute("surveyid", surveyid);
		List<Survey> surveydetails = digiQAService.getUsers(surveyid);
		for (Survey surveydetail : surveydetails) {
			surveyname = surveydetail.getSurveyname();
			targetmails = surveydetail.getTargetemails();

		}
		String[] targetusers = targetmails.split(",");
		ArrayList<String> list = new ArrayList<>(Arrays.asList(targetusers));
		int total = list.size();

		List<Results> result = digiQAService.getResults(surveyid);
		System.out.println(result);
		HashMap<String, String> emailId = new HashMap<String, String>();

		List<Task> task = digiQAService.getTasks(surveyid);

		for (Results results : result) {
			emailId.put(results.getUseremail(), results.getActionid());
		}

		List<Question> question = digiQAService.getQuestions(surveyid);

		int abandant = 0;
		Iterator it = emailId.entrySet().iterator();

		while (it.hasNext()) {
			List<Results> resultingList = new ArrayList<Results>();
			Map.Entry pair = (Map.Entry) it.next();

			for (Results results : result) {
				if (results.getUseremail().equals(pair.getKey())) {
					resultingList.add(results);
				}
			}
			boolean flag = true;
			for (Task tName : task) {
				for (Results results : resultingList) {
					if (tName.getTaskid().trim().equals(results.getActionid().trim())
							&& results.getFlag().equals("T")) {
						flag = false;
					}
				}
				if (flag) {
					abandant++;
					break;
				}
			}
			if (task.size() == 0) {
				System.out.println("task no");
				flag = false;
			}

			if (!flag) {
				flag = true;
				for (Question quest : question) {

					for (Results results : resultingList) {
						if (quest.getQuestionid().trim().equals(results.getActionid().trim())
								&& results.getFlag().equals("Q")) {
							flag = false;
						}
					}
					if (flag) {
						abandant++;
						break;
					}
				}
			}
		}
		int participants = emailId.size() - abandant;
		session.setAttribute("totalParticipants", participants);
		int non_participants = total - participants - abandant;
		model.addAttribute("abundant", abandant);
		model.addAttribute("cnt", non_participants);

		model.addAttribute("participants", participants);
		model.addAttribute("total", total);
		model.addAttribute("surveyname", surveyname);
		model.addAttribute("surveyid", surveyid);
		return "digitalQAService/crowdSourcing/overall";
	}

	@RequestMapping(value = "/overall")
	public String overallResult(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		String surveyid = (String) session.getAttribute("surveyid");
		String totaluser = null;
		String surveyname = null;
		String targetmails = null;
		List<Survey> surveydetails = digiQAService.getUsers(surveyid);
		for (Survey surveydetail : surveydetails) {
			surveyname = surveydetail.getSurveyname();
			targetmails = surveydetail.getTargetemails();
		}

		String[] targetusers = targetmails.split(",");
		ArrayList<String> list = new ArrayList<>(Arrays.asList(targetusers));
		int total = list.size();

		List<Results> result = digiQAService.getResults(surveyid);
		System.out.println(result);
		HashMap<String, String> emailId = new HashMap<String, String>();

		List<Task> task = digiQAService.getTasks(surveyid);

		for (Results results : result) {
			emailId.put(results.getUseremail(), results.getActionid());
		}

		List<Question> question = digiQAService.getQuestions(surveyid);

		int abandant = 0;
		Iterator it = emailId.entrySet().iterator();

		while (it.hasNext()) {
			List<Results> resultingList = new ArrayList<Results>();
			Map.Entry pair = (Map.Entry) it.next();
			// System.out.println("Current Email Id:"+pair.getKey());
			for (Results results : result) {
				if (results.getUseremail().equals(pair.getKey())) {
					// System.out.println("============Added Result=========="+results);
					resultingList.add(results);
				}
			}
			boolean flag = true;
			for (Task tName : task) {
				for (Results results : resultingList) {
					if (tName.getTaskid().trim().equals(results.getActionid().trim())
							&& results.getFlag().equals("T")) {
						flag = false;
					}
				}
				if (flag) {
					abandant++;
					break;
				}
			}
			if (task.size() == 0) {
				System.out.println("task no");
				flag = false;
			}

			if (!flag) {
				flag = true;
				for (Question quest : question) {

					for (Results results : resultingList) {
						if (quest.getQuestionid().trim().equals(results.getActionid().trim())
								&& results.getFlag().equals("Q")) {
							flag = false;
						}
					}
					if (flag) {
						abandant++;
						break;
					}
				}
			}
		}
		int participants = emailId.size() - abandant;
		session.setAttribute("totalParticipants", participants);
		int non_participants = total - participants - abandant;
		model.addAttribute("abundant", abandant);
		model.addAttribute("cnt", non_participants);
		model.addAttribute("participants", participants);
		model.addAttribute("total", total);
		model.addAttribute("surveyname", surveyname);
		return "digitalQAService/crowdSourcing/overall";
	}

	@RequestMapping(value = "task")
	public String task(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String surveyid = (String) session.getAttribute("surveyid");

		List<Results> res = digiQAService.getResults(surveyid);
		List<Task> task = new ArrayList<Task>();
		task = digiQAService.getTasks(surveyid);
		System.out.println("=================task size======" + task.size());
		if (task.size() > 0) {
			System.out.println("task is not null");
			Gson gson = new Gson();
			String jsonTask = gson.toJson(task);
			Gson gson1 = new Gson();
			String jsonResult = gson1.toJson(res);

			model.addAttribute("tasks", jsonTask);
			model.addAttribute("result", jsonResult);
		} else {
			System.out.println("task is null");
			String message = "No tasks are assigned to this survey";
			model.addAttribute("message", message);

		}

		return "digitalQAService/crowdSourcing/task";
	}

	@RequestMapping(value = "question")
	public String question(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String surveyid = (String) session.getAttribute("surveyid");
		List<Question> question = digiQAService.getQuestions(surveyid);

		List<Results> result = digiQAService.getResults(surveyid);
		if (question.size() > 0) {
			Gson gson = new Gson();
			String jsonQuestion = gson.toJson(question);

			Gson gson1 = new Gson();
			String jsonResult = gson1.toJson(result);

			int totalParticipants = (int) session.getAttribute("totalParticipants");
			System.out.println("participants in question " + totalParticipants);
			System.out.println("Question : " + jsonQuestion);
			model.addAttribute("questions", jsonQuestion);
			model.addAttribute("result", jsonResult);
			model.addAttribute("totalParticipants", totalParticipants);
		} else {
			System.out.println("question is null");
			String message = "No questions are assigned to this survey";
			model.addAttribute("message", message);

		}

		return "digitalQAService/crowdSourcing/question";
	}

	// Deepika's code end
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/analyticsApps")
	@ResponseBody
	public String analyticsApps(Model model) {

		// JSONObject listOfApps = Appbot.listYourApps("", "");
		String strJSON = "{\"results\": [{\"id\": 9,\"Application\": \"1400001\",\"name\": \"Application\",\"store\": \"iOS\"}],\"count\": 1}";
		JSONObject jArray = null;
		try {
			jArray = (JSONObject) new JSONTokener(strJSON).nextValue();
		} catch (JSONException e) {
			DigiLoggerUtils.log("Error while getting data from listYourApps " + jArray, LEVEL.error);
		}
		model.addAttribute("appList", jArray);
		return jArray.toString();
	}

	/*****************************chatbot for user experience testing *****************************/
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/analytics/Chatbotinput")
	 public void getInputfrombot3(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			  throws ServletException, IOException {
			    String inputmsg = request.getParameter("input");
			    System.out.println("input data is: "+inputmsg);
			  String userid= (String) session.getAttribute("userid");
			  String sessionid= session.toString();
				System.out.println("userid inside save input : "+ userid+ "session id is: "+sessionid);
			    loginService.saveuserinput(inputmsg, userid, sessionid);
			  
			  }
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/analytics/Chatbotoutput")
	 public void getOutputfrombot3(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			  throws ServletException, IOException {
			    
			    String outputmsg = request.getParameter("output");
			    System.out.println("output data is: "+outputmsg);
			    String userid= (String) session.getAttribute("userid");
			    String sessionid= session.toString();
				System.out.println("userid inside save output : "+ userid);
			    loginService.savebotoutput(outputmsg, userid, sessionid);
			  }
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/analytics/chathistory")
	public String getchatfromdb3(HttpServletRequest request, HttpServletResponse response,HttpSession session) 
			throws ServletException, IOException, JSONException{
		
		String userid= (String) session.getAttribute("userid");
		 String sessionid= session.toString();
		System.out.println("userid inside getsender chat : "+ userid);
		
		ArrayList<Chat> userinput= loginService.getuserchat(userid, sessionid);//done
		System.out.println("entering bot chat fetching dao");
		ArrayList<Chat> botoutput= loginService.getbotchat(userid, sessionid);
		System.out.println("Collected bot chat adding into allchat list"); //successful
		ArrayList<Chat> allchat= new ArrayList<Chat>();
	
	
		allchat.addAll(userinput);
		//System.out.println("All chat(1): "+ allchat+ "size "+allchat.size());
		
		allchat.addAll(botoutput);
		response.setContentType("application/json");
		//System.out.println("All chat(2): "+ allchat +"size "+allchat.size());
		
		  JSONArray jsonArr= new JSONArray();
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
		    Collections.sort( jsonValues, new Comparator<JSONObject>() {
		     
		        private static final String KEY_NAME = "creation time";

		        @Override
		        public int compare(JSONObject a, JSONObject b) {
		            String valA = new String();
		            String valB = new String();

		            try {
						valA = (String) a.get(KEY_NAME);
						valB = (String) b.get(KEY_NAME);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				

		            return valA.compareTo(valB);
		          
		        }
		    });

		    for (int i = 0; i < jsonArr.size(); i++) {
		    	
		        sortedJsonArray.add(jsonValues.get(i));
		    }
		   System.out.println("json chat: "+ sortedJsonArray.toString());
	request.setAttribute("history", sortedJsonArray);
   RequestDispatcher rd = request.getRequestDispatcher("demobot.jsp");
	    rd.forward(request,response);
		return  "demobot";
	}
/******************************************chatbot ends************************************************************/
	
	
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis")
	@ResponseBody
	public String sentimentAnalysis(Model model) {

		JSONObject listOfApps = Appbot.listYourApps("", "");
		model.addAttribute("appList", listOfApps);
		return listOfApps.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/detailReport")
	public String detailReport(Model model, @RequestParam("appName") String appName) {
		model.addAttribute("appName", appName);
		return "digitalQAService/userExperienceTesting/sentiment/detailReport";
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentBreakdown")
	@ResponseBody
	public String sentimentBreakdown(Model model, @RequestParam("appId") String appId) {
		JSONObject sentimentBreakDown = Appbot.sentimentBreakdown("", appId);
		model.addAttribute("sentimentBreakDown", sentimentBreakDown);
		return sentimentBreakDown.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/popularWords")
	@ResponseBody
	public String popularWords(Model model, @RequestParam("appId") String appId) {
		JSONObject sentimentBreakDown = Appbot.getPopularWords("", "", appId);
		return sentimentBreakDown.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/critiaclWords")
	@ResponseBody
	public String criticalWords(Model model, @RequestParam("appId") String appId) {
		JSONObject criticalWords = Appbot.getCriticalWords("", "", appId);
		return criticalWords.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/sentimentTimeline")
	@ResponseBody
	public String sentimentTimeline(Model model, @RequestParam("appId") String appId) {
		JSONObject sentimentBreakDown = Appbot.sentimentTimeline("", appId);

		return sentimentBreakDown.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/emotions")
	@ResponseBody
	public String emotions(Model model, @RequestParam("appId") String appId) {
		JSONObject emotions = Appbot.getEmotions("", appId);
		return emotions.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/topics")
	@ResponseBody
	public String topics(Model model, @RequestParam("appId") String appId) {
		JSONObject topics = Appbot.getTopics("", appId);
		System.out.println(topics.toString());
		return topics.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/reviews")
	@ResponseBody
	public String reviews(Model model, @RequestParam("appId") String appId) {
		JSONObject reviews = Appbot.reviews("", appId);
		return reviews.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/allReviews")
	public String getAllReviews(Model model, @RequestParam("appId") String appId) {
		System.out.println("in controlller---------" + appId);
		String jsonReviews = null;
		List<Reviews> listOfReviews = new ArrayList<Reviews>();
		listOfReviews = adminService.getAllReviews(appId);
		System.out.println("review list size---" + listOfReviews.size());
		Gson gson = new Gson();
		jsonReviews = gson.toJson(listOfReviews);
		System.out.println(jsonReviews.toString());
		/*
		 * String result = "{results:"+jsonReviews.toString()+"}";
		 * System.out.println(result); Client client = Client.create(); //String strJSON
		 * =
		 * "{\"review\":{\"reviewid\":\"1\",\"appid\":\"67\",\"authorname\":\"harish\",\"date\":\"2-23-1017\",\"review\":\"good\",\"rating\":\"4\",\"creationtime\":\"11.30AM\"}]}";
		 * String strJSON =
		 * "{\"results\":[{\"word\": \"Good\",\"counter\": 2903,\"positive\": 2700,\"negative\": 200,\"neutral\": 0}, {\"word\": \"Use\",\"counter\": 1889,\"positive\": 1700,\"negative\": 200,\"neutral\": 0},{\"word\": \"Nice\",\"counter\": 1769,\"positive\": 1600, \"negative\": 200, \"neutral\": 0	}, { \"word\": \"Easy\", \"counter\": 1529, \"positive\": 1500, \"negative\": 100, \"neutral\": 0	}, { \"word\": \"Banking\", \"counter\": 997, \"positive\": 800, \"negative\": 100, \"neutral\": 5	}, { \"word\": \"Love\", \"counter\": 855, \"positive\": 855, \"negative\": 0, \"neutral\": 0	}, 	{ \"word\": \"Best\", \"counter\": 719, \"positive\": 650, \"negative\": 100, \"neutral\": 0	},{ \"word\": \"User\", \"counter\": 701, \"positive\": 650, \"negative\": 100, \"neutral\": 5	},{ \"word\": \"Friendly\", \"counter\": 682, \"positive\": 600, \"negative\": 100, \"neutral\": 5	},{ \"word\": \"Great\", \"counter\": 668, \"positive\": 600, \"negative\": 100, \"neutral\": 5	}],\"count\": 50}"
		 * ;
		 * 
		 * JSONObject jArray = null; try { jArray = (JSONObject) new
		 * JSONTokener(strJSON).nextValue(); } catch (JSONException e) {
		 * DigiLoggerUtils.log("Error while getting data from getWords " + jArray,
		 * LEVEL.error); System.out.println(e.getMessage()); } client.destroy();
		 * System.out.println(jArray); return jArray;
		 */
		return jsonReviews;
	}


	
	
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeAnalysis")
	@ResponseBody
	public String screens(Model model) {
		JSONObject screens = Appsee.getSessions("", "");
		return screens.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeUsage")
	@ResponseBody
	public String usage(Model model) {
		JSONObject usage = Appsee.getUsage("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeOS")
	@ResponseBody
	public String os(Model model) {
		JSONObject usage = Appsee.getOS("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeEvent")
	@ResponseBody
	public String eventsCount(Model model) {
		JSONObject resolution = Appsee.getEvents();
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeScreen")
	@ResponseBody
	public String Screen(Model model) {
		JSONObject resolution = Appsee.getScreen();
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeConnectivity")
	@ResponseBody
	public String Conectivity(Model model) {
		JSONObject resolution = Appsee.getConnectivity("", "");
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/inRoadsVersion")
	@ResponseBody
	public String inRoadsVersion(Model model) {
		JSONObject resolution = Appsee.getVersions("", "");
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/inRoadsAppVersion")
	@ResponseBody
	public String inRoadsAppVersion(Model model) {
		JSONObject resolution = InRoads.getAppVersions("", "");
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/inRoadsAppDevice")
	@ResponseBody
	public String inRoadsAppDevice(Model model) {
		JSONObject resolution = InRoads.getAppDevice("", "");
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeResolution")
	@ResponseBody
	public String resolution(Model model) {
		JSONObject usage = Appsee.getResolution("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeTU")
	@ResponseBody
	public String topuser(Model model) {
		JSONObject usage = Appsee.getTopuser("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeCrash")
	@ResponseBody
	public String crash(Model model) {
		JSONObject usage = Appsee.getCrash("", "");
		return usage.toString();

	}

	// parametrized appsee functions below

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeAnalysis1")
	@ResponseBody
	public String screens(Model model, @RequestParam("appId") String appId) {
		JSONObject screens = Appsee.getSessions("", "");
		return screens.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeUsage1")
	@ResponseBody
	public String usage1(Model model, @RequestParam("appId") String appId) {
		JSONObject usage = Appsee.getUsage("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeOS1")
	@ResponseBody
	public String os1(Model model, @RequestParam("appId") String appId) {
		JSONObject usage = Appsee.getOS("", "");
		return usage.toString();

	}

	/*
	 * @RequestMapping(value =
	 * "/digitalQAService/userExperienceTesting/inRoadsVersion")
	 * 
	 * @ResponseBody public String inRoadsVersion(Model
	 * model, @RequestParam("appId") String appId) { JSONObject usage =
	 * Appsee.getVersions("",""); return usage.toString();
	 * 
	 * }
	 */

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeEvent1")
	@ResponseBody
	public String eventsCount1(Model model, @RequestParam("appId") String appId) {
		JSONObject resolution = Appsee.getEvents();
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeScreen1")
	@ResponseBody
	public String Screen1(Model model, @RequestParam("appId") String appId) {
		JSONObject resolution = Appsee.getScreen();
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeConnectivity1")
	@ResponseBody
	public String Conectivity1(Model model, @RequestParam("appId") String appId) {
		JSONObject resolution = Appsee.getConnectivity("", "");
		return resolution.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeResolution1")
	@ResponseBody
	public String resolution1(Model model, @RequestParam("appId") String appId) {
		JSONObject usage = Appsee.getResolution("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeTU1")
	@ResponseBody
	public String topuser1(Model model, @RequestParam("appId") String appId) {
		JSONObject usage = Appsee.getTopuser("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/appseeCrash1")
	@ResponseBody
	public String crash1(Model model, @RequestParam("appId") String appIdSS) {
		JSONObject usage = Appsee.getCrash("", "");
		return usage.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/logDefect")
	@ResponseBody
	public String logDefect(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam("defectname") String defectName, @RequestParam("defectdescription") String defectDescription,
			@RequestParam("buildid") String buildId) {

		Defect defect = new Defect();
		defect.setDefectname(defectName);
		defect.setDefectdescription(defectDescription);
		defect.setBuildid(buildId);
		defect.setToolid("8");
		defect.setUserid((String) session.getAttribute("userid"));
		defect.setBuildid(buildId);
		defect.setProjectid((String) session.getAttribute("testcaseid"));

		if (digiQAService.logDefect(defect)) {
			DigiLoggerUtils.log("Deffect Added Successfully...", LEVEL.info, DigitalQAService.class);
			return "Deffect Added Successfully...";
		} else {
			DigiLoggerUtils.log("Error while adding a Deffect...", LEVEL.error, DigitalQAService.class);
			return "Error while adding a Deffect...";
		}

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/suggest")
	@ResponseBody
	public String suggest(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam("suggestion") String defectName, @RequestParam("suggestiondetail") String defectDescription,
			@RequestParam("buildid") String buildId) {

		Defect defect = new Defect();
		defect.setDefectname(defectName);
		defect.setDefectdescription(defectDescription);
		defect.setBuildid(buildId);
		defect.setToolid("8");
		defect.setUserid((String) session.getAttribute("userid"));
		defect.setBuildid(buildId);
		defect.setProjectid((String) session.getAttribute("testcaseid"));

		if (digiQAService.addSuggest(defect)) {
			DigiLoggerUtils.log("Suggestion Added Successfully...", LEVEL.info, DigitalQAService.class);
			return "Thanks for your Suggestion...";
		} else {
			DigiLoggerUtils.log("Error while adding a Suggestion...", LEVEL.error, DigitalQAService.class);
			return "Error while adding a Suggestion...";
		}

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/addTestCase")
	public String addTestCase(Model model, HttpSession session, @RequestParam("defectname") String defectName,
			@RequestParam("defectdescription") String defectDescription, @RequestParam("buildid") String buildId) {
		Defect defect = new Defect();
		defect.setDefectname(defectName);
		defect.setDefectdescription(defectDescription);
		defect.setBuildid(buildId);
		defect.setToolid("8");
		defect.setUserid((String) session.getAttribute("userid"));
		defect.setBuildid(buildId);
		defect.setProjectid((String) session.getAttribute("testcaseid"));

		if (digiQAService.logDefect(defect)) {
			DigiLoggerUtils.log("Deffect Added Successfully...", LEVEL.info, DigitalQAService.class);
		} else {
			DigiLoggerUtils.log("Error while adding a Deffect...", LEVEL.info, DigitalQAService.class);
		}
		return "/digitalQAService/userExperienceTesting/sentiment/detailReport";
	}
// error here
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/getCriticalReviews")
	@ResponseBody
	public String getCriticalReviews(Model model, @RequestParam("appId") String appId,
			@RequestParam("word") String word) {

		org.json.simple.JSONArray appReview = (org.json.simple.JSONArray) Appbot
				.getUserReviews("", appId, userReviewPath).get("results");
		org.json.simple.JSONArray filteredReviews = new org.json.simple.JSONArray();
		for (int i = 0; i < appReview.size(); i++) {
			org.json.simple.JSONObject currentReview = (org.json.simple.JSONObject) appReview.get(i);
			if (currentReview.get("body").toString().toLowerCase().matches(".*" + word.toLowerCase() + ".*")
					|| currentReview.get("subject").toString().toLowerCase()
							.matches(".*\\b" + word.toLowerCase() + "\\b.*")) {
				filteredReviews.add(currentReview);
			}
		}
		return filteredReviews.toString();
	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/getAllDevices")
	@ResponseBody
	public String getAllDevices(Model model, @RequestParam("os") String os, @RequestParam("version") String version) {
		JSONArray devices = null;
		try {
			devices = DeviceDetails.getSeetestDevices(os, version);
			System.out.println(devices);
			DigiLoggerUtils.log("SeeTest Devices:" + devices, LEVEL.info);

		} catch (IOException e) {
			DigiLoggerUtils.log("Error while getting SeeTest Cloud devices SeeTest Devices", LEVEL.warn);
		}
		return devices.toString();

	}

	@RequestMapping(value = "/digitalQAService/userExperienceTesting/reserveDevice")
	@ResponseBody
	public String reserveDevice(Model model, @RequestParam("deviceId") String deviceId) {
		String device = "";
		try {
			Date date = new Date();
			DeviceDetails.reserveSeetestDevice(deviceId, date, 2);

			DigiLoggerUtils.log("SeeTest Devices:" + device, LEVEL.info);

		} catch (IOException e) {
			DigiLoggerUtils.log("Error while getting SeeTest Cloud devices SeeTest Devices", LEVEL.warn);
		}
		return device;

	}

	@RequestMapping(value = "getSelectedReviews")
	public String allReviews(Model model, HttpSession session, @RequestParam("start-date") String startDate,
			@RequestParam("end-date") String endDate) {

		return "digitalQAService/userExperienceTesting/sentiment/detailReport";
	}

	/*@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/ratingTimeline")
	@ResponseBody
	public String ratingTimeline(Model model, @RequestParam("appId") String appId) {
		JSONObject ratingTimeLine = Appbot.ratingTimeLine("", appId);
		return ratingTimeLine.toString();
	}*/

	 @RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/ratingTimeline")
     @ResponseBody
     public String ratingTimeline(Model model, @RequestParam("appId") String appId) {
                    JSONObject ratingTimeLine = Appbot.ratingTimeLine("", appId);
                    return ratingTimeLine.toString();
     }
	 
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentimentAnalysis/recommendation")
	@ResponseBody
	public String recommendation(Model model, @RequestParam("appId") String appId) {
		org.json.simple.JSONObject recommendation = Appbot.getUserReviews("", appId, sentimentRecommendation);
		return recommendation.toString();
	}
	/*****************************chatbot for sentiment analysis *****************************/
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/Chatbotinput")
	 public void getInputfrombot4(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			  throws ServletException, IOException {
			    String inputmsg = request.getParameter("input");
			    System.out.println("input data is: "+inputmsg);
			  String userid= (String) session.getAttribute("userid");
			  String sessionid= session.toString();
				System.out.println("userid inside save input : "+ userid+ "session id is: "+sessionid);
			    loginService.saveuserinput(inputmsg, userid, sessionid);
			  
			  }
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/Chatbotoutput")
	 public void getOutputfrombot4(HttpServletRequest request, HttpServletResponse response,HttpSession session)
			  throws ServletException, IOException {
			    
			    String outputmsg = request.getParameter("output");
			    System.out.println("output data is: "+outputmsg);
			    String userid= (String) session.getAttribute("userid");
			    String sessionid= session.toString();
				System.out.println("userid inside save output : "+ userid);
			    loginService.savebotoutput(outputmsg, userid, sessionid);
			  }
	@RequestMapping(value = "/digitalQAService/userExperienceTesting/sentiment/chathistory")
	public String getchatfromdb4(HttpServletRequest request, HttpServletResponse response,HttpSession session) 
			throws ServletException, IOException, JSONException{
		
		String userid= (String) session.getAttribute("userid");
		 String sessionid= session.toString();
		System.out.println("userid inside getsender chat : "+ userid);
		
		ArrayList<Chat> userinput= loginService.getuserchat(userid, sessionid);//done
		System.out.println("entering bot chat fetching dao");
		ArrayList<Chat> botoutput= loginService.getbotchat(userid, sessionid);
		System.out.println("Collected bot chat adding into allchat list"); //successful
		ArrayList<Chat> allchat= new ArrayList<Chat>();
	
	
		allchat.addAll(userinput);
		//System.out.println("All chat(1): "+ allchat+ "size "+allchat.size());
		
		allchat.addAll(botoutput);
		response.setContentType("application/json");
		//System.out.println("All chat(2): "+ allchat +"size "+allchat.size());
		
		  JSONArray jsonArr= new JSONArray();
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
		    Collections.sort( jsonValues, new Comparator<JSONObject>() {
		     
		        private static final String KEY_NAME = "creation time";

		        @Override
		        public int compare(JSONObject a, JSONObject b) {
		            String valA = new String();
		            String valB = new String();

		            try {
						valA = (String) a.get(KEY_NAME);
						valB = (String) b.get(KEY_NAME);
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				

		            return valA.compareTo(valB);
		          
		        }
		    });

		    for (int i = 0; i < jsonArr.size(); i++) {
		    	
		        sortedJsonArray.add(jsonValues.get(i));
		    }
		   System.out.println("json chat: "+ sortedJsonArray.toString());
	request.setAttribute("history", sortedJsonArray);
   RequestDispatcher rd = request.getRequestDispatcher("demobot.jsp");
	    rd.forward(request,response);
		return  "demobot";
	}
/******************************************chatbot ends************************************************************/
}
