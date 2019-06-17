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

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Batch;
import com.cg.digi.model.Defect;
import com.cg.digi.model.ExecutionResults;
import com.cg.digi.model.Question;
import com.cg.digi.model.Results;
import com.cg.digi.model.Survey;
import com.cg.digi.model.Task;
import com.cg.digi.model.Testcase;

/**
 * @author hapemmas
 *
 */

@Component("digitalQADao")
public class DigitalQADaoImpl implements IDigitalQADao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Testcase addManualTestCases(Testcase testcase, String userid) {
		String query = "INSERT INTO manualchecklist_testcase(testcasename,testcasedescription,testcasedetaildescription,toolid,level,severity,priority,createdby,creationtime,status,category) VALUES (?,?,?,?,?,?,?,?,current_timestamp,'Y',?)";
		Object[] params = new Object[] { testcase.getTestcaseName(),
				testcase.getTestcasedescription(),
				testcase.getTestcasedetaildescription(), testcase.getToolid(),
				testcase.getLevel(), "NA", "NA", userid, testcase.getCategory() };
		int count = 0;
		try {
			count = jdbcTemplate.update(query, params);
		} catch (DataIntegrityViolationException dvIe) {
			DigiLoggerUtils
					.log("Error While Adding Manual Test case ::  High Values in column exccedding max limit of characters :: "
							+ dvIe.getMessage(), LEVEL.error);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error While Adding Manual Test case ::  Data Access Exception  :: "
							+ e.getMessage(), LEVEL.error);
		}
		if (count >= 1) {
			@SuppressWarnings("deprecation")
			int testcaseId = jdbcTemplate
					.queryForInt("SELECT MAX(testcaseid) FROM manualchecklist_testcase");
			testcase = getTestCase(testcaseId);
			DigiLoggerUtils
					.log("TestCase Manual Add Details in addManualTestCases(TestCase testcase, Userid) Dao :: "
							+ testcase + " Testcase id -->>" + testcaseId,
							LEVEL.info);
		}
		return testcase;
	}

	private Testcase getTestCase(int testcaseId) {
		Testcase testCase = null;
		String query = "SELECT * FROM manualchecklist_testcase WHERE testcaseid="
				+ testcaseId;
		try {
			testCase = jdbcTemplate.queryForObject(query,
					new BeanPropertyRowMapper<Testcase>(Testcase.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils
					.log("Error while getting added test case name :: in Dao :: getTestCase(int testcaseId) :: testcase id "
							+ testcaseId, LEVEL.info);
		}
		return testCase;
	}

	/**
	 * 
	 * @param testcaseId
	 * @return
	 */
	private Testcase getTestCasesToUser(int testcaseId, String batchid) {
		Testcase testCase = null;

		String query = "SELECT t.helpURL,t.testcaseid,t.testcasename, t.testcasedescription,t.level,t.category,r.tcstatus  FROM manualchecklist_testcase t,manual_testcaseresults r WHERE t.testcaseid=r.testcaseid and r.testcaseid="
				+ testcaseId + " and r.batchid=" + batchid;
		try {
			testCase = jdbcTemplate.queryForObject(query,
					new BeanPropertyRowMapper<Testcase>(Testcase.class));
		} catch (DataAccessException e) {
			DigiLoggerUtils
					.log("Error while getting added test case name :: in Dao :: getTestCase(int testcaseId) :: testcase id "
							+ testcaseId, LEVEL.info);
		}
		return testCase;
	}

	@Override
	public List<Testcase> getAllTestcases(String toolid) {
		List<Testcase> list = null;
		String query = "SELECT * FROM manualchecklist_testcase WHERE toolid="
				+ toolid;
		try {
			list = jdbcTemplate.query(query,
					new BeanPropertyRowMapper<Testcase>(Testcase.class));
			DigiLoggerUtils.log(
					"Data while getting testcases from database :: toolid : "
							+ toolid + ":: Values  :: " + list, LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while getting testcases from database :: toolid : "
							+ toolid + ":: Exception IS ::: " + e.getMessage(),
					LEVEL.error);
		}
		return list;
	}

	/**
	 * need to check already test case allocated to batch or not
	 */
	@Override
	public int addTestcasestoBatch(String[] data, String batchid) {

		String query = "INSERT INTO manual_testcaseresults(testcaseid, batchid,status,tcstatus) VALUES (?,?,'Y','NO RUN')";
		int[] output = null;
		try {
			output = jdbcTemplate.batchUpdate(query,
					new BatchPreparedStatementSetter() {

						@Override
						public void setValues(PreparedStatement ps, int tcid)
								throws SQLException {
							String testcaseid = data[tcid];
							ps.setString(1, testcaseid);
							ps.setString(2, batchid);
						}

						@Override
						public int getBatchSize() {
							return data.length;
						}
					});
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while inserting test cases to batch by Manager "
							+ e.getMessage(), LEVEL.error);
			e.printStackTrace();
		}
		return output.length;
	}

	@Override
	public List<Batch> getAllAllocatedBatches(String userid) {
		List<Batch> batches = null;
		String query = "SELECT b.batchid,b.batchname, b.remarks,t.toolname,b.allocatedUser,b.createdby,b.executionstatus,b.executionpercentage,u.username FROM manual_batch b, tool t, users u WHERE u.userid=b.createdby and b.toolid=t.toolid and allocatedUser="
				+ userid;
		try {
			batches = jdbcTemplate.query(query,
					new BeanPropertyRowMapper<Batch>(Batch.class));
			DigiLoggerUtils.log(
					"Data while getting allocated Bacthes  from database :: batchid : "
							+ userid + ":: Values are :: " + batches,
					LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while getting allocated batches from database :: batchid : "
							+ userid + ":: Exception IS :: " + e.getMessage(),
					LEVEL.error);
		}
		return batches;
	}

	@Override
	public List<Testcase> getAllocatedTestcasesToUser(String batchid) {
		List<Testcase> testcases = null;
		List<Testcase> testcaseVales = new ArrayList<Testcase>();
		String query = "SELECT DISTINCT testcaseid FROM manual_testcaseresults WHERE batchid="
				+ batchid;
		try {
			testcases = jdbcTemplate.query(query,
					new BeanPropertyRowMapper<Testcase>(Testcase.class));
			DigiLoggerUtils.log(
					"Data while getting allocated testcases  from database :: batchid : "
							+ batchid + ":: Values are ::: " + testcases,
					LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while getting allocated testcases from database :: batchid : "
							+ batchid + ":: Exception :: " + e.getMessage(),
					LEVEL.error);
			return testcaseVales;
		}
		if (!testcases.isEmpty()) {
			for (Testcase testcase : testcases) {
				testcaseVales.add(getTestCasesToUser(
						Integer.parseInt(testcase.getTestcaseid()), batchid));
			}
		}
		return testcaseVales;
	}

	@Override
	public boolean updateTestcaseResults(Testcase testcase, String userid,
			double passCount, double failCount, double total) {

		String[] tcid = testcase.getTestcaseid().split(",");
		String[] batchid = testcase.getBatchid().split(",");

		String query = "UPDATE manual_testcaseresults SET tcstatus=?, comments=?, modifiedby=?, modifiedtime=current_timestamp WHERE testcaseid=? and batchid=?";

		int[] output = jdbcTemplate.batchUpdate(query,
				new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int ii)
							throws SQLException {
						try {
							ps.setString(1,
									testcase.getTcstatus().split(",")[ii]);
							ps.setString(2,
									testcase.getComments().split(",")[ii]);
							ps.setString(3, userid);
							ps.setString(4,
									testcase.getTestcaseid().split(",")[ii]);
							ps.setString(5,
									testcase.getBatchid().split(",")[ii]);
							/*
							 * System.out.println("Query for update --->"+query+
							 * "prepare-->"+ps.toString());
							 */
							System.out.println("TC Status --->"
									+ testcase.getTcstatus().split(",")[ii]);
						} catch (Exception e) {
							DigiLoggerUtils.log(
									"Error while preaparing statement for batch updates"
											+ e.getMessage(), LEVEL.info);
						}
					}

					@Override
					public int getBatchSize() {
						return tcid.length;
					}
				});
		System.out.println(output.length);
		/*
		 * System.out.println(output.length); System.out.println(output[0]);
		 * System.out.println(output[1]);
		 */
		if (output.length >= 1) {

			String batchUpdateQuery = "UPDATE manual_batch SET modifiedby=?, modifiedTime=current_timestamp, executionstatus=?, executionpercentage=? , totalcount=?, passedcount=?, failedcount=? WHERE batchid=?";
			String[] exec = calculations(total, passCount, failCount);
			Object[] params = new Object[] { userid, exec[0], exec[1], total,
					passCount, failCount, batchid[0] };

			int batchUpdateOutput = 0;
			try {
				batchUpdateOutput = jdbcTemplate.update(batchUpdateQuery,
						params);
			} catch (DataAccessException e) {
				DigiLoggerUtils.log(
						"Error : !! :: While updating batch result after updating test case result -->"
								+ e.getStackTrace(), LEVEL.info);
			}
			if (batchUpdateOutput >= 1) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	// method to calculate percentages
	private String[] calculations(double total, double passCount,
			double failCount) {
		String executionstatus = " ";
		double progress = (double) (((passCount + failCount) / total) * 100);
		Math.floor(progress);
		if (progress == 0.0) {
			executionstatus = "No Run";
		}
		if (progress >= 1.0) {
			executionstatus = "In Progress";
		}
		if (progress >= 100.0) {
			executionstatus = "Completed";
		}
		System.out.println(executionstatus);
		return new String[] { executionstatus, progress + " %" };
	}

	@Override
	public List<ExecutionResults> getExecutionResults(String batchid) {
		List<ExecutionResults> list = null;
		String query = "SELECT  r.batchid,b.batchname,r.testcaseid,t.testcasename,r.tcstatus,r.comments,u.username FROM manual_batch b, manualchecklist_testcase t, manual_testcaseresults r, users u WHERE b.batchid=r.batchid AND t.testcaseid = r.testcaseid AND u.userid =r.modifiedby AND r.status ='Y' AND r.batchid="
				+ batchid;
		try {
			list = jdbcTemplate.query(query,
					new BeanPropertyRowMapper<ExecutionResults>(
							ExecutionResults.class));
			DigiLoggerUtils.log(
					"Data while getting testcases execution results from database :: build : "
							+ batchid + ":: Values are :: " + list, LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while getting execution results from database :: build : "
							+ batchid + ":: Exception IS :: " + e.getMessage(),
					LEVEL.error);
		}
		return list;
	}

	@Override
	public boolean logDefect(Defect defect) {
		String query = "INSERT INTO defect(defectname,defectdescription,attachment,toolid,userid,testcaseid,projectid,runid,buildid,toollanguageid) VALUES (?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] {
			defect.getDefectname(),
			defect.getDefectdescription(),
			defect.getAttachment(),
			defect.getToolid(),defect.getUserid(),
			defect.getTestcaseid(),
			defect.getProjectid(),
			defect.getRunid(),
			defect.getBuildid(),
			defect.getToollanguageid()
		};
		int count = 0;
		try {
			count = jdbcTemplate.update(query, params);
		} catch (DataIntegrityViolationException dvIe) {
			DigiLoggerUtils
					.log("Error While Adding the defect ::  High Values in column exccedding max limit of characters :: "
							+ dvIe.getMessage(), LEVEL.error);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error While Adding the defect ::  Data Access Exception  :: "
							+ e.getMessage(), LEVEL.error);
		}
		if(count>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean addSuggest(Defect defect) {
		String query = "INSERT INTO suggestion(suggestion,suggestiondetail,attachment,toolid,userid,testcaseid,projectid,runid,buildid,toollanguageid) VALUES (?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] {
			defect.getDefectname(),
			defect.getDefectdescription(),
			defect.getAttachment(),
			defect.getToolid(),defect.getUserid(),
			defect.getTestcaseid(),
			defect.getProjectid(),
			defect.getRunid(),
			defect.getBuildid(),
			defect.getToollanguageid()
		};
		int count = 0;
		try {
			count = jdbcTemplate.update(query, params);
		} catch (DataIntegrityViolationException dvIe) {
			DigiLoggerUtils
					.log("Error While Adding the Suggest ::  High Values in column exccedding max limit of characters :: "
							+ dvIe.getMessage(), LEVEL.error);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error While Adding the Suggest ::  Data Access Exception  :: "
							+ e.getMessage(), LEVEL.error);
		}
		if(count>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Survey> getUsers(String surveyid) {
		List<Survey> survetdetails=null;
		String query = "SELECT  * FROM feedback.surveydetails WHERE surveyid="+surveyid;
		try {
			survetdetails = jdbcTemplate.query(query, new BeanPropertyRowMapper<Survey>(Survey.class));
		}
		catch (DataIntegrityViolationException dvIe) {
			System.out.println("====1"+dvIe.getMessage());
		
		} catch (DataAccessException e) {
			System.out.println("============"+e.getMessage());
			
		}
		return survetdetails;
	}

	@Override
	public List<Results> getResults(String surveyid) {
		List<Results> result=null;
		String query = "SELECT * FROM feedback.surveyresults WHERE actionid IN(SELECT questionid FROM feedback.surveyquestions WHERE surveyid="+surveyid+") and flag='Q' UNION SELECT * FROM feedback.surveyresults WHERE actionid IN( SELECT taskid FROM feedback.surveytask WHERE surveyid="+surveyid+") and flag='T'";
		//String query = "SELECT count( DISTINCT(useremail) ) FROM surveyresults WHERE actionid = (SELECT t.taskid,q.questionid FROM surveytask t,surveyquestions q WHERE t.taskid=q.surveyid)";
		try {
			result =jdbcTemplate.query(query, new BeanPropertyRowMapper<Results>(Results.class));
		}
		catch (DataIntegrityViolationException dvIe) {
			System.out.println(dvIe.getMessage());
		
		} catch (DataAccessException e) {
			System.out.println(e.getMessage());
			
		}
		return result;
	}

	@Override
	public List<Task> getTasks(String surveyid) {
		List<Task> taskname = null;
		
		String query = "SELECT * FROM feedback.surveytask WHERE surveyid="+surveyid;

		try {
			
			taskname = jdbcTemplate.query(query, new BeanPropertyRowMapper<Task>(Task.class));
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return taskname;
	}

	@Override
	public List<Question> getQuestions(String surveyid) {
		List<Question> question = null;
		String query = "SELECT questionid,questionname,answers FROM feedback.surveyquestions WHERE surveyid="+surveyid;

		try {
			
			question = jdbcTemplate.query(query, new BeanPropertyRowMapper<Question>(Question.class));
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return question;
	}
	
	@Override
	public List<Results> getQuestionResults(String surveyid) {
	       List<Results> results = null;
	       
	       String query = "SELECT * FROM feedback.surveyresults WHERE flag='Q'";

	       try {
	              
	              results = jdbcTemplate.query(query, new BeanPropertyRowMapper<Results>(Results.class));
	       } catch (DataAccessException e) {
	              e.printStackTrace();
	       }
	       
	       System.out.println("in dao====="+results);
	       return results;
	}

}
