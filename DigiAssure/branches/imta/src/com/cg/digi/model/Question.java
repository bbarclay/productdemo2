package com.cg.digi.model;

public class Question {
	
	private String questionid;
	private String questionname;
	private String description;
	private String optionals;
	private String answers;
	private String createdby;
	private String creationtime;
	private String modifiedby;
	private String modifiedtime;
	private String surveyid;
	private String status;
	private String type;
	private String userid;
	
	 
	public Question() {
	}


	/**
	 * @return the questionid
	 */
	public String getQuestionid() {
		return questionid;
	}


	/**
	 * @param questionid the questionid to set
	 */
	public void setQuestionid(String questionid) {
		this.questionid = questionid;
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
	 * @return the questionname
	 */
	public String getQuestionname() {
		return questionname;
	}


	/**
	 * @param questionname the questionname to set
	 */
	public void setQuestionname(String questionname) {
		this.questionname = questionname;
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
	 * @return the optionals
	 */
	public String getOptionals() {
		return optionals;
	}


	/**
	 * @param optionals the optionals to set
	 */
	public void setOptionals(String optionals) {
		this.optionals = optionals;
	}


	/**
	 * @return the answers
	 */
	public String getAnswers() {
		return answers;
	}


	/**
	 * @param answers the answers to set
	 */
	public void setAnswers(String answers) {
		this.answers = answers;
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
	 * @return the surveyid
	 */
	public String getSurveyid() {
		return surveyid;
	}


	/**
	 * @param surveyid the surveyid to set
	 */
	public void setSurveyid(String surveyid) {
		this.surveyid = surveyid;
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
	 * @return the type
	 */
	public String getType() {
		return type;
	}


	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Question ["
				+ (questionid != null ? "questionid=" + questionid + ", " : "")
				+ (questionname != null ? "questionname=" + questionname + ", "
						: "")
				+ (description != null ? "description=" + description + ", "
						: "")
				+ (optionals != null ? "optionals=" + optionals + ", " : "")
				+ (answers != null ? "answers=" + answers + ", " : "")
				+ (createdby != null ? "createdby=" + createdby + ", " : "")
				+ (creationtime != null ? "creationtime=" + creationtime + ", "
						: "")
				+ (modifiedby != null ? "modifiedby=" + modifiedby + ", " : "")
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime + ", "
						: "")
				+ (surveyid != null ? "surveyid=" + surveyid + ", " : "")
				+ (status != null ? "status=" + status + ", " : "")
				+ (type != null ? "type=" + type : "") + "]";
	}

 
	
}
