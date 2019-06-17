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

package com.cg.digi.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.cg.digi.dao.IExecutionConsoleDao;
import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Market;
import com.cg.digi.model.Run;
import com.cg.digi.model.VendorMarketTrend;
import com.cg.digi.utilities.CSVUtils;
import com.cg.digi.utilities.FileUtils;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @author hapemmas
 *
 */

@Component("executionConsoleService")
public class ExecutionConsoleServiceImpl implements IExecutionConsoleService {

	@Autowired
	IExecutionConsoleDao executionConsleDao;

	@Value("${cafeSeetestDownload}")
	String cafeSeetestDownload;

	@Value("${layoutTestingDownload}")
	String layoutTestingDownload;

	@Value("${cukesDigitalDownload}")
	String cukesDigitalDownload;

	@Value("${cafePerfectoDownload}")
	String cafePerfectoDownload;

	@Value("${cafeNeoloadDownload}")
	String cafeNeoloadDownload;

	@Value("${imtaFrameworkMaster}")
	String imtaFrameworkMaster;
	
	@Override
	public List<Run> getRuns(String projectid, String toolid) {
		DigiLoggerUtils.log("Run Details in Service Layer " + executionConsleDao.getRuns(projectid, toolid),
				LEVEL.info);
		return executionConsleDao.getRuns(projectid, toolid);
	}

	@Override
	public Run addRun(Run run) {
		return executionConsleDao.addRun(run);
	}

	@Override
	public File getFinalRunPath(String projectName, String userName, String toolName, String continonusDeliveryHome,
			String runName) {

		File runHome = new File(continonusDeliveryHome);
		if (!runHome.exists()) {
			runHome.mkdir();
			continonusDeliveryHome += "/" + projectName;
			runHome = new File(continonusDeliveryHome);
			runHome.mkdir();

			continonusDeliveryHome += "/" + userName;
			runHome = new File(continonusDeliveryHome);
			runHome.mkdir();
		} else {
			continonusDeliveryHome += "/" + projectName;
			runHome = new File(continonusDeliveryHome);
			if (!runHome.exists()) {
				runHome.mkdir();

			} else {
				continonusDeliveryHome += "/" + userName;
				runHome = new File(continonusDeliveryHome);
				if (!runHome.exists()) {
					runHome.mkdir();
				}
			}
		}

		if (!runHome.exists()) {
			runHome.mkdir();
			continonusDeliveryHome += "/" + toolName;
			runHome = new File(continonusDeliveryHome);
			runHome.mkdir();
		} else {
			continonusDeliveryHome += "/" + toolName;
			runHome = new File(continonusDeliveryHome);
			if (!runHome.exists()) {
				runHome.mkdir();
			}
			runHome = FileUtils.createFolder(runHome.getAbsolutePath(), runName);
		}
		DigiLoggerUtils.log("Run Home in Service Layer : " + runHome, LEVEL.info);
		return runHome;
	}

	@Override
	public String getScheduledStatus(String output) {
		String result = "No Run";

		try {
			if (output == null) {
				result = "No Run";
			}
			if (output.contains("------------------Start-------------------")) {
				result = "Started";
			}
			if (output.contains("Execution Completed")) {
				result = "Completed";
			}
			DigiLoggerUtils.log("Status of Result --->" + result, LEVEL.info);
		} catch (Exception e) {
			DigiLoggerUtils.log("Error in Validating Run Status :: " + e.getMessage(), LEVEL.error);
			result = "No Run";
		}
		return result;
	}

	@Override
	public String getToolNameToDownloadFramework(String toolName) {
		if (toolName.contains("CGAF_Usability")) {
			return cafeSeetestDownload;
		} else if (toolName.contains("CGAF_LayoutTesting")) {
			return layoutTestingDownload;
		} else if (toolName.contains("CGAF_Cucumber_Appium")) {
			return cukesDigitalDownload;
		} else if (toolName.contains("CGAF_Perfecto")) {
			return cafePerfectoDownload;
		} else if (toolName.contains("CGPF_Neoload")) {
			return cafeNeoloadDownload;
		}

		return cafeSeetestDownload;
	}

	@Override
	public String getToolNameToDownloadReferenceFile(String toolName) {
		if (toolName.contains("CGAF_Usability")) {
			return cafeSeetestDownload;
		} else if (toolName.contains("CGAF_LayoutTesting")) {
			return layoutTestingDownload;
		} else if (toolName.contains("CGAF_Cucumber_Appium")) {
			return cukesDigitalDownload;
		} else if (toolName.contains("CGAF_Perfecto")) {
			return cafePerfectoDownload;
		} else if (toolName.contains("CGPF_Neoload")) {
			return cafeNeoloadDownload;
		} else if (toolName.contains("IMTAFramework")) {
			return imtaFrameworkMaster;
		} else {
			return null;
		}
	}

	@Override
	public Run deleteRun(String runid) {
		return executionConsleDao.deleteRun(runid);
	}

	@Override
	public boolean modifyRunStatus(String runName, String buildStatus) {
		return executionConsleDao.modifyRunStatus(runName, buildStatus);
	}

	@Override
	public long getTimeDifference(String time) {
		System.out.println("time in service layer--- " + time);
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy hh:mm");

		Date selectedDate = null;
		Date todayDate = null;
		String date = sdf.format(new Date());
		long output = 0;
		try {
			selectedDate = sdf.parse(time);
			todayDate = sdf.parse(date);
			long diffInMiliSecond = selectedDate.getTime() - todayDate.getTime();
			long diffInSeconds = diffInMiliSecond / 1000;

			output = diffInSeconds;

		} catch (ParseException e) {
			System.out.println("Error While calculating difference " + e.getStackTrace());

		}
		return output;
	}

	@Override
	public boolean checkRun(String runid) {
		if (runid != null) {
			return executionConsleDao.checkRun(runid);
		} else {
			return false;
		}
	}

	@Override
	public boolean ModifyRun(Run run) {
		/*
		 * if(executionConsleDao.checkRun(run.getRunName())){ if(
		 * executionConsleDao.ModifyRun(run)){ return true; }else{ return false; } }
		 * return false;
		 */
		return executionConsleDao.ModifyRun(run);

	}

	public String getRunHome(int runid) {

		return executionConsleDao.getRunHome(runid);
	}

}
