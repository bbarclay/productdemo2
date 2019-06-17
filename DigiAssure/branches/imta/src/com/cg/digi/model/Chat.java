package com.cg.digi.model;
//created for chatbot
public class Chat {

 private String userid;
 private String botid;
 private String starttime;
 private String endtime;
 private String message;
 private String sender;
 private String sessionid;
 public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}

	 public Chat(String userid, String botid, String starttime, String endtime, String message, String sender, String sessionid) {
		super();
		this.userid = userid;
		this.botid = botid;
		this.starttime = starttime;
		this.endtime = endtime;
		this.message = message;
		this.sender = sender;
		this.sessionid= sessionid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getBotid() {
		return botid;
	}

	public void setBotid(String botid) {
		this.botid = botid;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	@Override
	public String toString() {
		return "Chat [userid=" + userid + ", botid=" + botid + ", starttime=" + starttime + ", endtime=" + endtime
				+ ", message=" + message + ", sender=" + sender + ", sessionid=" + sessionid + "]";
	}
 

 
}
