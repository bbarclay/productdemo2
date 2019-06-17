package com.cg.digi.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cg.digi.utilities.FileUtils;

public class ReleaseSM {
public static boolean confirm(String macroFile, String userName){
	boolean flag=true;
	 File source = new File(macroFile + "Release.vbs"); 
	  File dest = new File(macroFile + userName + "/Release.vbs");
	  try {
		FileUtils.copyFile(source, dest);
		 source = new File(macroFile +
				  "releasetime.xlsm"); 
		  dest = new File(macroFile+ userName +"/releasetime.xlsm"); 
				  FileUtils.copyFile(source, dest);
				  
				  
				  FileInputStream fsIP = new FileInputStream(dest);
					 XSSFWorkbook wb = new XSSFWorkbook(fsIP);
					 XSSFSheet worksheet1 =
					  wb.getSheetAt(0); 
					 XSSFRow row = worksheet1.createRow(0); 
					 XSSFCell  cell = row.createCell(0);
					  cell.setCellValue(userName); 
					  cell = row.createCell(1);
					  fsIP.close(); 
					  FileOutputStream output_file = new
					  FileOutputStream(dest);
					  
					  wb.write(output_file); // write changes
					  
					  output_file.close(); // close the stream
				  
				  //Send Mail
				    ProcessBuilder builder = new ProcessBuilder(
				            "cmd.exe", "/c", "cd \""+macroFile+userName+"\" && Release.vbs");
				        builder.redirectErrorStream(true);
						 builder.start();
																	 
						
	} catch (Exception e) {
		flag=false;
		e.printStackTrace();
		
	}
	 

	return flag;			

	
}
}
