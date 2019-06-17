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

import java.util.Properties;

public class Log4JProperties {

	public static Properties getProperties() {
		Properties props = new Properties();
		props.setProperty("log4j.rootLogger", "ERROR, FRAMEWORKLOG, file");
		props.setProperty("log4j.appender.FRAMEWORKLOG",
				"org.apache.log4j.ConsoleAppender");
		props.setProperty("log4j.appender.FRAMEWORKLOG.layout",
				"org.apache.log4j.PatternLayout");
		props.setProperty("log4j.appender.FRAMEWORKLOG.Threshold", "DEBUG");
		props.setProperty(
				"log4j.appender.FRAMEWORKLOG.layout.ConversionPattern",
				"%d{dd MMM, yyyy HH:mm:ss z} - %-5p - DigiAssure LOG : %-5p -CLASSNAME-: %c : %m%n ");

		props.setProperty("log4j.appender.file",
				"org.apache.log4j.RollingFileAppender");
		props.setProperty("log4j.appender.file.File",
				"C:/DigiAssureStorage/Log/application_digiassure.log");
		props.setProperty("log4j.appender.file.MaxFileSize", "10MB");
		props.setProperty("log4j.appender.file.MaxBackupIndex", "10");
		props.setProperty("log4j.appender.file.layout",
				"org.apache.log4j.PatternLayout");
		props.setProperty(
				"log4j.appender.file.layout.ConversionPattern",
				"%d{dd MMM, yyyy HH:mm:ss z} - %-5p -DigiAssure LOG :  %-5p -CLASSNAME-: %c :  %m%n");
		props.setProperty("log4j.appender.file.Threshold", "DEBUG");

		return props;
	}

}
