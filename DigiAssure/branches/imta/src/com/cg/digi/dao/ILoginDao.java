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

import com.cg.digi.model.Chat;
import com.cg.digi.model.Project;
import com.cg.digi.model.User;

/**
 * @author hapemmas
 *
 */
public interface ILoginDao {
	/*****************************chatbot*****************************/
	public void saveuserinput(String inputmsg,String userid, String sessionid);
	
	public void savebotoutput(String outputmsg, String userid, String sessionid);
	
	public ArrayList<Chat> getuserchat(String userid, String sessionid);
	
	public ArrayList<Chat> getbotchat(String userid, String sessionid);
	/*****************************chatbot*****************************/
	public User loginValidation(String username, String password);

	public boolean checkEmail(String email);

	public boolean addUser(User userDetails);

	public boolean activateUser(String userName);

	public boolean updatePassword(String userName, String userPassword);

	public List<Project> getAllProjects();

	public boolean checkUserName(String userName);

	public List<User> getUsers();

	public boolean deleteUser(String userId);

	public boolean editUser(User user);

	public User getuserDetails(int userid);
	

	

	


}
