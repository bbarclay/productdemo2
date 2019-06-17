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

import com.cg.digi.model.ObjectRepository;

/**
 * @author sm823199
 * 
 */
public class ObjectRepositoryResultSetExtractor implements ResultSetExtractor {

	@Override
	public Object extractData(ResultSet resultSet) throws SQLException,
	DataAccessException {
		ObjectRepository objectRepository = new ObjectRepository();
		objectRepository.setObjectId(resultSet.getString("objectid"));
		objectRepository.setObjectName(resultSet.getString("objectname"));
		objectRepository.setObjectDescription(resultSet
				.getString("objectdescription"));
		objectRepository.setOrSheetId(resultSet.getString("orsheetid"));
		objectRepository.setProjectId(resultSet.getString("projectid"));
		objectRepository.setUserId(resultSet.getString("UserID"));
		objectRepository.setPageName(resultSet.getString("pagename"));
		objectRepository.setApptype(resultSet.getString("apptype"));
		objectRepository.setIndex(resultSet.getString("index"));
		objectRepository.setId(resultSet.getString("id"));
		objectRepository.setText(resultSet.getString("text"));
		objectRepository.setContentDescription(resultSet
				.getString("contentdescription"));
		objectRepository.setHint(resultSet.getString("hint"));
		objectRepository.setClassName(resultSet.getString("class"));
		objectRepository.setxPath(resultSet.getString("xpath"));
	objectRepository.setCreatedBy(resultSet.getString("createdby"));	
	objectRepository.setCreationTime(resultSet.getString("creationtime"));	
	objectRepository.setModifiedBy(resultSet.getString("modifiedby"));		
	objectRepository.setModifiedTime(resultSet.getString("modifiedtime"));	
		return objectRepository;
	}

}
