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
import com.cg.digi.model.ORSheetDetails;

/**
 * @author hp818661
 *
 */

@SuppressWarnings("rawtypes")
public class ORSheetDetailsResultSetExtractor implements
		ResultSetExtractor {

	@Override
	public Object extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		ORSheetDetails orSheetDetails = new ORSheetDetails();
		
		orSheetDetails.setOrSheetId(resultSet.getString("orsheetid"));
		orSheetDetails.setOrSheetName(resultSet.getString("orsheetname"));
		orSheetDetails.setUserid(resultSet.getString("userid"));
		orSheetDetails.setOrSheetDescription(resultSet.getString("description"));
		orSheetDetails.setProjectName(resultSet.getString("ProjectName"));
		return orSheetDetails;
	}

}
