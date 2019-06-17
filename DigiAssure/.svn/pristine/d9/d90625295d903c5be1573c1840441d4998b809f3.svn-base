package com.cg.digi.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cg.digi.dao.IAdminDao;
import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Batch;
import com.cg.digi.model.Project;
import com.cg.digi.model.Reviews;
import com.cg.digi.model.Tool;
import com.cg.digi.model.User;


@Component("adminService")
public class AdminServiceImpl implements IAdminService{

	@Autowired
	IAdminDao adminDao;
	
	
	@Override
	public Project getProject(String projectid) {
		return adminDao.getProject(projectid);
	}


	@Override
	public Tool getTool(String toolName) {
		return adminDao.getTool(toolName);
	}
	
	
	public Date getDateFromString(String date){
		DigiLoggerUtils.log("Date avalue in string to parse to date  :: "+date, LEVEL.info);
		Date startDate= null;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
			 try {
				startDate = df.parse(date);
			} catch (ParseException e) {
				DigiLoggerUtils.log("Error while parsing date :: "+date+"Exception "+e.getMessage(), LEVEL.error);
		}
		DigiLoggerUtils.log("After parsing   :: "+startDate, LEVEL.info);
		return startDate;
		
	}


	@Override
	public Tool getToolDetails(String toolid) {
		return adminDao.getToolDetails(toolid);
	}


	@Override
	public List<Tool> getAllTools() {
		return adminDao.getAllTools();
	}


	@Override
	public List<User> getAllUsers(String projectid) {
		return adminDao.getAllUsers(projectid);
	}


	@Override
	public Batch newBatch(Batch batch, String userid) {
		return adminDao.newBatch(batch,userid);
	}


	@Override
	public List<Batch> getManualTestSuiteBatches(String toolName) {
		return adminDao.getManualTestSuiteBatches(toolName);
	}

	@Override
    public User getUser(int userid) {
                    
                    return adminDao.getUser(userid);
    }


	@Override
	public List<Reviews> getAllReviews(String appId) {
		return adminDao.getAllReviews(appId);
	}

}
