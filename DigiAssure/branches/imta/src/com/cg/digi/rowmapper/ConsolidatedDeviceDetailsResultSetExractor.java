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

package com.cg.digi.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.cg.digi.model.Consolidate_Details;

public class ConsolidatedDeviceDetailsResultSetExractor implements
		ResultSetExtractor{

	@Override
	public Object extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		Consolidate_Details consolidate = new Consolidate_Details();
		
		consolidate.setSr_no(Integer.parseInt(resultSet.getString("Sr_No")));
		consolidate.setVend_no(Integer.parseInt(resultSet.getString("Vendor_ID")));		
		consolidate.setOs_no(Integer.parseInt(resultSet.getString("OS_ID")));
		consolidate.setVer_no(Integer.parseInt(resultSet.getString("Version_ID")));
		consolidate.setVer_name(resultSet.getString("Version_Name"));
		consolidate.setDev_name(resultSet.getString("Model_name"));
		consolidate.setTp(resultSet.getString("Type"));
		consolidate.setResol(resultSet.getString("Resolution"));

		
		return consolidate;
	}

}
