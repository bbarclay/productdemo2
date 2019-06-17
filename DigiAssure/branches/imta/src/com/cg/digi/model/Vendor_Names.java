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

public class Vendor_Names {

	private  int vend_id;
	private  String vend_nm;
	private  String desc;
	
	public int getVend_id() {
		return vend_id;
	}
	public void setVend_id(int vend_id) {
		this.vend_id = vend_id;
	}
	public String getVend_nm() {
		return vend_nm;
	}
	public void setVend_nm(String vend_nm) {
		this.vend_nm = vend_nm;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Override
	public String toString() {
		return "Vendor_Names [vend_id=" + vend_id + ", vend_nm=" + vend_nm
				+ ", desc=" + desc + "]";
	}
	
}
