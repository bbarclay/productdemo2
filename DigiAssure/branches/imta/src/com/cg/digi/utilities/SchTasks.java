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

package com.cg.digi.utilities;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;

/**
 * @author  Harish Pemmasani
 *
 */
public class SchTasks {

	/**
	 * 
	 * @param taskName
	 * @param command
	 * @param startFolder
	 * @param scheduledDate
	 * @return
	 */
	
  private final static String SCHTAKS = "schtasks";

	public static void add(String taskName, String startFolder,
			Date scheduledDate) {
		/**
		 * Check scheduledDate has value or not 1. If it has value split the
		 * time stamp to date and time. 2. if scheduledDate is null - Get the
		 * current date and time and add +5 seconds to time
		 * 
		 * String command = command to create scheduler args = has 4 arguments
		 * 1. Schedule Count 2. /tn taskname specifies the name of the task 3.
		 * /tr task that should be scheduled to run 4. scheduled date- has /sd
		 * scheduled date and /st scheduled time
		 */
		try {
			DigiLoggerUtils.log("IN INPUT  SCHTASKS :: :: "+taskName+ "   "+"  "+startFolder+"    "+scheduledDate,LEVEL.info);
		CommandLine.Output output = 	CommandLine.run(SCHTAKS,  new String[]{"/create",
        "/sc", "once",
        "/tn", encode(taskName),
		    "/tr",  encode(startFolder),
        startArgs(scheduledDate)
      });
		DigiLoggerUtils.log("Add Scheduler in SCHTASKS :: :: "+output,LEVEL.info);
		} catch (Exception e) {
			DigiLoggerUtils.log("Unable to add task to Windows Scheduler "+e,LEVEL.error);
		}
	}

  private static String encode(String param) {
    final String QUOTE = "\"";
    if (param.contains("\""))
    	DigiLoggerUtils.log("Encoding of quote in param not supported: to be fixed"+param, LEVEL.error);
    return QUOTE + param + QUOTE;
  }

	private static String startArgs(Date dt) {
		if (dt == null) {
			dt = new Date(new Date().getTime() + 60000);
		}
		String date = new SimpleDateFormat("MM/dd/yyyy").format(dt);
		String time = new SimpleDateFormat("HH:mm:ss").format(dt);
		return "/sd " + date + " /st " + time + "";
	}

	/**
	 * 
	 * Delete requires taskName as param and deletes the particular task in
	 * windows scheduler
	 * 
	 * @param taskName
	 */
	public static boolean delete(String taskName) {

		/**
		 * Command = scheduler command to delete has 2 arguments to delete the
		 * command 1. args[0] = specify task name to be deleted 2. args[1] = /F
		 * indicates to delete forcefully
		 */
		String command = "SCHTASKS /Delete";
		CommandLine.Output output = CommandLine.run(command, new String[]{" /tn \"" + taskName + "\"", "/F"});
		if (output.equals("was successfully deleted"))
			return true;

		if (output.stdout
				.contains("system cannot find the file specified"))
			DigiLoggerUtils.log("Deleting task :: "+taskName+"Output :: "+output.stderr+""+output.stdout, LEVEL.info);
	return false;
	}

	/**
	 * Discussion required with Girisan Sir-->> Sometimes it shows access denied
	 * error -->>
	 * 
	 * @param taskName
	 * @param newStartAt
	 */
	public static boolean modify(String taskName, Date newStartAt,
			String startFolder) {
		//System.out.println("in schtasks modify:"+taskName+" "+startFolder+" "+newStartAt);
		if (!delete(taskName))
      return false;
		add(taskName, startFolder, newStartAt);
		return true;
	}

	/**
	 * @param taskName
	 * @return
	 */
	public static Map<String, String> get(String taskName) {
		// TODO
		// Return as a Map of { taskName, command:, startFolder, scheduleAt, status}  
		return null;

	}

}
