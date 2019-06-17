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

package com.cg.digi.logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class DigiLoggerUtils {	
	
	
	public static void log(Object message,LEVEL level,Class<?> cls){
		Logger logger=Logger.getLogger(cls.getName());
		PropertyConfigurator.configure(Log4JProperties.getProperties());
		if(level.toString().equals("trace")){
			logger.trace(message);
		}else if(level.toString().equals("debug")){
			logger.debug(message);
		}else if(level.toString().equals("info")){
			logger.info(message);
		}else if(level.toString().equals("warn")){
			logger.warn(message);
		}else if(level.toString().equals("error")){
			logger.error(message);
		}else if(level.toString().equals("fatal")){
			logger.fatal(message);
		}
	}
	public enum LEVEL{
		trace("trace"),debug("debug"),info("info"),warn("warn"),error("error"),fatal("fatal");
		
		private final String name;

		private LEVEL(String str) {
			name = str;
		}

		public boolean equalsName(String otherName) {
			return (otherName == null) ? false : name.equals(otherName);
		}

		public String toString() {
			return this.name;
		}
	}
	
	public static void log(Object message,LEVEL level){
		Logger logger=Logger.getLogger((String) message);
		PropertyConfigurator.configure(Log4JProperties.getProperties());
		if(level.toString().equals("trace")){
			logger.trace(message);
		}else if(level.toString().equals("debug")){
			logger.debug(message);
		}else if(level.toString().equals("info")){
			logger.info(message);
		}else if(level.toString().equals("warn")){
			logger.warn(message);
		}else if(level.toString().equals("error")){
			logger.error(message);
		}else if(level.toString().equals("fatal")){
			logger.fatal(message);
		}
	}
	
	static void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		System.setProperty("rootPath", context.getRealPath("/"));
		System.out.println("---------------------->"+System.getProperty("rootPath"));
	}

}
