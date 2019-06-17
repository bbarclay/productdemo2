package com.cg.digi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Basic_Details;
import com.cg.digi.model.Consolidate_Details;
import com.cg.digi.model.DSDevice_Details;
import com.cg.digi.model.ORSheetDetails;
import com.cg.digi.model.Reserve;
import com.cg.digi.model.User;
import com.cg.digi.model.Vendor_MarketShare;
import com.cg.digi.model.Vendor_Names;
import com.cg.digi.rowmapper.ConsolidatedDeviceDetailsRowmapper;
import com.cg.digi.rowmapper.DeviceDetailsRowmapper;
import com.cg.digi.rowmapper.ORSheetDetailsRowMapper;

import com.cg.digi.rowmapper.Vendor_MarketShareRowmapper;
import com.cg.digi.rowmapper.Vendor_NamesRowmapper;
import com.cg.digi.rowmapper.BasicDeviceDetailsRowmapper;


@Component("iDeviceCloudDao")
public class DeviceCloudDao implements IDeviceCloudDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	/**
	 * Login Authentication Functionality
	 * 
	 */



	// Add Uploaded File Details
	@Override
	public boolean addFileDetails(com.cg.digi.model.File fileDetails) {
		int count = 0;
		try {
			String insertQuery = "INSERT INTO File(FileName,CreatedBy,CreationTime) VALUES (?,?,current_date)";
			Object[] params = new Object[] { fileDetails.getFileName(),
					fileDetails.getCreatedBy() };
			count = jdbcTemplate.update(insertQuery, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		if (count > 0) {

			return true;
		}
		return false;
	}

	
	//@SuppressWarnings("unchecked")
	@Override
	public List<ORSheetDetails> getORSheetDetails(String userId) {
		List<ORSheetDetails> list = null;
		String query = "SELECT o.orsheetid,o.orsheetname,o.userid,o.description,p.ProjectName FROM  orsheetdetails o , Project p WHERE o.projectid = p.ProjectID and o.userid = ? and flag='1'";

		try {
			ORSheetDetailsRowMapper orSheetDetailsRowMapper = new ORSheetDetailsRowMapper();
			list = jdbcTemplate.query(query, orSheetDetailsRowMapper, userId ,userId);
		} catch (DataAccessException e) {

			e.printStackTrace();
		}
		return list;
	}

	

	/**
	 * Validate page name and do not insert into table if pagename already
	 * exsits in the table for that application
	 * 
	 */
	

	@SuppressWarnings("unchecked")
		@Override
		public List<Vendor_MarketShare> getVendorData() {
			
			List<Vendor_MarketShare> vendor_MarketShare = null;
					
			try {
			
				Vendor_MarketShareRowmapper detailsRowMapper = new Vendor_MarketShareRowmapper();
				String query = "SELECT Sr_No, Vendor_Name, Month, Value from DSCVendor_MarketShare";
				
				vendor_MarketShare = jdbcTemplate.query(query, detailsRowMapper);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}

			return vendor_MarketShare;
		}

		
		
		@Override
		public boolean BasicToConsolidatedData() {
		
			int list = 0;

			String query1 = "TRUNCATE TABLE DSCConsolidated_Data";			
			jdbcTemplate.update(query1);
			
			try {
			
				String query = "INSERT INTO DSCConsolidated_Data (Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution) SELECT Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution FROM DSCBasic_Device_Details ORDER BY Vendor_ID ASC, OS_ID ASC, Version_ID DESC";			
				list = jdbcTemplate.update(query);
				/*ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
				String query11 = "SELECT * FROM Consolidated_Data ORDER BY OS_ID ASC, Version_ID DESC";			
				jdbcTemplate.query(query11, detailsRowMapper);	*/	
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			if (list > 0) {
				return true;
			} else {
				return false;
			}
		}

		
		

		

		@SuppressWarnings("unchecked")
		@Override
		public List<Consolidate_Details> ConsolidatedData() {
			
				List<Consolidate_Details> list = null;
			
			try {
			
				ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
				String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data";			
				list = jdbcTemplate.query(query, detailsRowMapper);
				
				//System.out.println("size"+sz);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return list;
		}
		
		public boolean updateData(Consolidate_Details cd) {
			int temp = 0;
			try {

				String query = "UPDATE DSCConsolidated_Data  SET Priority=? where Sr_No = ?";
				////System.out.println("In controller.....");
				////System.out.println(cd.getPri());
				////System.out.println(cd.getSr_no());
				Object[] params = new Object[] { cd.getPri(),cd.getSr_no()};
				temp = jdbcTemplate.update(query, params);
				String query1 = "COMMIT";
				jdbcTemplate.update(query1);
			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<Vendor_Names> DisplayVendor_Names() {
			
			List<Vendor_Names> listV = null;
			try {		
				Vendor_NamesRowmapper detailsRowMapper = new Vendor_NamesRowmapper();
				String query = "SELECT vendor_ID,vendor_Name,Description FROM DSCVendor_Details";			
				listV = jdbcTemplate.query(query, detailsRowMapper);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return listV;
		}

		

		@Override
		public int apple_versp(int vn, int nsp) {

			String ver=null;
			switch (vn) {
	        case 1:  ver = "iOS 7";
	                 	break;
	        case 2:  ver = "iOS 8";
	        			break;
	        case 3:  ver = "iOS 9";
	        			break;
	                 
	     }
			    //System.out.println(ver);
			    
				String query = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='SP' AND Version_Name LIKE ?";			
				nsp = nsp+jdbcTemplate.queryForInt(query,'%'+ver+'%');
				//System.out.println(nsp);

				return nsp;
		}
		@Override
		public int apple_vertb(int vn, int ntb) {

			String ver=null;
			switch (vn) {
	        case 1:  ver = "iOS 7";
	                 	break;
	        case 2:  ver = "iOS 8";
	        			break;
	        case 3:  ver = "iOS 9";
	        			break;
	                 
	     }
			    //System.out.println(ver);
		 		   
				String query1 = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='TB' AND Version_Name LIKE ?";			
				ntb = ntb+jdbcTemplate.queryForInt(query1,'%'+ver+'%');
				//System.out.println(ntb);
				return ntb;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Consolidate_Details> AppleSelectDevices(int os, int vn,String tp,int max) {

			String ver=null;
			switch (vn) {
	        case 1:  ver = "iOS 7";
	                 	break;
	        case 2:  ver = "iOS 8";
	        			break;
	        case 3:  ver = "iOS 9";
	        			break;
	                 
	     }
			//System.out.println("fOR vERSION::::::"+ver);
			List<Consolidate_Details> list = null;
			
			try {
				if(tp=="SP"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
			    }
				if(tp=="TB"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
				}
			} catch (DataAccessException e) {
				e.printStackTrace();
			}
			return list;
		}

		
		@Override
		public int android_versp(int vn, int nsp) {
			
			String ver=null;
			switch (vn) {
			case 1:  ver = "2.2";
	     			break;
			case 2:  ver = "v2.3";
					break;
			case 3:  ver = "v3.";
					break;
			case 4:  ver = "4.1";
					break;
			case 5:  ver = "v4.2";
					break;
			case 6:  ver = "4.3";
					break;
			case 7:  ver = "4.4";
					break;
			case 8:  ver = "5.0";
					break;
			case 9:  ver = "5.1";
					break;
			case 10:  ver = "6.0";
					break;
	                 
	     }
			  
				String query = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='SP' AND Version_Name LIKE ?";			
				nsp = jdbcTemplate.queryForInt(query,'%'+ver+'%');
				return nsp;
		}
		@Override
		public int android_vertb(int vn, int ntb) {
			
		
			String ver=null;
			switch (vn) {
			case 1:  ver = "2.2";
	     			break;
			case 2:  ver = "v2.3";
					break;
			case 3:  ver = "v3.";
					break;
			case 4:  ver = "4.1";
					break;
			case 5:  ver = "v4.2";
					break;
			case 6:  ver = "4.3";
					break;
			case 7:  ver = "4.4";
					break;
			case 8:  ver = "5.0";
					break;
			case 9:  ver = "5.1";
					break;
			case 10:  ver = "6.0";
					break;
	                 
	     }
			 		   
				String query1 = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='TB' AND Version_Name LIKE ?";			
				ntb = jdbcTemplate.queryForInt(query1,'%'+ver+'%');
				return ntb;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Consolidate_Details> AndroidSelectDevices(int os, int vn,String tp,int max) {

			String ver=null;
			switch (vn) {
			case 1:  ver = "2.2";
	     			break;
			case 2:  ver = "v2.3";
					break;
			case 3:  ver = "v3.";
					break;
			case 4:  ver = "4.1";
					break;
			case 5:  ver = "v4.2";
					break;
			case 6:  ver = "4.3";
					break;
			case 7:  ver = "4.4";
					break;
			case 8:  ver = "5.0";
					break;
			case 9:  ver = "5.1";
					break;
			case 10:  ver = "6.0";
					break;
	                 
	     }
			List<Consolidate_Details> list = null;
			
			try {
				if(tp=="SP"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
			    }
				if(tp=="TB"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
				}
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return list;
		}
		@Override
		public int MWindows_versp(int vns, int nsp) {

			//System.out.println(vns);
			String ver=null;
			switch (vns) {
	        case 1:  ver = "Microsoft Windows Phone 8";
	                 	break;
	        case 2:  ver = "Microsoft Windows Phone 10";
	        			break;
	                 
	     }
			//System.out.println(ver);
			    
				String query = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='SP' AND Version_Name LIKE ?";			
				nsp = nsp+jdbcTemplate.queryForInt(query,'%'+ver+'%');
				//System.out.println(nsp);

				return nsp;
		}
		@Override
		public int MWindows_vertb(int vnt, int ntb) {

			//System.out.println(vnt);
			String ver=null;
			switch (vnt) {
	        case 3:  ver = "Internet Tablet OS 2007";
	                 	break;
	        case 4:  ver = "Internet Tablet OS 2008";
	        			break;
	        case 5:  ver = "Microsoft Windows RT";
	        			break;
	                 
	     }
			    //System.out.println(ver);
		 		   
				String query1 = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='TB' AND Version_Name LIKE ?";			
				ntb = ntb+jdbcTemplate.queryForInt(query1,'%'+ver+'%');
				//System.out.println(ntb);
				return ntb;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Consolidate_Details> MWindowsSelectDevices(int os, int vn,String tp,int max) {

			String ver=null;
			switch (vn) {
			case 1:  ver = "Microsoft Windows Phone 8";
	     			break;
			case 2:  ver = "Microsoft Windows Phone 10";
					break;
			case 3:  ver = "Internet Tablet OS 2007";
	     			break;
			case 4:  ver = "Internet Tablet OS 2008";
					break;
			case 5:  ver = "Microsoft Windows RT";
					break;
		             
		 }
			List<Consolidate_Details> list = null;
			
			try {
				if(tp=="SP"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
			    }
				if(tp=="TB"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
				}
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return list;
		}
		
		@Override
		public int Rim_versp(int vns, int nsp) {

			String ver=null;
			switch (vns) {
	        case 1:  ver = "BlackBerry OS 7";
	                 	break;
	        case 2:  ver = "BlackBerry OS 10";
	        			break;
	                 
	     }
			    
				String query = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='SP' AND Version_Name LIKE ?";			
				nsp = nsp+jdbcTemplate.queryForInt(query,'%'+ver+'%');
				//System.out.println(nsp);

				return nsp;
		}
		@Override
		public int Rim_vertb(int vnt, int ntb) {

			String ver=null;
			if(vnt==3){
				ver="BlackBerry Tablet OS";
			}				 		   
				String query1 = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE Type='TB' AND Version_Name LIKE ?";			
				ntb = ntb+jdbcTemplate.queryForInt(query1,'%'+ver+'%');
				//System.out.println(ntb);
				return ntb;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Consolidate_Details> RIMSelectDevices(int os, int vn,String tp,int max) {

			String ver=null;
			switch (vn) {
			case 1:  ver = "BlackBerry OS 7";
	     			break;
			case 2:  ver = "BlackBerry OS 10";
					break;
			case 3:  ver = "BlackBerry Tablet OS";
	     			break;
		 }
			List<Consolidate_Details> list = null;
			
			try {
				if(tp=="SP"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
			    }
				else if(tp=="TB"){
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution,Priority FROM DSCConsolidated_Data WHERE OS_ID=? AND Version_Name LIKE ? AND Type=? LIMIT ?";		
					Object[] params = new Object[] { os,'%'+ver+'%',tp,max};
					list = jdbcTemplate.query(query, detailsRowMapper, params);
					
					String query1 = "INSERT INTO DSCTemp_Data (Model_name, OS_ID, Version_ID) SELECT Model_name, OS_ID, Version_ID FROM DSCConsolidated_Data WHERE OS_ID=? AND  Version_Name LIKE ? AND Type=? LIMIT ?";			
					Object[] params1 = new Object[] { os,'%'+ver+'%',tp,max};
					jdbcTemplate.update(query1, params1);
				}
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return list;
		}
		
		@Override
		public boolean TruncateVendor_MarketShare() {
			int temp = 0;
			try {
				String query1 = "TRUNCATE TABLE DSCVendor_MarketShare";			
				temp = jdbcTemplate.update(query1);
				
				String query2 = "TRUNCATE TABLE DSCDevice_OS";			
				temp = jdbcTemplate.update(query2);
				
				String query3 = "TRUNCATE TABLE DSCBasic_Device_Details";			
				temp = jdbcTemplate.update(query3);
				
			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}	
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}

		@Override
		public boolean InsertVendor_MarketShare(String vend_names, String vend_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCVendor_MarketShare(Vendor_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {vend_names, vend_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean InsertOS_MarketShare(String os_names, String os_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCDevice_OS(OS_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {os_names, os_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean Insert_BasicDeviceData(int vend_id,int OS_id,int ver_id,String ver_nm,String model_nm,String tp,String resolution) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCBasic_Device_Details(Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution) VALUES(?,?,?,?,?,?,?)";
	            			Object[] params = new Object[] {vend_id, OS_id, ver_id, ver_nm, model_nm, tp, resolution};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public int SuggestionsPriorityCount(int os, int p, int npd) {
			 
				String query = "SELECT COUNT(*) FROM DSCConsolidated_Data WHERE NOT EXISTS (SELECT Model_name FROM DSCTemp_Data WHERE DSCConsolidated_Data.Model_name = DSCTemp_Data.Model_name AND DSCConsolidated_Data.Version_ID = DSCTemp_Data.Version_ID) AND OS_ID=? AND Priority=?";		
				npd = npd+jdbcTemplate.queryForInt(query,os,p);
				//System.out.println("npd:"+npd);
				return npd;
		}
		
		@Override
		@SuppressWarnings("unchecked")
		public List<Consolidate_Details> Suggestions(int os, int p, int n) {
			
			List<Consolidate_Details> list = null;
						
			try {
					ConsolidatedDeviceDetailsRowmapper detailsRowMapper = new ConsolidatedDeviceDetailsRowmapper();
					String query = "SELECT * FROM DSCConsolidated_Data WHERE NOT EXISTS (SELECT Model_name FROM DSCTemp_Data WHERE DSCConsolidated_Data.Model_name = DSCTemp_Data.Model_name AND DSCConsolidated_Data.Version_ID = DSCTemp_Data.Version_ID) AND OS_ID=? AND Priority=? LIMIT ?";		
					Object[] params = new Object[] { os,p,n};
					list = jdbcTemplate.query(query, detailsRowMapper, params);		
					//System.out.println("size:"+list.size());
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return list;
		}
		@Override
		public boolean TruncateTemp_Data() {
			int temp = 0;
			try {
				String query1 = "TRUNCATE TABLE DSCTemp_Data";			
				temp = jdbcTemplate.update(query1);
		
			} catch (DataAccessException e) {
				
			}	
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Vendor_MarketShare> getUKVendorData() {
			
			List<Vendor_MarketShare> vendor_MarketShare = null;
					
			try {
			
				Vendor_MarketShareRowmapper detailsRowMapper = new Vendor_MarketShareRowmapper();
				String query = "SELECT Sr_No, Vendor_Name, Month, Value from DSCUKVendor_MarketShare";
				
				vendor_MarketShare = jdbcTemplate.query(query, detailsRowMapper);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}

			return vendor_MarketShare;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Vendor_MarketShare> getUserVendorData() {
			
			List<Vendor_MarketShare> vendor_MarketShare = null;
					
			try {
			
				Vendor_MarketShareRowmapper detailsRowMapper = new Vendor_MarketShareRowmapper();
				String query = "SELECT Sr_No, Vendor_Name, Month, Value from DSCUserVendor_MarketShare";
				
				vendor_MarketShare = jdbcTemplate.query(query, detailsRowMapper);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}

			return vendor_MarketShare;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Vendor_MarketShare> getGlobalVendorData() {
			
			List<Vendor_MarketShare> vendor_MarketShare = null;
					
			try {
			
				Vendor_MarketShareRowmapper detailsRowMapper = new Vendor_MarketShareRowmapper();
				String query = "SELECT Sr_No, Vendor_Name, Month, Value from DSCGlobalVendor_MarketShare";
				
				vendor_MarketShare = jdbcTemplate.query(query, detailsRowMapper);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}

			return vendor_MarketShare;
		}
		
		
		
		
		@Override
		public boolean InsertUKVendor_MarketShare(String vend_names, String vend_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCUKVendor_MarketShare(Vendor_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {vend_names, vend_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		@Override
		public boolean InsertUserVendor_MarketShare(String vend_names, String vend_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCUserVendor_MarketShare(Vendor_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {vend_names, vend_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		@Override
		public boolean InsertGlobalVendor_MarketShare(String vend_names, String vend_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCGlobalVendor_MarketShare(Vendor_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {vend_names, vend_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		
		public boolean InsertUKOS_MarketShare(String os_names, String os_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCUKDevice_OS(OS_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {os_names, os_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean InsertUserOS_MarketShare(String os_names, String os_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCUserDevice_OS(OS_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {os_names, os_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		public boolean InsertGlobalOS_MarketShare(String os_names, String os_namesm, double data_values) {

			int temp = 0;
			try {
				      String query = "INSERT INTO DSCGlobalDevice_OS(OS_Name, Month, Value) VALUES(?,?,?)";
	            			Object[] params = new Object[] {os_names, os_namesm, data_values};
	            			temp = jdbcTemplate.update(query, params); 

			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}

		@Override
		public boolean TruncateUKVendor_MarketShare() {
			int temp = 0;
			try {
				String query1 = "TRUNCATE TABLE DSCUKVendor_MarketShare";			
				temp = jdbcTemplate.update(query1);
				
				String query2 = "TRUNCATE TABLE DSCUKDevice_OS";			
				temp = jdbcTemplate.update(query2);
				
			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}	
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		@Override
		public boolean TruncateUserVendor_MarketShare() {
			int temp = 0;
			try {
				String query1 = "TRUNCATE TABLE DSCUserVendor_MarketShare";			
				temp = jdbcTemplate.update(query1);
				
				String query2 = "TRUNCATE TABLE DSCUserDevice_OS";			
				temp = jdbcTemplate.update(query2);
				
			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}	
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		@Override
		public boolean TruncateGlobalVendor_MarketShare() {
			int temp = 0;
			try {
				String query1 = "TRUNCATE TABLE DSCGlobalVendor_MarketShare";			
				temp = jdbcTemplate.update(query1);
				
				String query2 = "TRUNCATE TABLE DSCGlobalDevice_OS";			
				temp = jdbcTemplate.update(query2);
				
			} catch (DataAccessException e) {
				//System.out.println("Exception has occured in Dao " + e);
			}	
			if (temp > 0) {
				return true;
			} else {
				return false;
			}
		}
		@Override
		public int Count_Records() {
			int nsp;
			
			String query = "SELECT COUNT(*) FROM DSCConsolidated_Data";	
			
			nsp = jdbcTemplate.queryForInt(query);

			return nsp;
		}



		@SuppressWarnings("unchecked")
		@Override
		public List<Basic_Details> BasicDeviceData() {
		
			List<Basic_Details> list = null;
			
			try {
			
				BasicDeviceDetailsRowmapper detailsRowMapper = new BasicDeviceDetailsRowmapper();
				String query = "SELECT Sr_No, Vendor_ID, OS_ID, Version_ID, Version_Name, Model_name, Type, Resolution FROM DSCBasic_Device_Details";			
				list = jdbcTemplate.query(query, detailsRowMapper);
			} catch (DataAccessException e) {

				e.printStackTrace();
			}
			return list;
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<DSDevice_Details> DeviceData() {
		//System.out.println("in dao");
			List<DSDevice_Details> list = null;
			
			try {
			//System.out.println("in try");
				DeviceDetailsRowmapper detailsRowMapper = new DeviceDetailsRowmapper();
				String query = "SELECT id, vendor, device_id, name, version, os, status, reservation,reservation_id,reservation_time,udid,devicecategory,agentlocation,resolution FROM Devices";			
				list = jdbcTemplate.query(query, detailsRowMapper);
				
				//for(DSDevice_Details dev:list)
				//System.out.println("Device data list      "+dev.getReservation_time());
			} catch (DataAccessException e) {

				//System.out.println("error due to : "+e.getMessage());
			}
			return list;
		}


		@Override
		public User loginValidation(String username, String password) {
			// TODO Auto-generated method stub
			return null;
		}



		@Override
		public boolean checkEmail(String email) {
			// TODO Auto-generated method stub
			return false;
		}



		@Override
		public boolean addUser(User userDetails) {
			// TODO Auto-generated method stub
			return false;
		}



		@Override
		public boolean activateUser(String userName) {
			// TODO Auto-generated method stub
			return false;
		}



		@Override
		public boolean updatePassword(String userName, String userPassword) {
			// TODO Auto-generated method stub
			return false;
		}
		
		//db devices
		
		public int updateReservationId(String deviceId , String reservationId){
			/*int count = 0;
			try {
				//String insertQuery = "INSERT INTO perfecto_devices(device_id,reservation_id) VALUES (deviceId,reservationId)";
				return jdbcTemplate.update("UPDATE INTO devices(device_id, reservation_id) VALUES(?,?)", deviceId, reservationId);
			} catch (DataAccessException e) {
				e.printStackTrace();
				
				 String sqlUpdate = "UPDATE contact set email=? where name=?";
        		 jdbcTemplate.update(sqlUpdate, "tomee@mail.com", "Tom");
				
			}
			return count;*/
			int temp = 0;
			try {

				String query = "UPDATE devices set reservation_id=? where device_id = ?";
				temp = jdbcTemplate.update(query, reservationId, deviceId);
			} catch (DataAccessException e) {
				System.out.println("Exception has occured in Dao Update reservation ID ");
			}
			
			return temp;
		}
		
		public String getDeviceResevationId(String device_id){
			String query = "select reservation_id from devices where device_id=?";
	        Object[] inputs = new Object[] {device_id};
	        String reservation_id = jdbcTemplate.queryForObject(query, inputs, String.class);
	        return reservation_id;
		}
		
		//reserve time
		public int updateReservationtime(String deviceId , String reservation_time){
		
			int temp = 0;
			try {

				String query = "UPDATE devices set reservation_time=? where device_id = ?";
				temp = jdbcTemplate.update(query, reservation_time, deviceId);
			} catch (DataAccessException e) {
				System.out.println("Exception has occured in Dao Update reservation time ");
			}
			
			return temp;
		}
		
		public String getDeviceResevationtime(String device_id){
			String query = "select reservation_time from devices where device_id=?";
	        Object[] inputs = new Object[] {device_id};
	        String reservation_time = jdbcTemplate.queryForObject(query, inputs, String.class);
	        return reservation_time;
		}
		
		@Override
		public int addReservationTime(String deviceId , String reservation_time) {
			int count = 0;
			try {
				
				count= jdbcTemplate.update("INSERT INTO dsreserve_time(device_id, reservation_time) VALUES(?,?)", deviceId, reservation_time);
			} catch (DataAccessException e) {
				e.printStackTrace();
			}
			return count;
			
		}
		
		
		public int updateReservationTimeDB() {
			int count = 0;
			try {
				String insertQuery = "update devices set reservation_time = (select dsreserve_time.reservation_time from dsreserve_time where devices.device_id = dsreserve_time.device_id) where exists (select * from dsreserve_time where devices.device_id = dsreserve_time.device_id);";
				count= jdbcTemplate.update(insertQuery);
			} catch (DataAccessException e) {
				e.printStackTrace();
			}
			//System.out.println("Update Result = " + count);
			return count;
			
		}
		@Override
		public int deleteReservationTime(String device_id){
			String query = "DELETE FROM dsreserve_time WHERE device_id = ?";
	        Object[] inputs = new Object[] {device_id};
	        int rows = jdbcTemplate.update(query,inputs);
	        return rows;
	        
		}
		
		//perfecto
		
			public int addDevices(int id , String vendor, String device_id, String name ,String version , String os , String status , String reservation , String reservation_id,String udid,String devicecategory,String agentlocation,String resolution) {
				int count = 0;
				try {
					//String insertQuery = "INSERT INTO perfecto_devices(device_id,reservation_id) VALUES (deviceId,reservationId)";
					return jdbcTemplate.update("INSERT INTO devices(id,vendor,device_id,name,version,os,status,reservation,reservation_id,udid,devicecategory,agentlocation,resolution) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", id,vendor,device_id,name,version,os,status,reservation,reservation_id,udid,devicecategory,agentlocation,resolution);
				} catch (DataAccessException e) {
					e.printStackTrace();
				}
				return count;
			}
			
			@Override
			public int addPerfectoDevices(String deviceId , String reservationId) {
				int count = 0;
				try {
					//String insertQuery = "INSERT INTO perfecto_devices(device_id,reservation_id) VALUES (deviceId,reservationId)";
					return jdbcTemplate.update("INSERT INTO perfecto_devices(device_id, reservation_id) VALUES(?,?)", deviceId, reservationId);
				} catch (DataAccessException e) {
					e.printStackTrace();
				}
				return count;
				
			}

			@Override
			public String getPerfectoResevationId(String device_id){
				String query = "select reservation_id from perfecto_devices where device_id=?";
		        Object[] inputs = new Object[] {device_id};
		        String reservation_id = jdbcTemplate.queryForObject(query, inputs, String.class);
		        return reservation_id;
			}
			
			@Override
			public int deletePerfectoDevice(String device_id){
				String query = "DELETE FROM perfecto_devices WHERE device_id = ?";
		        Object[] inputs = new Object[] {device_id};
		        int rows = jdbcTemplate.update(query,inputs);
		        return rows;
		        
			}
			
			@Override
			public int deleteAllVendorDevice(String vendor){
				String query = "DELETE FROM devices WHERE vendor = ?";
		        Object[] inputs = new Object[] {vendor};
		        int rows=0;
		        rows = jdbcTemplate.update(query,inputs);
		        return rows;
		        
			}
			
			@Override
			public boolean addMail(String deviceid,String mailid,String status){
				//String reserveUpdateQuery = "UPDATE resrve_time SET status='Y', mailID=" + mailid+" WHERE device_Id="+deviceid;
				int reserveUpdate = 0;
				//System.out.println("==============inside dao");
				
				try {
					reserveUpdate = jdbcTemplate.update("UPDATE dsreserve_time SET status='"+status+"', mailID='" + mailid+"' WHERE device_id='"+deviceid+"'");
				} catch (DataAccessException e) {
					DigiLoggerUtils.log(
							"Error : !! :: While updating batch result after updating test case result -->"
									+ e.getStackTrace(), LEVEL.info);
				}
				
				if(reserveUpdate>=1){
					
					return true;
					}
					return false;
		        
			}
			@Override
			public Reserve getCheckMail(String deviceid) {
				Reserve reserve = new Reserve();
				String query = "SELECT * FROM dsreserve_time WHERE status='Y' and device_id='"+deviceid+"'";
						
				try {
					reserve = jdbcTemplate.queryForObject(query,
							new BeanPropertyRowMapper<Reserve>(Reserve.class));
				} catch (DataAccessException e) {
					DigiLoggerUtils
							.log("Error while retriving", LEVEL.info);
				}
				return reserve;
			}


			@Override
			public List<Vendor_MarketShare> getAustraliaVendorData() {

				
				List<Vendor_MarketShare> vendor_MarketShare = null;
						
				try {
				
					Vendor_MarketShareRowmapper detailsRowMapper = new Vendor_MarketShareRowmapper();
					String query = "SELECT Sr_No, Vendor_Name, Month, Value from DSCAustraliaVendor_MarketShare";
					
					vendor_MarketShare = jdbcTemplate.query(query, detailsRowMapper);
				} catch (DataAccessException e) {

					e.printStackTrace();
				}

				return vendor_MarketShare;
			
			}


			

			@Override
			public boolean TruncateAustraliaVendor_MarketShare() {

				int temp = 0;
				try {
					String query1 = "TRUNCATE TABLE DSCAustraliaVendor_MarketShare";			
					temp = jdbcTemplate.update(query1);
					
					String query2 = "TRUNCATE TABLE DSCAustraliaDevice_OS";			
					temp = jdbcTemplate.update(query2);
					
				} catch (DataAccessException e) {
					//System.out.println("Exception has occured in Dao " + e);
				}	
				if (temp > 0) {
					return true;
				} else {
					return false;
				}
			
			}


			@Override
			public boolean InsertAustraliaVendor_MarketShare(String vend_names,
					String vend_namesm, double data_values) {

				int temp = 0;
				try {
					      String query = "INSERT INTO DSCAustraliaVendor_MarketShare(Vendor_Name, Month, Value) VALUES(?,?,?)";
		            			Object[] params = new Object[] {vend_names, vend_namesm, data_values};
		            			temp = jdbcTemplate.update(query, params); 

				} catch (DataAccessException e) {
					//System.out.println("Exception has occured in Dao " + e);
				}
				if (temp > 0) {
					return true;
				} else {
					return false;
				}
			}


			@Override
			public Boolean InsertAustraliaOS_MarketShare(String os_names,
					String os_namesm, double data_values) {


				int temp = 0;
				try {
					      String query = "INSERT INTO DSCAustraliaDevice_OS(OS_Name, Month, Value) VALUES(?,?,?)";
		            			Object[] params = new Object[] {os_names, os_namesm, data_values};
		            			temp = jdbcTemplate.update(query, params); 

				} catch (DataAccessException e) {
					//System.out.println("Exception has occured in Dao " + e);
				}
				if (temp > 0) {
					return true;
				} else {
					return false;
				}
			
			}

	

}
