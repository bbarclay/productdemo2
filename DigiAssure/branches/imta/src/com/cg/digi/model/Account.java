package com.cg.digi.model;

public class Account {
	private String accountId;
	private String accountName;
	private String accountDescription;
	private String createdBy;
	private String creationTime;
	private String modifiedBy;
	private String modifiedTime;
	private String status;
	public Account(){}
	public Account(String accountId, String accountName, String accountDescription, String createdBy,
			String creationTime, String modifiedBy, String modifiedTime, String status) {
		super();
		this.accountId = accountId;
		this.accountName = accountName;
		this.accountDescription = accountDescription;
		this.createdBy = createdBy;
		this.creationTime = creationTime;
		this.modifiedBy = modifiedBy;
		this.modifiedTime = modifiedTime;
		this.status = status;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountDescription() {
		return accountDescription;
	}
	public void setAccountDescription(String accountDescription) {
		this.accountDescription = accountDescription;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreationTime() {
		return creationTime;
	}
	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public String getModifiedTime() {
		return modifiedTime;
	}
	public void setModifiedTime(String modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", accountName=" + accountName + ", accountDescription="
				+ accountDescription + ", createdBy=" + createdBy + ", creationTime=" + creationTime + ", modifiedBy="
				+ modifiedBy + ", modifiedTime=" + modifiedTime + ", status=" + status + "]";
	}
	
	

}
