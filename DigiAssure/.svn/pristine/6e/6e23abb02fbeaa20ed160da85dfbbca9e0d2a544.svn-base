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

import java.util.List;

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
public interface IDigitalQAService {

	public Testcase addManualTestCases(Testcase testcase, String userid);

	public List<Testcase> getAllTestcases(String toolid);

	public int addTestcasestoBatch(String[] data, String batchid);

	public List<Batch> getAllAllocatedBatches(String userid);

	public List<Testcase> getAllocatedTestcasesToUser(String batchid);

	public boolean updateTestcaseResults(Testcase testcase, String userid,
			double passCount, double failCount, double total);

	public List<ExecutionResults> getExecutionResults(String batchid);

	public boolean logDefect(Defect defect);

	public boolean addSuggest(Defect defect);

	public List<Survey> getUsers(String surveyid);

	public List<Results> getResults(String surveyid);

	public List<Task> getTasks(String surveyid);

	public List<Question> getQuestions(String surveyid);

	public List<Results> getQuestionResults(String surveyid);

}
