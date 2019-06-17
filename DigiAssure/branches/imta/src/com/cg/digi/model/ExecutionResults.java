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

package com.cg.digi.model;

/**
 * @author hapemmas
 *
 */
public class ExecutionResults {

	
	private String testcaseresultsid;
	private String testcaseid;
	private String testcasename;
	private String batchid;
	private String batchname;
	private String tcstatus;
	private String comments;
	private String createdby;
	private String creationtime;
	private String modifiedby;
	private String username;
	private String modifiedtime;
	private String status;
	
 
	public  ExecutionResults() {
	}


	/**
	 * @return the testcaseresultsid
	 */
	public String getTestcaseresultsid() {
		return testcaseresultsid;
	}


	/**
	 * @param testcaseresultsid the testcaseresultsid to set
	 */
	public void setTestcaseresultsid(String testcaseresultsid) {
		this.testcaseresultsid = testcaseresultsid;
	}


	/**
	 * @return the testcaseid
	 */
	public String getTestcaseid() {
		return testcaseid;
	}


	/**
	 * @param testcaseid the testcaseid to set
	 */
	public void setTestcaseid(String testcaseid) {
		this.testcaseid = testcaseid;
	}


	/**
	 * @return the batchid
	 */
	public String getBatchid() {
		return batchid;
	}


	/**
	 * @param batchid the batchid to set
	 */
	public void setBatchid(String batchid) {
		this.batchid = batchid;
	}


	/**
	 * @return the tcstatus
	 */
	public String getTcstatus() {
		return tcstatus;
	}


	/**
	 * @param tcstatus the tcstatus to set
	 */
	public void setTcstatus(String tcstatus) {
		this.tcstatus = tcstatus;
	}


	/**
	 * @return the comments
	 */
	public String getComments() {
		return comments;
	}


	/**
	 * @param comments the comments to set
	 */
	public void setComments(String comments) {
		this.comments = comments;
	}


	/**
	 * @return the createdby
	 */
	public String getCreatedby() {
		return createdby;
	}


	/**
	 * @param createdby the createdby to set
	 */
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}


	/**
	 * @return the creationtime
	 */
	public String getCreationtime() {
		return creationtime;
	}


	/**
	 * @param creationtime the creationtime to set
	 */
	public void setCreationtime(String creationtime) {
		this.creationtime = creationtime;
	}


	/**
	 * @return the modifiedby
	 */
	public String getModifiedby() {
		return modifiedby;
	}


	/**
	 * @param modifiedby the modifiedby to set
	 */
	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}


	/**
	 * @return the modifiedtime
	 */
	public String getModifiedtime() {
		return modifiedtime;
	}


	/**
	 * @param modifiedtime the modifiedtime to set
	 */
	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}


	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}


	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * @return the testcasename
	 */
	public String getTestcasename() {
		return testcasename;
	}


	/**
	 * @param testcasename the testcasename to set
	 */
	public void setTestcasename(String testcasename) {
		this.testcasename = testcasename;
	}


	/**
	 * @return the batchname
	 */
	public String getBatchname() {
		return batchname;
	}


	/**
	 * @param batchname the batchname to set
	 */
	public void setBatchname(String batchname) {
		this.batchname = batchname;
	}


	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}


	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ExecutionResults ["
				+ (testcaseresultsid != null ? "testcaseresultsid="
						+ testcaseresultsid + ", " : "")
				+ (testcaseid != null ? "testcaseid=" + testcaseid + ", " : "")
				+ (testcasename != null ? "testcasename=" + testcasename + ", "
						: "")
				+ (batchid != null ? "batchid=" + batchid + ", " : "")
				+ (batchname != null ? "batchname=" + batchname + ", " : "")
				+ (tcstatus != null ? "tcstatus=" + tcstatus + ", " : "")
				+ (comments != null ? "comments=" + comments + ", " : "")
				+ (createdby != null ? "createdby=" + createdby + ", " : "")
				+ (creationtime != null ? "creationtime=" + creationtime + ", "
						: "")
				+ (modifiedby != null ? "modifiedby=" + modifiedby + ", " : "")
				+ (username != null ? "username=" + username + ", " : "")
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime + ", "
						: "")
				+ (status != null ? "status=" + status + ", " : "")
				+ (getTestcaseresultsid() != null ? "getTestcaseresultsid()="
						+ getTestcaseresultsid() + ", " : "")
				+ (getTestcaseid() != null ? "getTestcaseid()="
						+ getTestcaseid() + ", " : "")
				+ (getBatchid() != null ? "getBatchid()=" + getBatchid() + ", "
						: "")
				+ (getTcstatus() != null ? "getTcstatus()=" + getTcstatus()
						+ ", " : "")
				+ (getComments() != null ? "getComments()=" + getComments()
						+ ", " : "")
				+ (getCreatedby() != null ? "getCreatedby()=" + getCreatedby()
						+ ", " : "")
				+ (getCreationtime() != null ? "getCreationtime()="
						+ getCreationtime() + ", " : "")
				+ (getModifiedby() != null ? "getModifiedby()="
						+ getModifiedby() + ", " : "")
				+ (getModifiedtime() != null ? "getModifiedtime()="
						+ getModifiedtime() + ", " : "")
				+ (getStatus() != null ? "getStatus()=" + getStatus() + ", "
						: "")
				+ (getTestcasename() != null ? "getTestcasename()="
						+ getTestcasename() + ", " : "")
				+ (getBatchname() != null ? "getBatchname()=" + getBatchname()
						+ ", " : "")
				+ (getUsername() != null ? "getUsername()=" + getUsername()
						+ ", " : "")
				+ (getClass() != null ? "getClass()=" + getClass() + ", " : "")
				+ "hashCode()="
				+ hashCode()
				+ ", "
				+ (super.toString() != null ? "toString()=" + super.toString()
						: "") + "]";
	}


 
	
	
	
}
