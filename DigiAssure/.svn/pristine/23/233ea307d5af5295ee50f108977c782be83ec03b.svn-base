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

package com.cg.digi.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cg.digi.dao.ILoginDao;
import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;
import com.cg.digi.model.Chat;
import com.cg.digi.model.Project;
import com.cg.digi.model.User;
import com.cg.digi.utilities.FileUtils;


@Component("loginService")
public class LoginServiceImpl implements ILoginService {
	
	@Autowired
	ILoginDao loginDao;
	/*****************************chatbot*****************************/
	@Override
	public void saveuserinput(String inputmsg, String userid, String sessionid) {
		System.out.println("inside login service");
		loginDao.saveuserinput(inputmsg, userid, sessionid);	
	}
	@Override
	public void savebotoutput(String outputmsg, String userid, String sessionid) {
		System.out.println("inside login service output");
		loginDao.savebotoutput(outputmsg, userid, sessionid);	
	}
	@Override
	public ArrayList<Chat> getuserchat(String userid, String sessionid) {
	
		return loginDao.getuserchat(userid,sessionid);
		
	}
	@Override
	public ArrayList<Chat> getbotchat(String userid, String sessionid) {
		return loginDao.getbotchat(userid, sessionid);
	}
	
	
	/*****************************chatbot ends*****************************/
	@Override
	public User loginValidation(String username, String password) {
	 User user = loginDao.loginValidation(username, password);
	 DigiLoggerUtils.log("User Details in Service Layer loginValidation() :"+user, LEVEL.trace);
		return user;
	}

	@Override
	public boolean checkEmail(String email) {
		 DigiLoggerUtils.log("EmailId verification in Service Layer checkEmail() :"+email, LEVEL.trace);
		return  loginDao.checkEmail(email);
	}

	@Override
	public boolean addUser(User userDetails) {
		return  loginDao.addUser(userDetails);
	}

	@Override
	public boolean activateUser(String userName) {
		return  loginDao.activateUser(userName);	
	}

	@Override
	public boolean updatePassword(String userName, String userPassword) {
		return  loginDao.updatePassword(userName,userPassword);	
		
	}
 
	@Override
	public  boolean sendMail(String macroFile, String userName,
			String password) {
		boolean flag = true;
		File source = new File(macroFile + "Macro.vbs");
		File dest = new File(macroFile + userName + "/Macro.vbs");
		try {
			FileUtils.copyFile(source, dest);
			source = new File(macroFile + "SendMail.xlsm");
			dest = new File(macroFile + userName + "/SendMail.xlsm");
			FileUtils.copyFile(source, dest);

			FileInputStream fsIP = new FileInputStream(dest);
			XSSFWorkbook wb = new XSSFWorkbook(fsIP);
			XSSFSheet worksheet1 = wb.getSheetAt(0);
			XSSFRow row = worksheet1.createRow(0);
			XSSFCell cell = row.createCell(0);
			cell.setCellValue(userName);
			cell = row.createCell(1);
			cell.setCellValue(password);
			fsIP.close();
			FileOutputStream output_file = new FileOutputStream(dest);

			wb.write(output_file); // write changes

			output_file.close(); // close the stream

			// Send Mail
			ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c",
					"cd \"" + macroFile + userName + "\" && Macro.vbs");
			builder.redirectErrorStream(true);
			 builder.start();

		} catch (Exception e) {
			flag = false;
			DigiLoggerUtils.log("Error in sendMail() : "+e.getMessage(), LEVEL.info);
		}
		return flag;
	}

	@Override
	public List<Project> getProjects() {
		return  loginDao.getAllProjects();
	}



	@Override
	public boolean checkUserName(String userName) {
		return loginDao.checkUserName(userName);
	}

	@Override
	public List<User> getUsers() {
		return loginDao.getUsers();
	}

	@Override
	public boolean deleteUser(String userId) {
		return loginDao.deleteUser(userId);
	}

	@Override
	public boolean editUser(User user) {
		return loginDao.editUser(user);
	}

	@Override
	public User getuserDetails(int userid) {
		return loginDao.getuserDetails(userid);
	}


	
	
}
