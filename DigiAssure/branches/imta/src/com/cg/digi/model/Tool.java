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
public class Tool {

	
	//INSERT INTO `digiassure`.`tool` (`toolid`, `toolname`, `tooldescription`, `toolgroup`, `createdby`, `modifiedby`, `status`) VALUES ('2', 'dsfg', 'dsfds', 'sdf', '1', '1', 'Y');
	private String toolid;
	private String toolname;
	private String tooldescription;
	private String toolgroup;
	private String createdby;
	private String modifiedby;
	private String status;
	
	public Tool() {
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Tool ["
				+ (toolid != null ? "toolid=" + toolid + ", " : "")
				+ (toolname != null ? "toolname=" + toolname + ", " : "")
				+ (tooldescription != null ? "tooldescription="
						+ tooldescription + ", " : "")
				+ (toolgroup != null ? "toolgroup=" + toolgroup + ", " : "")
				+ (createdby != null ? "createdby=" + createdby + ", " : "")
				+ (modifiedby != null ? "modifiedby=" + modifiedby + ", " : "")
				+ (status != null ? "status=" + status + ", " : "")
				+ (getClass() != null ? "getClass()=" + getClass() + ", " : "")
				+ "hashCode()="
				+ hashCode()
				+ ", "
				+ (super.toString() != null ? "toString()=" + super.toString()
						: "") + "]";
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
	 * @return the toolname
	 */
	public String getToolname() {
		return toolname;
	}

	/**
	 * @param toolname the toolname to set
	 */
	public void setToolname(String toolname) {
		this.toolname = toolname;
	}

	/**
	 * @return the tooldescription
	 */
	public String getTooldescription() {
		return tooldescription;
	}

	/**
	 * @param tooldescription the tooldescription to set
	 */
	public void setTooldescription(String tooldescription) {
		this.tooldescription = tooldescription;
	}

	/**
	 * @return the toolgroup
	 */
	public String getToolgroup() {
		return toolgroup;
	}

	/**
	 * @param toolgroup the toolgroup to set
	 */
	public void setToolgroup(String toolgroup) {
		this.toolgroup = toolgroup;
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
