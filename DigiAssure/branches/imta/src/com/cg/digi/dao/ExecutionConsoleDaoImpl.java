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

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Run;

/**
 * @author hapemmas
 *
 */
@Component("executionConsleDao")
public class ExecutionConsoleDaoImpl implements IExecutionConsoleDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@SuppressWarnings("deprecation")
	@Override
	public Run addRun(Run run) {
		int result = 0;
		String query = "INSERT INTO runs(runname,runsremarks,buildid,toolid,scheduledtime,scheduledstatus,toollanguageid,createdby,creationtime,status,runhome,userid) VALUES (?,?,?,?,?,?,?,?,current_time,?,?,?)";
		Object[] params = new Object[] {run.getRunName(), run.getRunRemarks(), run.getBuildid(), run.getToolid(),
				run.getScheduledtime(), run.getScheduledStatus(), run.getToollanguageid(), run.getUserid(), "Y",
				run.getRunHome(), run.getUserid() };
		try {
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error in addRun(Run run) Dao :: " + e.getMessage(), LEVEL.error);
			jdbcTemplate.update("rollback");
		}

		try {
			if (result >= 1) {
				int runid = jdbcTemplate.queryForInt("SELECT MAX(runid) FROM runs");
				run = getRun(runid);
				DigiLoggerUtils.log("Run Details in addRun(Run run) Dao :: " + runid + " runid -->>" + run, LEVEL.info);
			} else {
				run = new Run();
				DigiLoggerUtils.log("Run Details in addRun(Run run) Dao :At Error Null: " + run, LEVEL.info);
				return run;
			}
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error in addRun(Run run) Dao :: " + e.getMessage(), LEVEL.error);
		}
		return run;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Run> getRuns(String projectid, String toolid) {
		System.out.println("execution Dao project id: "+ projectid+ " ,toolid: "+toolid);
		String query = "SELECT r.runid,r.runname,r.runsremarks,r.scheduledStatus,r.creationTime,b.buildname,t.toolname,r.scheduledtime,r.createdby,r.creationtime,r.modifiedby,r.modifiedtime,r.status,r.runhome,r.userid from runs r,builds b, tool t WHERE userid IN (select userid from users where projectid = '"
				+ projectid + "' and status = 'Y' )   and r.toolid =" + toolid
				+ " and r.toolid = t.toolid and r.buildid = b.buildid and r.status = 'Y' ";
		List<Run> runs = null;
		try {
			runs = jdbcTemplate.query(query, new BeanPropertyRowMapper(Run.class));
			DigiLoggerUtils.log("Run details in Dao loginValidation() : " + runs, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getRuns() :: " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getRuns() :: " + e, LEVEL.error);
		}
		System.out.println("Execution Dao: "+runs);
		return runs;
	}

	@Override
	public boolean ModifyRun(Run run) {
		System.out.println("Sche time(modify run, exec dao): "+run.getScheduledtime());
		int out = 0;
		String query = "UPDATE runs SET runname=?,runsremarks=?,buildid=?,toolid=?,scheduledtime=?,scheduledstatus=?,toollanguageid=?,modifiedby=?,status=?,runhome=?,userid=?,modifiedtime=current_time WHERE runid=?";
		Object[] params = new Object[] { run.getRunName(), run.getRunRemarks(), run.getBuildid(), run.getToolid(),
				run.getScheduledtime(), run.getScheduledStatus(), run.getToollanguageid(), run.getUserid(), "Y",
				run.getRunHome(), run.getUserid(), run.getRunid() };
		try {
			out = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
			DigiLoggerUtils.log(
					"Error in ModifyRun :: run name " + run.getRunName() + ":Exception Message: " + e.getStackTrace(),
					LEVEL.error);
		}
		if (out >= 1) {
			return true;
		}
		return false;
	}

	public Run getRun(int runid) {
		String query = "SELECT * from runs WHERE runid=" + runid;
		Run runs = null;

		try {
			runs = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<Run>(Run.class));
			DigiLoggerUtils.log("Run details in Dao getRun() :based on latest update Runid::  " + runs, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getRuns() : " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getRuns() : " + e, LEVEL.error);
		}
		return runs;
	}

	@SuppressWarnings("deprecation")
	public boolean checkRun(String runId) {

		int count = 0;
		boolean flag = false;
		try {
			String query = "SELECT COUNT(*) from runs where runid='" + runId + "'";
			count = jdbcTemplate.queryForInt(query);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in checkRun() : " + e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in checkRun() : " + e, LEVEL.error);
		}
		if (count > 0) {
			flag = true;
		}
		return flag;

	}

	@Override
	public Run deleteRun(String runid) {
		int out = 0;
		Run run = null;
		try {
			out = jdbcTemplate.update("UPDATE runs SET status='N' WHERE runid=" + runid);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while delteing run :: run id " + runid + ":Exception Message " + e.getStackTrace(),
					LEVEL.error);
		}
		if (out >= 1) {
			run = getRun(Integer.parseInt(runid));
			return run;
		}
		return run;
	}

	@Override
	public boolean modifyRunStatus(String runName, String buildStatus) {
		//System.out.println("buildstatus(execdao): "+buildStatus);
		int out = 0;
		try {
			out = jdbcTemplate.update("UPDATE runs SET scheduledStatus='" + buildStatus + "' WHERE runname='" + runName
					+ "' AND status='Y'");
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Error while updating run status:: run name :" + runName + " Run Status: " + buildStatus
					+ ":Exception Message:: " + e.getMessage(), LEVEL.error);
		}
		if (out > 0) {
			return true;
		} else {
			return false;
		}
	}

	public String getRunHome(int runid) {

		String query = "SELECT runhome FROM runs WHERE runid=?";
		Object[] inputs = new Object[] { runid };
		String runHome = jdbcTemplate.queryForObject(query, inputs, String.class);
		return runHome;

	}

}
