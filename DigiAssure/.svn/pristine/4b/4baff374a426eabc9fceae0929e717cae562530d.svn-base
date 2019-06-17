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

package com.cg.digi.dao;

import java.util.List;

import com.cg.digi.model.Run;

/**
 * @author hapemmas
 *Interface Contains implementation methods of Functionalities that includes execution console
 */
public interface IExecutionConsoleDao {
	
	// RUN CONFIGURATIONS 
	  /**
	  * Add run. Should return updated Run object
	  * If exists, then null is returned
	  **/
		public Run addRun(Run run);

	  /**
	  * Return all runs.
	  **/
		public List<Run> getRuns(String userid, String toolid);

		/**
		  * modify a run.
		  **/
		public boolean ModifyRun(Run run);

		public Run deleteRun(String runid);

		public boolean modifyRunStatus(String runName, String buildStatus);

		public boolean checkRun(String runid);
	 
		public String getRunHome(int runid);
}
