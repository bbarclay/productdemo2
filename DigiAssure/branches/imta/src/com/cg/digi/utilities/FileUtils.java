/**
 * 
 */
package com.cg.digi.utilities;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.comparator.LastModifiedFileComparator;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;

/**
 * @author hapemmas
 *
 */
public class FileUtils {
	private static final int BUFFER_SIZE = 4096;
	@SuppressWarnings("resource")
	public static String getFileData(File file3) {
		String fileData = null;
		if(!file3.exists()){
			fileData="File not found";
		}
		BufferedReader bufferedReader = null;
		StringBuilder builder = new StringBuilder();
		try {
			bufferedReader = new BufferedReader(new FileReader(file3));
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				builder.append(str);
			}
			fileData = builder.toString();
		} catch (FileNotFoundException e) {
			fileData = null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileData;
	}

	@SuppressWarnings("resource")
	public static boolean copyFile(File sourceFile, File destFile) {
		try {

			if (!sourceFile.exists()) {
				return false;
			}
			if (!destFile.exists()) {
				destFile.createNewFile();
			}

			FileChannel source = new FileInputStream(sourceFile).getChannel();
			FileChannel destination = new FileOutputStream(destFile)
					.getChannel();
			;
			if (destination != null && source != null) {
				destination.transferFrom(source, 0, source.size());
			}
			if (source != null) {
				source.close();
			}
			if (destination != null) {
				destination.close();
			}

		} catch (IOException ioExeception) {
			DigiLoggerUtils.log("Error in Copying Folder Contents  : "
					+ sourceFile, LEVEL.error);
		}

		return true;
	}

	
	public static void updateRepositoryLine(String toUpdate, String updated, String filePath)  {
		try{
		BufferedReader file = new BufferedReader(new FileReader(filePath));
	    String line;
	    String input = "";
	   
	    while ((line = file.readLine()) != null){
	    	
	    	if(line.contains(toUpdate))
	    	{
	    		line=updated;
	    	}
	        input += line + System.lineSeparator();
	    }
	    FileOutputStream os = new FileOutputStream(filePath);
	    os.write(input.getBytes());

	    file.close();
	    os.close();
	    }catch(Exception e){
	    	System.out.println(e.getMessage());
	    }
	}
	
	public static void zipNeoLoadConfigFiles(String neoConfigPath){
		try
		{
			
	        File directoryToZip = new File(neoConfigPath+"/repository.xml");
	        File directoryToZip1 = new File(neoConfigPath+"/scenario.xml");
	        File directoryToZip2 = new File(neoConfigPath+"/settings.xml");
	        String zipFilePath = neoConfigPath+"/config.zip";
	        List<File> listFiles = new ArrayList<File>(1);
	        listFiles.add(directoryToZip);
	        listFiles.add(directoryToZip1);
	        listFiles.add(directoryToZip2);
	        compressFiles(listFiles, zipFilePath);
		}catch(Exception e){
			System.out.println(" zip error "+e);
		}
	}
	
	public static void compressFiles(List<File> listFiles, String destZipFile) throws FileNotFoundException, IOException {
        
	       ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(destZipFile));
	         
	       for (File file : listFiles) {
	           if (file.isDirectory()) {
	               addFolderToZip(file, file.getName(), zos);
	           } else {
	               addFileToZip(file, zos);
	           }
	       }
	         
	       zos.flush();
	       zos.close();
	   }
	
	private static void addFolderToZip(File folder, String parentFolder,
            ZipOutputStream zos) throws FileNotFoundException, IOException {
        for (File file : folder.listFiles()) {
            if (file.isDirectory()) {
                addFolderToZip(file, parentFolder + "/" + file.getName(), zos);
                continue;
            }
  
            zos.putNextEntry(new ZipEntry(parentFolder + "/" + file.getName()));
  
            BufferedInputStream bis = new BufferedInputStream(
                    new FileInputStream(file));
  
            long bytesRead = 0;
            byte[] bytesIn = new byte[BUFFER_SIZE];
            int read = 0;
  
            while ((read = bis.read(bytesIn)) != -1) {
                zos.write(bytesIn, 0, read);
                bytesRead += read;
            }
  
            zos.closeEntry();
  
        }
    }
	
	 private static void addFileToZip(File file, ZipOutputStream zos)
	            throws FileNotFoundException, IOException {
	        zos.putNextEntry(new ZipEntry(file.getName()));
	  
	        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(
	                file));
	  
	        long bytesRead = 0;
	        byte[] bytesIn = new byte[BUFFER_SIZE];
	        int read = 0;
	  
	        while ((read = bis.read(bytesIn)) != -1) {
	            zos.write(bytesIn, 0, read);
	            bytesRead += read;
	        }
	  
	        zos.closeEntry();
	    }
	
	public static boolean CreateJsonFile(File filedirectory,
			JSONObject createJson, String filepath) {
		try {

			if (!filedirectory.exists()) {
				filedirectory.mkdir();
				FileWriter file = new FileWriter(filepath);
				file.write(createJson.toJSONString());
				file.flush();
				file.close();
			} else {
				FileWriter file = new FileWriter(filepath);
				file.write(createJson.toJSONString());
				file.flush();
				file.close();
			}

		} catch (IOException e1) {

			DigiLoggerUtils.log("Unable to get sampleinput.json file : "
					+ filepath, LEVEL.error);
		}

		return true;
	}

	public static boolean ModifyJsonFile(JSONObject createJson, String filepath) {

		try {

			FileWriter file = new FileWriter(filepath);
			file.write(createJson.toJSONString());
			file.flush();
			file.close();

		} catch (IOException e1) {
			DigiLoggerUtils.log("Unable to Modify JSON File  : " + e1,
					LEVEL.error);
		}

		return true;
	}

	/**
	 * Used to zip full folder contents 1. also includes sub folders 2. includes
	 * sub folder files & folders
	 * 
	 * @param srcFolder
	 * @param destZipFile
	 * @throws Exception
	 */
	public static void zipFolder(String srcFolder, String destZipFile)
			throws Exception {
		ZipOutputStream zip = null;
		FileOutputStream fileWriter = null;

		try {
			fileWriter = new FileOutputStream(destZipFile);
			zip = new ZipOutputStream(fileWriter);
		} catch (Exception e) {
			DigiLoggerUtils.log("Unable to Zip Folder for Download  : " + e,
					LEVEL.error);
		}

		addFolderToZip("", srcFolder, zip);
		zip.flush();
		zip.close();
	}

	private static void addFolderToZip(String path, String srcFolder,
			ZipOutputStream zip) throws Exception {
		File folder = new File(srcFolder);

		for (String fileName : folder.list()) {
			if (path.equals("")) {
				addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip);
			} else {
				addFileToZip(path + "/" + folder.getName(), srcFolder + "/"
						+ fileName, zip);
			}
		}
	}

	private static void addFileToZip(String path, String srcFile,
			ZipOutputStream zip) throws Exception {
		File folder = new File(srcFile);
		if (folder.isDirectory()) {
			addFolderToZip(path, srcFile, zip);
		} else {
			byte[] buf = new byte[1024];
			int len;
			FileInputStream in = new FileInputStream(srcFile);
			DigiLoggerUtils.log("File data from : " + srcFile + "  : " + in,
					LEVEL.info);
			zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
			while ((len = in.read(buf)) > 0) {
				zip.write(buf, 0, len);
			}
			in.close();
		}
	}

	/**
	 * it's throwing httpsession error
	 * 
	 * @param fileName
	 */
	public static void downloadFile(String fileName, HttpSession session,
			HttpServletResponse response1, HttpServletRequest request1) {
		HttpServletRequest request = request1;
		HttpServletResponse response = response1;

		int BUFFER_SIZE = 4096;
		FileInputStream inputStream;
		OutputStream outStream;
		try {
			ServletContext context = request.getSession().getServletContext();
			File downloadFile = new File(fileName);
			inputStream = new FileInputStream(downloadFile);
			String mimeType = context.getMimeType(fileName);
			if (mimeType == null) {
				mimeType = "application/octet-stream";
			}

			response.setContentType(mimeType);
			response.setContentLength((int) downloadFile.length());

			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"",
					downloadFile.getName());
			response.setHeader(headerKey, headerValue);

			outStream = response.getOutputStream();
			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();
		} catch (Exception e) {
			DigiLoggerUtils.log("Unable to Download File : " + fileName + " : "
					+ e, LEVEL.error);
		}

	}

	public static void updateLine(String filepath, String toUpdate,
			String updated) throws IOException {
		BufferedReader file = new BufferedReader(new FileReader(filepath
				+ "temp.bat"));
		PrintWriter writer = new PrintWriter(new File(filepath + "run.bat"),
				"UTF-8");
		String line;
		while ((line = file.readLine()) != null) {
			line = line.replace(toUpdate, updated);
			writer.println(line);
		}
		file.close();
		if (writer.checkError())
			throw new IOException("cannot write");
		writer.close();
	}

	public static void copyPasteFolderContents(String actualPath,
			String targetPath) {
		System.out.println("inside file utils->copy paste folder");
		File srcFolder = new File(actualPath);
		File destFolder = new File(targetPath);
		System.out.println("sourcefolder: "+srcFolder+"destination folder: "+destFolder);
		if (!srcFolder.exists()) {
			System.out.println("no source folder");
			System.exit(0);
		} else {
			try {
				copyFolder(srcFolder, destFolder);
				System.out.println("folder copied and pasted");
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(0);
			}
		}
	}
	
	public static void replaceFileContents(String actualPath,
			String fileName,String s1, String s2,String m1 , String m2 , String n1 , String n2,String r1 ,String r2 ) {
		
		Path path = Paths.get(actualPath+fileName);
		Charset charset = StandardCharsets.UTF_8;

		String content;
		try {
			content = new String(Files.readAllBytes(path), charset);
		
		content = content.replaceAll(s1,s2);
		content = content.replaceAll(m1,m2);
		content = content.replaceAll(n1,n2);
		content = content.replaceAll(r1,r2);
		Files.write(path, content.getBytes(charset));
		} catch (IOException e) {
		}
	}

	private static void copyFolder(File src, File dest) throws IOException {
		if (src.isDirectory()) {
			if (!dest.exists()) {
				dest.mkdir();
			}
			String files[] = src.list();
			for (String file : files) {
				File srcFile = new File(src, file);
				File destFile = new File(dest, file);
				copyFolder(srcFile, destFile);
			}
		} else {
			InputStream in = new FileInputStream(src);
			OutputStream out = new FileOutputStream(dest);
			byte[] buffer = new byte[1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			in.close();
			out.close();
		}
	}

	public static File createFolder(String filePath, String folderName) {
		File finalFilePath = new File(filePath);
		if (!finalFilePath.exists()) {
			finalFilePath.mkdir();
			filePath += "/" + folderName;
			finalFilePath = new File(filePath);
			finalFilePath.mkdir();
		} else {
			filePath += "/" + folderName;
			finalFilePath = new File(filePath);
			finalFilePath.mkdir();
		}
		return finalFilePath;
	}

	public static boolean uploadMultipartFile(String filePath,
			MultipartFile fileName) {
		System.out.println("inside upload file");
		try {
			System.out.println("filepath: "+filePath);
			File uploadFile=new File(filePath+"/"+fileName.getOriginalFilename());
			if(uploadFile.exists()){
				uploadFile.delete();
				
			}
			fileName.transferTo(new File(filePath+"/"+fileName.getOriginalFilename()));
		} catch (IllegalStateException e) {
			DigiLoggerUtils.log("In copyFile method(illelegal state)" + e.getMessage(),
					LEVEL.error);
			return false;
		} catch (IOException e) {
			DigiLoggerUtils.log("In copyFile method(io exception)" + e.getMessage(),
					LEVEL.error);
			return false;
		}
		return true;
	}
	
	
	public static void unzippingFolder(String zipFile, String outputPath) {
		System.out.println("inside file utils-> unzipping folder");
		if (outputPath == null)
			outputPath = "";
		else
			outputPath += File.separator;
		File outputDirectory = new File(outputPath);
		if (outputDirectory.exists())
			outputDirectory.delete();
		outputDirectory.mkdir();
		try {
			@SuppressWarnings("resource")
			ZipInputStream zip = new ZipInputStream(
					new FileInputStream(zipFile));
			ZipEntry entry = null;
			int len;
			byte[] buffer = new byte[1024];
			while ((entry = zip.getNextEntry()) != null) {
				if (!entry.isDirectory()) {
					File file = new File(outputPath + entry.getName());
					if (!new File(file.getParent()).exists())
						new File(file.getParent()).mkdirs();
					FileOutputStream fos = new FileOutputStream(file);
					while ((len = zip.read(buffer)) > 0) {
						fos.write(buffer, 0, len);
					}
					fos.close();
				}
			}
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
		}
	}
	
	public static boolean createNewFile(File filePath,String fileName, String fileData){
			try {
				if (!filePath.exists()) {
					filePath.mkdir();
					File file = new File(filePath+"/"+fileName);
					file.createNewFile();
					FileWriter fileWriter = new FileWriter(file);
					fileWriter.write(fileData);
					fileWriter.flush();
					fileWriter.close();
					return true;                                                                                                  
				} else {
					File file = new File(filePath+"/"+fileName);
					file.createNewFile();
					FileWriter fileWriter = new FileWriter(file);
					fileWriter.write(fileData);
					fileWriter.flush();
					fileWriter.close();
					return true;
				}
			} catch (IOException e) {
				DigiLoggerUtils.log("Error While Creating file : "+fileName +" :: "+e.getMessage(), LEVEL.error);
				return false;
			}
	}
	
	public static File getTheNewestFile(String filePath, String ext) {
        File theNewestFile = null;
        File dir = new File(filePath);
        FileFilter fileFilter = new WildcardFileFilter("*." + ext);
        File[] files = dir.listFiles(fileFilter);

        if (files.length > 0) {
            /** The newest file comes first **/
            Arrays.sort(files, LastModifiedFileComparator.LASTMODIFIED_REVERSE);
            theNewestFile = files[0];
        }

        return theNewestFile;
    }
	
}
