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
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class RuntimeCommand {
	public StreamWrapper getStreamWrapper(
			InputStream inputStreamInGetStreamWrapper, String type) {
		return new StreamWrapper(inputStreamInGetStreamWrapper, type);
	}

	private class StreamWrapper extends Thread {
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
					buffer.append(line);// .append("\n");
				}
				message = buffer.toString();
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	}

	public String commandLine(String command) {
		Runtime runtime = Runtime.getRuntime();
		RuntimeCommand runtimeCommand = new RuntimeCommand();
		StreamWrapper error, output;
		String commandLineOutput = null;

		try {
			Process proc = runtime.exec(command);
			error = runtimeCommand.getStreamWrapper(proc.getErrorStream(),
					"ERROR");
			output = runtimeCommand.getStreamWrapper(proc.getInputStream(),
					"OUTPUT");
			error.start();
			output.start();
			error.join(3000);
			output.join(3000);
	/*		System.out.println("Output: " + output.message + "\nError: "
					+ error.message);*/
			commandLineOutput = "O: " + output.message + "\nE: "
					+ error.message;
			FileWriter fWriter = null;
			BufferedWriter writer = null;
			try {
				fWriter = new FileWriter("D:/output.txt");
				writer = new BufferedWriter(fWriter);
				writer.write(commandLineOutput);
				writer.newLine();
				writer.close();
			} catch (Exception e) {
			}
		} catch (IOException e) {
			commandLineOutput = e.getMessage();
		} catch (InterruptedException e) {
			commandLineOutput = e.getMessage();
		}
		return commandLineOutput;

	}
}