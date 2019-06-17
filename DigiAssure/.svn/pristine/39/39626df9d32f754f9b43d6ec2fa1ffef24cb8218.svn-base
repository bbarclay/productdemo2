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
import java.util.List;

import com.cg.digi.model.Market;
import com.cg.digi.model.Run;
import com.google.gson.JsonObject;

/**
 * @author hapemmas
 *
 */
public interface IExecutionConsoleService {
	
	  /**
		  * Return all runs.
		  **/
			public List<Run> getRuns(String userid,String toolid);
			public Run addRun(Run run);
			public File getFinalRunPath(String projectName,
					String userName, String toolName,
					String continonusDeliveryHome, String runName);
			public String getScheduledStatus(String output);
			public String getToolNameToDownloadFramework(String toolName);
			public Run deleteRun(String runid);
			public boolean modifyRunStatus(String runName, String buildStatus);
			public long getTimeDifference(String time);
			public boolean checkRun(String runid);
			public boolean ModifyRun(Run run);
			public String getRunHome(int runid);
			public String getToolNameToDownloadReferenceFile(String toolName);
			


}
