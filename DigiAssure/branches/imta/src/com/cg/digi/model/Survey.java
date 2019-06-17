package com.cg.digi.model;

public class Survey {

	private String surveyid;
	private String surveyname;
	private String projectid;
	private String totalusers;
	private String workingtitle;
	private String createdby;
	private String creationtime;
	private String modifiedby;
	private String modifiedtime;
	private String status;
	private String description;
	private String introductiontext;
	private String thankyoutext;
	private String completionurl;
	private String targetemails;
	private String userid;

	
	 public Survey() {
	}


	/**
	 * @return the surveyid
	 */
	public String getSurveyid() {
		return surveyid;
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
	 * @param surveyid the surveyid to set
	 */
	public void setSurveyid(String surveyid) {
		this.surveyid = surveyid;
	}


	/**
	 * @return the surveyname
	 */
	public String getSurveyname() {
		return surveyname;
	}


	/**
	 * @param surveyname the surveyname to set
	 */
	public void setSurveyname(String surveyname) {
		this.surveyname = surveyname;
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
	 * @return the totalusers
	 */
	public String getTotalusers() {
		return totalusers;
	}


	/**
	 * @param totalusers the totalusers to set
	 */
	public void setTotalusers(String totalusers) {
		this.totalusers = totalusers;
	}


	/**
	 * @return the workingtitle
	 */
	public String getWorkingtitle() {
		return workingtitle;
	}


	/**
	 * @param workingtitle the workingtitle to set
	 */
	public void setWorkingtitle(String workingtitle) {
		this.workingtitle = workingtitle;
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}


	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}


	 


	/**
	 * @return the thankyoutext
	 */
	public String getThankyoutext() {
		return thankyoutext;
	}


	/**
	 * @param thankyoutext the thankyoutext to set
	 */
	public void setThankyoutext(String thankyoutext) {
		this.thankyoutext = thankyoutext;
	}


	/**
	 * @return the completionurl
	 */
	public String getCompletionurl() {
		return completionurl;
	}


	/**
	 * @param completionurl the completionurl to set
	 */
	public void setCompletionurl(String completionurl) {
		this.completionurl = completionurl;
	}


	/**
	 * @return the targetemails
	 */
	public String getTargetemails() {
		return targetemails;
	}


	/**
	 * @param targetemails the targetemails to set
	 */
	public void setTargetemails(String targetemails) {
		this.targetemails = targetemails;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Survey ["
				+ (surveyid != null ? "surveyid=" + surveyid + ", " : "")
				+ (surveyname != null ? "surveyname=" + surveyname + ", " : "")
				+ (projectid != null ? "projectid=" + projectid + ", " : "")
				+ (totalusers != null ? "totalusers=" + totalusers + ", " : "")
				+ (workingtitle != null ? "workingtitle=" + workingtitle + ", "
						: "")
				+ (createdby != null ? "createdby=" + createdby + ", " : "")
				+ (creationtime != null ? "creationtime=" + creationtime + ", "
						: "")
				+ (modifiedby != null ? "modifiedby=" + modifiedby + ", " : "")
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime + ", "
						: "")
				+ (status != null ? "status=" + status + ", " : "")
				+ (description != null ? "description=" + description + ", "
						: "")
				+ (introductiontext != null ? "introductiontext="
						+ introductiontext + ", " : "")
				+ (thankyoutext != null ? "thankyoutext=" + thankyoutext + ", "
						: "")
				+ (completionurl != null ? "completionurl=" + completionurl
						+ ", " : "")
				+ (targetemails != null ? "targetemails=" + targetemails + ", "
						: "") + (userid != null ? "userid=" + userid : "")
				+ "]";
	}


	/**
	 * @return the introductiontext
	 */
	public String getIntroductiontext() {
		return introductiontext;
	}


	/**
	 * @param introductiontext the introductiontext to set
	 */
	public void setIntroductiontext(String introductiontext) {
		this.introductiontext = introductiontext;
	}


	 
	 
	 
	 
}
