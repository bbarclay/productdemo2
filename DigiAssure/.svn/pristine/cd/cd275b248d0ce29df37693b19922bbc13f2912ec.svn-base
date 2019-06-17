/**
 * 
 */
package com.cg.digi.dao;

import java.util.List;

import com.cg.digi.model.Batch;
import com.cg.digi.model.Project;
import com.cg.digi.model.Reviews;
import com.cg.digi.model.Tool;
import com.cg.digi.model.User;

/**
 * @author hapemmas
 *
 */
public interface IAdminDao {

	
	public  Project  getProject(String userid);
	public Tool getTool(String toolName);
	public Tool getToolDetails(String toolid);
	public List<Tool> getAllTools();
	public List<User> getAllUsers(String projectid);
	public Batch newBatch(Batch batch, String userid);
	public List<Batch> getManualTestSuiteBatches(String toolName);
	public User getUser(int userid);
	public List<Reviews> getAllReviews(String appId);
	
}
