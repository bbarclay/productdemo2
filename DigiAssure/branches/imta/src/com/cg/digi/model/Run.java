/**
 * 
 */
package com.cg.digi.model;


/**
 * @author hapemmas
 * Run POJO Class Containing details of Execution Console Run Details
 */
public class Run {
	

	private  String runid;	
	private  String runName;
	private  String runHome;
	private  String scheduledStatus; 
	private  String scheduledtime;
	private  String testAccessPath;
	private String runRemarks;
	private  String userid;
	private String projectid;

	private  String buildid;
	private String buildName;
	private String machineid;
	private String toolid;
	private String toollanguageid;
	
	private String createdBy;
	private String creationTime;
	private String modifiedBy;
	private String modifiedTime;
	
	private String status;
	private String scenarioName;
	
	public Run() {
	}




	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Run [runid=" + runid + ", runName=" + runName + ", runHome="
				+ runHome + ", scheduledStatus=" + scheduledStatus
				+ ", scheduledtime=" + scheduledtime + ", testAccessPath="
				+ testAccessPath + ", runRemarks=" + runRemarks + ", userid="
				+ userid + ", projectid=" + projectid + ", buildid=" + buildid
				+ ", machineid=" + machineid + ", toolid=" + toolid
				+ ", toollanguageid=" + toollanguageid + ", createdBy="
				+ createdBy + ", creationTime=" + creationTime
				+ ", modifiedBy=" + modifiedBy + ", modifiedTime="
				+ modifiedTime + ", status=" + status + "]";
	}




	public String getScenarioName() {
		return scenarioName;
	}




	public void setScenarioName(String scenarioName) {
		this.scenarioName = scenarioName;
	}




	/**
	 * @return the buildName
	 */
	public String getBuildName() {
		return buildName;
	}




	/**
	 * @param buildName the buildName to set
	 */
	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}




	/**
	 * @return the runid
	 */
	public String getRunid() {
		return runid;
	}


	/**
	 * @param runid the runid to set
	 */
	public void setRunid(String runid) {
		this.runid = runid;
	}


	/**
	 * @return the runName
	 */
	public String getRunName() {
		return runName;
	}
	/**
	 * @return the projectid
	 */
	public String getProjectid() {
		return projectid;
	}


	/**
	 * @param projectid the projectid to set
	 */
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}


	/**
	 * @param runName the runName to set
	 */
	public void setRunName(String runName) {
		this.runName = runName;
	}


	/**
	 * @return the runHome
	 */
	public String getRunHome() {
		return runHome;
	}


	/**
	 * @param runHome the runHome to set
	 */
	public void setRunHome(String runHome) {
		this.runHome = runHome;
	}


	/**
	 * @return the scheduledStatus
	 */
	public String getScheduledStatus() {
		return scheduledStatus;
	}


	/**
	 * @param scheduledStatus the scheduledStatus to set
	 */
	public void setScheduledStatus(String scheduledStatus) {
		this.scheduledStatus = scheduledStatus;
	}


	/**
	 * @return the scheduledtime
	 */
	public String getScheduledtime() {
		return scheduledtime;
	}


	/**
	 * @param scheduledtime the scheduledtime to set
	 */
	public void setScheduledtime(String scheduledtime) {
		this.scheduledtime = scheduledtime;
	}


	/**
	 * @return the testAccessPath
	 */
	public String getTestAccessPath() {
		return testAccessPath;
	}


	/**
	 * @param testAccessPath the testAccessPath to set
	 */
	public void setTestAccessPath(String testAccessPath) {
		this.testAccessPath = testAccessPath;
	}


	/**
	 * @return the runRemarks
	 */
	public String getRunRemarks() {
		return runRemarks;
	}


	/**
	 * @param runRemarks the runRemarks to set
	 */
	public void setRunRemarks(String runRemarks) {
		this.runRemarks = runRemarks;
	}


	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}


	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}


	/**
	 * @return the buildid
	 */
	public String getBuildid() {
		return buildid;
	}


	/**
	 * @param buildid the buildid to set
	 */
	public void setBuildid(String buildid) {
		this.buildid = buildid;
	}


	/**
	 * @return the machineid
	 */
	public String getMachineid() {
		return machineid;
	}


	/**
	 * @param machineid the machineid to set
	 */
	public void setMachineid(String machineid) {
		this.machineid = machineid;
	}


	/**
	 * @return the toolid
	 */
	public String getToolid() {
		return toolid;
	}


	/**
	 * @param toolid the toolid to set
	 */
	public void setToolid(String toolid) {
		this.toolid = toolid;
	}


	/**
	 * @return the toollanguageid
	 */
	public String getToollanguageid() {
		return toollanguageid;
	}


	/**
	 * @param toollanguageid the toollanguageid to set
	 */
	public void setToollanguageid(String toollanguageid) {
		this.toollanguageid = toollanguageid;
	}


	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}


	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	/**
	 * @return the creationTime
	 */
	public String getCreationTime() {
		return creationTime;
	}


	/**
	 * @param creationTime the creationTime to set
	 */
	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}


	/**
	 * @return the modifiedBy
	 */
	public String getModifiedBy() {
		return modifiedBy;
	}


	/**
	 * @param modifiedBy the modifiedBy to set
	 */
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}


	/**
	 * @return the modifiedTime
	 */
	public String getModifiedTime() {
		return modifiedTime;
	}


	/**
	 * @param modifiedTime the modifiedTime to set
	 */
	public void setModifiedTime(String modifiedTime) {
		this.modifiedTime = modifiedTime;
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


	
}
