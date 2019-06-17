package com.cg.digi.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.cg.digi.model.Basic_Details;
import com.cg.digi.model.DSDevice_Details;

public class DeviceDetailsResultSetExractor implements ResultSetExtractor{

	@Override
	public Object extractData(ResultSet resultSet) throws SQLException,
			DataAccessException {
		
		DSDevice_Details deviceDetails = new DSDevice_Details();
		
		deviceDetails.setid(Integer.parseInt(resultSet.getString("id")));
		deviceDetails.setvendor(resultSet.getString("vendor"));	
		deviceDetails.setdevice_id(resultSet.getString("device_id"));
		deviceDetails.setname(resultSet.getString("name"));
		deviceDetails.setversion(resultSet.getString("version"));
		deviceDetails.setos(resultSet.getString("os"));
		deviceDetails.setstatus(resultSet.getString("status"));
		
		deviceDetails.setreservation(resultSet.getString("reservation"));
		deviceDetails.setreservation_id(resultSet.getString("reservation_id"));
		deviceDetails.setReservation_time(resultSet.getString("reservation_time"));
		
		deviceDetails.setUdid(resultSet.getString("udid"));
		deviceDetails.setdevicecategory(resultSet.getString("devicecategory"));
		deviceDetails.setagentlocation(resultSet.getString("agentlocation"));
		deviceDetails.setresolution(resultSet.getString("resolution"));
		return deviceDetails;
	}

	
}
