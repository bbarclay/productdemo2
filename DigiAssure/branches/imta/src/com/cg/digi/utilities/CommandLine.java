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

package com.cg.digi.utilities;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;


/**
 * @author hp818661
 *
 *         ________________Working________________________ 
 *         This class is considered as utils to execute commands of Runtime Process on the Fly
 *         Class accepts command/command with argument/ command with argument
 *         and stdin as input parameters and provides Output as String
 * 
 */
public class CommandLine {

	public static Output Output;
	private String command;
	private String[] args;
	private String stdin;

 
	public static class Output {

		public String stdout;
		public String stderr;
		public int rc;

		/**
		 * @param stdout
		 * @param stderr
		 * @param rc
		 */
		public Output(String stdout, String stderr, int rc) {
			this.stdout = stdout;
			this.stderr = stderr;
			this.rc = rc;
		}

		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "Output [stdout=" + stdout + ", stderr=" + stderr + ", rc="
					+ rc + "]";
		}

	}

	public static Output run(String command, String[] args, String stdin) {
		CommandLine cmdline = new CommandLine(command, args, stdin);
		return cmdline.run();
	}

	public static Output run(String command, String[] args) {
		DigiLoggerUtils.log("Run Command :: :: "+command +" "+args[0]+" "+args[1]+""+args[2]+""+args[3],LEVEL.info);
		return run(command, args, null);
	}

	public static Output run(String command) {
		return run(command, null, null);
	}

	/**
	 * @param command
	 * @param args
	 * @param stdin
	 */
	public CommandLine(String command, String[] args, String stdin) {
		this.command = command;
		this.args = args;
		this.stdin = stdin;
		//  logger = new LogUtils(this);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CommandLine [command=" + command + ", args="
				+ Arrays.toString(args) + ", stdin=" + stdin + ", logger="
				+ ", run()=" + run() + super.toString() + "]";
	}

	public Output run() {
		StreamWrapper errorStream, outputStream;
		String cmdStr = buildCommandString(command, args, stdin);
		Process proc = start(cmdStr);
		outputStream = getStreamWrapper(proc.getInputStream(), "OUTPUT");
		errorStream = getStreamWrapper(proc.getErrorStream(), "ERROR");
		int rc = 0;
		try {
			errorStream.start();
			outputStream.start();
			errorStream.join(3000);
			outputStream.join(3000);
		} catch (InterruptedException e) {
			  DigiLoggerUtils.log("Interrupted during appending the stream data"+e, LEVEL.error);
		}

		String error = errorStream.message;
		String output = outputStream.message;
		return new Output(output, error, rc);
	}

	public Process start(String cmdString) {
		Runtime runtime = Runtime.getRuntime();
		Process proc = null;
		try {
			proc = runtime.exec(cmdString);
		} catch (IOException e) {
			 DigiLoggerUtils.log("Error while executing Command"+e, LEVEL.error);
		}
		return proc;
	}

	public StreamWrapper getStreamWrapper(
			InputStream inputStreamInGetStreamWrapper, String type) {
		return new StreamWrapper(inputStreamInGetStreamWrapper, type);
	}

	private String buildCommandString(String command, String[] args,
			String stdin) {
		StringBuilder builder = new StringBuilder(" ");
		if (stdin == null) {
			stdin = " ";
		}
		try {
			if (args.length != 0) {
				builder = new StringBuilder();
				for (String arg : args) {
					builder.append(arg);
					builder.append(" ");
				}
			}
		} catch (NullPointerException e) {
			 DigiLoggerUtils.log("No proper arguements passed for command construction"+e, LEVEL.error);
		}
		return command = command.concat(" ").concat(builder.toString())
				.concat(" ").concat(stdin);
	}

	public class StreamWrapper extends Thread {
		InputStream inputStream = null;
		String message = null;

		StreamWrapper(InputStream inputStreamInWrapper, String type) {
			this.inputStream = inputStreamInWrapper;
		}

		public void run() {
			try {
				BufferedReader bufferedReader = new BufferedReader(
						new InputStreamReader(inputStream));
				StringBuffer buffer = new StringBuffer();
				String line = null;
				while ((line = bufferedReader.readLine()) != null) {
					buffer.append(line);
				}
				message = buffer.toString();
			} catch (IOException ioException) {
				 DigiLoggerUtils.log("Error while reading Input stream data"+ioException, LEVEL.error);
			}
		}
	}
}
