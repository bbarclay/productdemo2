package com.cg.digi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Batch;
import com.cg.digi.model.Project;
import com.cg.digi.model.Reviews;
import com.cg.digi.model.Tool;
import com.cg.digi.model.User;

@Component("adminDao")
public class AdminDaoImpl implements IAdminDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Project getProject(String projectid) {
		String sql = "SELECT * from project WHERE projectid=" + projectid;
		Project project = null;
		try {
			project = jdbcTemplate.queryForObject(sql,
					new BeanPropertyRowMapper<Project>(Project.class));
			DigiLoggerUtils
					.log("Project details in Dao getProject(projectid) : "
							+ project, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Project details in Dao getProject(projectid) : " + e,
					LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getProject(projectid) : " + e,
					LEVEL.error);
		}
		System.out.println("AdminDaoImpl projectName: "+project);
		return project;
	}

	@Override
	public Tool getTool(String toolName) {
		String query = "SELECT * FROM tool WHERE toolname=" + "'" + toolName
				+ "'";
		Tool tool = new Tool();
		try {
			tool = jdbcTemplate.queryForObject(query,
					new BeanPropertyRowMapper<Tool>(Tool.class));
			DigiLoggerUtils.log("Tool details in Dao getTool(toolName) : "
					+ tool, LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("Tool details in Dao getTool(toolName) : " + e,
					LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils
					.log("Tool in getTool(toolName) : " + e, LEVEL.error);
		}
		return tool;
	}

	@Override
	public Tool getToolDetails(String toolid) {
		String query = "SELECT * FROM tool WHERE toolid=" + toolid;
		Tool tool = new Tool();
		try {
			tool = jdbcTemplate.queryForObject(query,
					new BeanPropertyRowMapper<Tool>(Tool.class));
			DigiLoggerUtils.log("Tool details in Dao getToolDetails(toolid) : "
					+ tool, LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					" Error Tool details in Dao  getToolDetails(toolid) :" + e,
					LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Error Tool in  getToolDetails(toolid) :" + e,
					LEVEL.error);
		}
		return tool;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Tool> getAllTools() {
		List<Tool> list = null;
		try {
			list = jdbcTemplate.query("SELECT * FROM tool",
					new BeanPropertyRowMapper(Tool.class));
			DigiLoggerUtils
					.log("Data while retrieving all tools from Database ::: "
							+ list, LEVEL.info);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all tools from Database ::: "
							+ e.getMessage(), LEVEL.error);
		}
		return list;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<User> getAllUsers(String projectid) {
		List<User> list = null;
		try {
			list = jdbcTemplate.query("SELECT * FROM users WHERE projectid="+projectid,
					new BeanPropertyRowMapper(User.class));
			DigiLoggerUtils
					.log("Data while retrieving all users from Database ::: "
							+ list, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all users from Database ::: "
							+ e.getMessage(), LEVEL.error);
		}
		return list;
	}

	@SuppressWarnings("deprecation")
	@Override
	public Batch newBatch(Batch batch, String userid) {
		int result = 0;
		String query = "INSERT INTO manual_batch(batchname,remarks,toolid,allocatedUser,createdby,creationTime,executionstatus,status,executionpercentage) VALUES (?,?,?,?,?,current_timestamp,?,'Y','0%')";
		Object[] params = new Object[] {
				batch.getBatchname(),batch.getRemarks(),batch.getToolid(),batch.getAllocatedUser(),userid,"No Run"};
		try {
			result = jdbcTemplate.update(query, params);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error in newBatch(Batch batch) Dao :: " + e.getMessage(),
					LEVEL.error);
			jdbcTemplate.update("rollback");
		}
		
		try {
			if(result>=1){
			int batchid = jdbcTemplate.queryForInt("SELECT MAX(batchid) FROM manual_batch");
			batch = getBatch(batchid);
			}else{
				 batch = new Batch();
				return batch;
			}
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error in addRun(Run run) Dao :: " + e.getMessage(),
					LEVEL.error);
		}
		return batch;
	}

	private Batch getBatch(int batchid) {
		String query = "SELECT * from manual_batch WHERE batchid=" + batchid;
		Batch batch = null;

		try {
			batch = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<Batch>(Batch.class));
			
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in getBatch(batchid) : " + e,
					LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in getRuns() : " + e, LEVEL.error);
		}
		return batch;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Batch> getManualTestSuiteBatches(String toolName) {
		List<Batch> list = null;
		try {
			list = jdbcTemplate.query("SELECT b.batchid,b.batchname, b.remarks,t.toolname,b.allocatedUser,b.createdby,b.executionstatus,b.executionpercentage,u.username FROM manual_batch b, tool t, users u WHERE u.userid=b.allocatedUser and b.toolid=t.toolid and b.toolid="
				+ toolName,
					new BeanPropertyRowMapper(Batch.class));
			 
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all Manual Test Suites/Batches from Database ::: "
							+ e.getMessage(), LEVEL.error);
		}
		return list; 
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    public User getUser(int id) {
                    String query = "SELECT username FROM users WHERE userid="+ id;
                    User user = new User();
                    try {
                                    user = jdbcTemplate.queryForObject(query,
                                                                    new BeanPropertyRowMapper<User>(User.class));
                                    DigiLoggerUtils.log("User details in Dao getUser(userName) : "
                                                                    + user, LEVEL.info);
                    } catch (DataAccessException e) {
                                    DigiLoggerUtils.log("User details in Dao getUser(userName) : " + e,
                                                                    LEVEL.error);
                    } catch (Exception e) {
                                    DigiLoggerUtils
                                                                    .log("User in getUser(userName) : " + e, LEVEL.error);
                    }
                    return user;
    }

	@Override
	public List<Reviews> getAllReviews(String appId) {
		
		
		List<Reviews> list = null;
		try {
			list = jdbcTemplate.query("SELECT * FROM reviews WHERE appid="+ appId,
					new BeanPropertyRowMapper(Reviews.class));
			 
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all Manual Test Suites/Batches from Database ::: "
							+ e.getMessage(), LEVEL.error);
		}
        return list;
	}


}
