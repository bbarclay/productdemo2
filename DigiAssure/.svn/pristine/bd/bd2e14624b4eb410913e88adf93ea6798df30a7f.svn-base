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

package com.cg.digi.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Chat;
import com.cg.digi.model.Project;
import com.cg.digi.model.User;

@Component("loginDao")
public class LoginDaoImpl implements ILoginDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	/*****************************chatbot*****************************/
	@Override
	public void saveuserinput(String inputmsg,String userid, String sessionid) {
		System.out.println("inside login dao");
		String query= "INSERT into chat_content( userId, botId, starttime, endtime,message,sender, sessionid) VALUES(?,?,current_timestamp,?,?,?,?)";
		Object[] params = { userid,
				"11101",null,inputmsg,userid, sessionid};
		int result = jdbcTemplate.update(query, params);
		if (result == 1) {
			System.out.println("User input succesfully recorded");
		}
	}
	@Override
	public void savebotoutput(String outputmsg, String userid, String sessionid) {
		System.out.println("inside login dao output");
		String query= "INSERT into chat_content( userId, botId, starttime, endtime,message,sender,sessionid) VALUES(?,?,current_timestamp,?,?,?,?)";
		Object[] params = { userid,
				"11101",null,outputmsg,"11101",sessionid};
		int result = jdbcTemplate.update(query, params);
		if (result == 1) {
			System.out.println("Bot output successfully recorded");
		}
	}
	@Override
	public ArrayList<Chat> getuserchat(String userid,String sessionid) {
		ArrayList<Chat> list = null;
		String query= "SELECT * from chat_content where sender= '" +userid+ "'and sessionid= '"+sessionid+ "'";
	list= (ArrayList<Chat>) jdbcTemplate.query(query, new BeanPropertyRowMapper(Chat.class)); 
	System.out.println("List(user) is: "+ list);
	if(!list.isEmpty()) {
		System.out.println("Input Data fetched and stored from database");	
	}
	return list;
	
		
	}
	@Override
	public ArrayList<Chat> getbotchat(String userid, String sessionid) {
		System.out.println("Inside getbot chat dao");
		ArrayList<Chat> list = null;
		
		int botid= 11101; 
		String query= "SELECT * from chat_content where sender= '"+botid+"' and userid='"+userid+"'and sessionid= '" + sessionid+"'"; //cannot take large msgs from bot
		//chk
	list= (ArrayList<Chat>) jdbcTemplate.query(query, new BeanPropertyRowMapper(Chat.class)); //check it
	System.out.println("select executed");	
	
	System.out.println("List(bot) is: "+ list);//check
	if(!list.isEmpty()) {
		System.out.println("Output Data fetched and stored from database");	
	}
	
	return list;
	
		
	}
	
	/*****************************chatbot ends*****************************/	

	@Override
	public User loginValidation(String username, String password) {
		String sql = "SELECT u.*,r.rolename from users u, roles r where username=? and userpassword=? AND u.roleid=r.roleid";
		User user = null;
		try {
			user = jdbcTemplate.queryForObject(sql, new Object[] { username,
					password }, new BeanPropertyRowMapper<User>(User.class));
			DigiLoggerUtils.log("User details in Dao loginValidation() : "
					+ user, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log("DataAccessException in loginValidation() : "
					+ e, LEVEL.error);
		} catch (Exception e) {
			DigiLoggerUtils.log("Exception in loginValidation() : " + e,
					LEVEL.error);
		}
		return user;
	}

	@SuppressWarnings("deprecation")
	@Override
	public boolean checkEmail(String email) {

		int count = 0;
		boolean flag = false;
		try {
			String query = "SELECT COUNT(*) from users where email='" + email
					+ "'";

			count = jdbcTemplate.queryForInt(query);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		if (count > 0) {
			flag = true;
		}
		return flag;

	}

	@Override
	public boolean addUser(User userDetails) {

		boolean flag = false;
		try {
			String query = "INSERT INTO users (username,userpassword,firstname,lastname,roleid,createdby,creationtime,projectid,email,status) VALUES(?,?,?,?,?,?,current_timestamp,?,?,?)";
			Object[] params = { userDetails.getEmail(),
					userDetails.getUserPassword(), userDetails.getFirstName(),
					userDetails.getLastName(), "2", "1", "1",
					userDetails.getEmail(), userDetails.getStatus() };
			int result = jdbcTemplate.update(query, params);
			if (result == 1) {
				flag = true;
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;

	}

	@Override
	public boolean activateUser(String userName) {

		String query = "UPDATE users SET status = 'Y' WHERE username = '"
				+ userName + "'";

		int temp = 0;
		try {
			temp = jdbcTemplate.update(query);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		if (temp > 0) {

			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean updatePassword(String userName, String userPassword) {

		String query = "UPDATE users SET userpassword = '" + userPassword
				+ "' WHERE username = '" + userName + "'";

		int temp = 0;
		try {
			temp = jdbcTemplate.update(query);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		if (temp > 0) {

			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Project> getAllProjects() {
		List<Project> list = null;
		try {
			list = jdbcTemplate.query("SELECT * FROM project",
					new BeanPropertyRowMapper(Project.class));
			DigiLoggerUtils
					.log("Data while retrieving all users from Database ::: "
							+ list, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all users from Database :: "
							+ e.getMessage(), LEVEL.error);
		}
		return list;
	}

	@SuppressWarnings("deprecation")
	@Override
	public boolean checkUserName(String userName) {

		int count = 0;
		boolean flag = false;
		try {
			String query = "SELECT COUNT(*) from users where username='"
					+ userName + "'";

			count = jdbcTemplate.queryForInt(query);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		if (count > 0) {
			flag = true;
		}
		return flag;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<User> getUsers() {
		List<User> list = null;
		try {
			list = jdbcTemplate.query("SELECT u.userid,u.firstname,u.lastname,u.username,u.phonenumber,u.email,r.rolename from users u, roles r where r.roleid=u.roleid and u.status='Y'",
					new BeanPropertyRowMapper(User.class));
			DigiLoggerUtils
					.log("Data while retrieving all users from Database ::: "
							+ list, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all users from Database : "
							+ e.getMessage(), LEVEL.error);
		}
		return list;
	}

	@Override
	public boolean deleteUser(String userid) {
		String query = "UPDATE users SET  status='N' where userid='" + userid
				+ "'";
		int result = jdbcTemplate.update(query);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean editUser(User user) {
		int result = 0;
	/*	String query1 = "SELECT userid from users where status='Y' and username='"
				+ user.getUserName() + "'";
		int userId = jdbcTemplate.queryForInt(query1);
		String query2 = "SELECT projectid from project where status='Y' and projectname='"
				+ user.getProjectName() + "'";
		int projectId = jdbcTemplate.queryForInt(query2);*/
		String query3 = "SELECT roleid from roles where rolename='"
				+ user.getRolename() + "'";
		int roleId = jdbcTemplate.queryForInt(query3);

		String query4 = "UPDATE users set firstname=?, lastname=?,userpassword=?,email=?,phonenumber=?,projectid=?,roleid=? where userid=?";
		try {

			Object[] params = new Object[] { user.getFirstName(),
					user.getLastName(), user.getUserPassword(),
					user.getEmail(), user.getPhoneNumber(), user.getProjectid(), roleId,
					user.getUserid() };
			result = jdbcTemplate.update(query4, params);
		} catch (Exception e) {

		}
		if (result > 0)
			return true;
		else
			return false;

	}

	@Override
	public User getuserDetails(int userid) {
		User user=null;
		try {
						
			String sql="SELECT u.userid,u.firstname,u.lastname,u.username,u.phonenumber,u.email,r.rolename,u.projectid,u.userpassword from digiassure.users u, roles r where r.roleid=u.roleid and u.status=? and userid=?";
			user = jdbcTemplate.queryForObject(sql, new Object[] { "Y",
					userid }, new BeanPropertyRowMapper<User>(User.class));
			
			DigiLoggerUtils
					.log("Data while retrieving  user from Database ::: "
							+ user, LEVEL.trace);
		} catch (DataAccessException e) {
			DigiLoggerUtils.log(
					"Error while retrieving all users from Database "
							+ e.getMessage(), LEVEL.error);
		}
		return user;
		
	}

}
