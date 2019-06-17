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
 * @author smoolya
 *
 */
public class Defect {

	 private String defectid;
	 private String defectname;
	 private String defectdescription;
	 private String attachment;
	 private String toolid;
	 private String userid;
	 private String testcaseid;
	 private String projectid;
	 private String runid;
	 private String buildid;
	 private String toollanguageid;

	 public Defect() {
	}
	 
	 

	/**
	 * @param defectid
	 * @param defectname
	 * @param defectdescription
	 * @param attachment
	 * @param toolid
	 * @param userid
	 * @param testcaseid
	 * @param projectid
	 * @param runid
	 * @param buildid
	 * @param toollanguageid
	 */
	public Defect(String defectid, String defectname, String defectdescription,
			String attachment, String toolid, String userid, String testcaseid,
			String projectid, String runid, String buildid,
			String toollanguageid) {
		super();
		this.defectid = defectid;
		this.defectname = defectname;
		this.defectdescription = defectdescription;
		this.attachment = attachment;
		this.toolid = toolid;
		this.userid = userid;
		this.testcaseid = testcaseid;
		this.projectid = projectid;
		this.runid = runid;
		this.buildid = buildid;
		this.toollanguageid = toollanguageid;
	}



	/**
	 * @return
	 */
	public String getDefectid() {
		return defectid;
	}



	/**
	 * @param defectid
	 */
	public void setDefectid(String defectid) {
		this.defectid = defectid;
	}



	/**
	 * @return
	 */
	public String getDefectname() {
		return defectname;
	}



	/**
	 * @param defectname
	 */
	public void setDefectname(String defectname) {
		this.defectname = defectname;
	}



	/**
	 * @return
	 */
	public String getDefectdescription() {
		return defectdescription;
	}



	/**
	 * @param defectdescription
	 */
	public void setDefectdescription(String defectdescription) {
		this.defectdescription = defectdescription;
	}



	/**
	 * @return
	 */
	public String getAttachment() {
		return attachment;
	}



	/**
	 * @param attachment
	 */
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}



	/**
	 * @return
	 */
	public String getToolid() {
		return toolid;
	}



	/**
	 * @param toolid
	 */
	public void setToolid(String toolid) {
		this.toolid = toolid;
	}



	/**
	 * @return
	 */
	public String getUserid() {
		return userid;
	}



	/**
	 * @param userid
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}



	/**
	 * @return
	 */
	public String getTestcaseid() {
		return testcaseid;
	}



	/**
	 * @param testcaseid
	 */
	public void setTestcaseid(String testcaseid) {
		this.testcaseid = testcaseid;
	}



	/**
	 * @return
	 */
	public String getProjectid() {
		return projectid;
	}



	/**
	 * @param projectid
	 */
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}



	/**
	 * @return
	 */
	public String getRunid() {
		return runid;
	}



	/**
	 * @param runid
	 */
	public void setRunid(String runid) {
		this.runid = runid;
	}



	/**
	 * @return
	 */
	public String getBuildid() {
		return buildid;
	}



	/**
	 * @param buildid
	 */
	public void setBuildid(String buildid) {
		this.buildid = buildid;
	}



	/**
	 * @return
	 */
	public String getToollanguageid() {
		return toollanguageid;
	}



	/**
	 * @param toollanguageid
	 */
	public void setToollanguageid(String toollanguageid) {
		this.toollanguageid = toollanguageid;
	}



	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Defect [defectid=" + defectid + ", defectname=" + defectname
				+ ", defectdescription=" + defectdescription + ", attachment="
				+ attachment + ", toolid=" + toolid + ", userid=" + userid
				+ ", testcaseid=" + testcaseid + ", projectid=" + projectid
				+ ", runid=" + runid + ", buildid=" + buildid
				+ ", toollanguageid=" + toollanguageid + "]";
	}

	

 
	 
	 
	 
}
