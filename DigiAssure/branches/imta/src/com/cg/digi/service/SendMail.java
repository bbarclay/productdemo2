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
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cg.digi.utilities.FileUtils;

public class SendMail {
public static boolean sendMail(String macroFile, String receiveruserName,String temppassword ){
	
	/*boolean flag=true;
	
	  final String username = "lopamudra.chakraborty@capgemini.com";  // like yourname@outlook.com
	    final String password = "ch@28995";   // password here

	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", "smtp-mail.outlook.com");
	    props.put("mail.smtp.port", "587");

	    Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	        }
	      });
	    session.setDebug(true);

	    try {

	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(username));
	        message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(receiveruserName));   // like inzi769@gmail.com
	        message.setSubject("Activation Mail");
	        message.setText("Please Activate your account from following URL http://localhost:8011/Mydigi/activation.jsp"+" "
	        		+ "Username: "+ receiveruserName+ " "+ "Password: "+ temppassword);

	        Transport.send(message);

	        System.out.println("Done");

	    } catch (MessagingException e) {
	    	flag= false;
	    	e.printStackTrace();
	        
	    }
		return flag;
	    
}
*/

	boolean flag=true;
	 File source = new File(macroFile + "Macro.vbs"); 
	  File dest = new File(macroFile + receiveruserName + "/Macro.vbs");
	  try {
		FileUtils.copyFile(source, dest);
		 source = new File(macroFile +
				  "SendMail.xlsm"); 
		  dest = new File(macroFile+ receiveruserName +"/SendMail.xlsm"); 
				  FileUtils.copyFile(source, dest);
				  
				  
				  FileInputStream fsIP = new FileInputStream(dest);
					 XSSFWorkbook wb = new XSSFWorkbook(fsIP);
					 XSSFSheet worksheet1 =
					  wb.getSheetAt(0); 
					 XSSFRow row = worksheet1.createRow(0); 
					 XSSFCell  cell = row.createCell(0);
					  cell.setCellValue(receiveruserName); 
					  cell = row.createCell(1);
					  cell.setCellValue(temppassword); 
					  fsIP.close(); 
					  FileOutputStream output_file = new
					  FileOutputStream(dest);
					  
					  wb.write(output_file); // write changes
					  
					  output_file.close(); // close the stream
				  
				  //Send Mail
				    ProcessBuilder builder = new ProcessBuilder(
				            "cmd.exe", "/c", "cd \""+macroFile+receiveruserName+"\" && Macro.vbs");
				        builder.redirectErrorStream(true);
						 builder.start();
																	 
						
	} catch (Exception e) {
		flag=false;
		
		
	}
	 

	return flag;			

}
}
