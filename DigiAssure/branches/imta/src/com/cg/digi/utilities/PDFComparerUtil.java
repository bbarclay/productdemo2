package com.cg.digi.utilities;


import java.awt.Rectangle;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.util.PDFTextStripperByArea;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class PDFComparerUtil {
	

	static PDFTextStripperByArea stripper=null;
	static PDDocument document =null;
	static XSSFWorkbook workbook=null;
	static XSSFSheet sheet1=null;
	static XSSFSheet sheet2=null;
	static XSSFSheet sheet3=null;
	static long  S3DocSize;
	static long OnbaseDocSize;
	static FileOutputStream out=null;
	XSSFCellStyle style_Pass = ExcelCellStyle("Pass");
    XSSFCellStyle style_Fail = ExcelCellStyle("Fail");
   XSSFCellStyle style_val = ExcelCellStyle("Heading");
	public int pageno;

	private void ExportPDFCords1(int xVal,int yVal,int height,int yincrement,String location) 
	{
		try
		{
			
			
			
			stripper = new PDFTextStripperByArea();
			stripper.setSortByPosition( true );
			String extractedVal="";
			
	 
	           
	           
	           File file = new File(location);

	           
	           S3DocSize= file.length()/1024;	           
	        document = PDDocument.load(location);
	       
	        int noOfPages = document.getNumberOfPages();
					int m=0;
			        int n=0;
			
			 List allPages = document.getDocumentCatalog().getAllPages();
		
			 int pages = 0;
			
			 
			while(pages < noOfPages)
				
			{
				PDPage firstPage = (PDPage)allPages.get( pages );		
				 PDRectangle x= firstPage.PAGE_SIZE_LETTER;
				xVal=0; yVal=0;n=0;m=0;
				int lastrow = sheet1.getLastRowNum();
				Row row = sheet1.createRow(lastrow+1);
				pageno= pages+1;
				Cell cellPage = row.createCell(0);
				cellPage.setCellStyle(ExcelCellStyle("Heading"));
				cellPage.setCellValue("Page No : "+pageno);
			 do
			{
			 Rectangle rect=new Rectangle(xVal,yVal ,(int)x.getWidth() ,height );  
			 stripper.addRegion( "class1", rect);
			 stripper.extractRegions( firstPage );
			 extractedVal=stripper.getTextForRegion( "class1" ).trim();	
			 if(!extractedVal.equalsIgnoreCase("") )
			    {
				 	n=n+1;
			    
					PDFtoExcel1(rect.toString().substring(18), extractedVal, yVal-n,pages+1);
  				    n=yVal;				    				
			    }
			 else
			 {
				 m=m+1;
			 }
			 yVal=yVal+yincrement;
		 }while( yVal<=x.getHeight());			 
			 pages = pages+1;
	}
 }
		
		
	catch(Exception ex)
	{
		System.out.println( ex.getMessage() );
	}
	
	}
	
	private void ExportPDFCords2(int xVal,int yVal,int height,int yincrement,String location) 
	{
		try
		{
			stripper = new PDFTextStripperByArea();
			stripper.setSortByPosition( true );
			String extractedVal="";
			
	           
	           File file = new File(location);
	           
	           OnbaseDocSize= file.length()/1024;	        
	           
	        document = PDDocument.load(location);
	        int noOfPages = document.getNumberOfPages();
					int m=0;
			        int n=0;
			
			 List allPages = document.getDocumentCatalog().getAllPages();
		
			 int pages = 0;
			
			 
			while(pages < noOfPages)
				
			{
				PDPage firstPage = (PDPage)allPages.get( pages );		
				 PDRectangle x= firstPage.PAGE_SIZE_LETTER;
				xVal=0; yVal=0;n=0;m=0;
				int lastrow = sheet2.getLastRowNum();
				Row row = sheet2.createRow(lastrow+1);
				pageno= pages+1;
				Cell cellPage = row.createCell(0);
				cellPage.setCellStyle(ExcelCellStyle("Heading"));
				cellPage.setCellValue("Page No : "+pageno);
			 do
			{
			 Rectangle rect=new Rectangle(xVal,yVal ,(int)x.getWidth() ,height );  
			 stripper.addRegion( "class1", rect);
			 stripper.extractRegions( firstPage );
			 extractedVal=stripper.getTextForRegion( "class1" ).trim();	
			 if(!extractedVal.equalsIgnoreCase("") )
			    {
				 	n=n+1;
			       
					PDFtoExcel2(rect.toString().substring(18), extractedVal, yVal-n,pages+1);
  				    n=yVal;				    				
			    }
			 else
			 {
				 m=m+1;
			 }
			 yVal=yVal+yincrement;
		 }while( yVal<=x.getHeight());			 
			 pages = pages+1;
	}
 }
		
		
	catch(Exception ex)
	{
		System.out.println( ex.getMessage() );
	}
	
	}
	
	
	private void createExcel1(String excelName,String location) throws IOException
	{
		
	
         
			 Row headrow = sheet1.createRow(0);
			 XSSFCellStyle style = ExcelCellStyle("Heading");
			 
             Cell cell_1 = headrow.createCell(1);
             cell_1.setCellStyle(style);
             cell_1.setCellValue("Co-ordinates");
             
             Cell cell_2 = headrow.createCell(2);
             cell_2.setCellStyle(style);
             cell_2.setCellValue("PDF Document Value");
             
             Cell cell_3 = headrow.createCell(3);
             cell_3.setCellStyle(style);
             cell_3.setCellValue("Distance from text"); 
		
	}
	private void createExcel2(String excelName,String location) throws IOException
	{
		
	
         
			Row headrow = sheet2.createRow(0);
			 XSSFCellStyle style = ExcelCellStyle("Heading");
			 
			 Cell cell_1 = headrow.createCell(1);
             cell_1.setCellStyle(style);
             cell_1.setCellValue("Co-ordinates");
             
             Cell cell_2 = headrow.createCell(2);
             cell_2.setCellStyle(style);
             cell_2.setCellValue("PDF Document Value");
             
             Cell cell_3 = headrow.createCell(3);
             cell_3.setCellStyle(style);
             cell_3.setCellValue("Distance from text"); 
		
		
	}
	
	
	private void PDFtoExcel1(String rect, String extractedVal, int height,int page)
	{
		
		
		int lastrow = sheet1.getLastRowNum();
		Row row = sheet1.createRow(lastrow+1);
		
		Cell cellCord = row.createCell(1);
		Cell cellDocValue = row.createCell(2);
		Cell cellHeight = row.createCell(3);
		
		cellCord.setCellValue(rect.toString());
		cellDocValue.setCellValue(extractedVal);
		cellHeight.setCellValue(height);
		
		
	}
	private void PDFtoExcel2(String rect, String extractedVal, int height,int page)
	{
		
		
		int lastrow = sheet2.getLastRowNum();
		Row row = sheet2.createRow(lastrow+1);
		
		Cell cellCord = row.createCell(1);
		Cell cellDocValue = row.createCell(2);
		Cell cellHeight = row.createCell(3);
		
		cellCord.setCellValue(rect.toString());
		cellDocValue.setCellValue(extractedVal);
		cellHeight.setCellValue(height);
		
		
	}
	
	private void closeExcel() throws IOException
	{
		try
		{
			if(!(out==null))
			{
				workbook.write(out);
			    out.close();
			  
			    
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	
	  
	}
	private static XSSFCellStyle ExcelCellStyle(String reqValue)
	  {
		  XSSFCellStyle style = workbook.createCellStyle();    
		  switch(reqValue)
		  {
		  case "Heading":
			 //   style.setBorderTop((short) 6); // double lines border
			 //   style.setBorderBottom((short) 1); // single line border
			    XSSFFont font = workbook.createFont();
			    font.setFontHeightInPoints((short) 12);
			//    font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
			    style.setFont(font); 
			  break;
		  case "Pass":
			//cell style-PAss
			  style.setFillForegroundColor(new XSSFColor(new java.awt.Color(0, 255, 0)));
			//  style.setFillPattern(CellStyle.SOLID_FOREGROUND);
			  break;
		  case "Fail":
			  style.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 0, 0)));
		//	  style.setFillPattern(CellStyle.SOLID_FOREGROUND);
			  break;
		  default:
			  style=null;
		  }
		  return style;
	  }

private static String getDatetime()
{
	DateFormat dateFormat = new SimpleDateFormat("dd MMM hh mm ss");
	Date date = new Date();
//	System.out.println(dateFormat.format(date)); //2014/08/06 15:59:48
	return dateFormat.format(date);
}

private static void moveExistingexcelToArchive(String location)
{
	
	
   File dir = new File(location);
	 FileFilter fileFilter_Excel = new WildcardFileFilter("*.xlsx");
     File[] files_Excel = dir.listFiles(fileFilter_Excel);
     String absolutePath_Excel="";
     if (files_Excel.length > 0) {
    	 for(int i=0;i<files_Excel.length;i++)
    	 {
    		
                 absolutePath_Excel=files_Excel[i].getAbsolutePath();
                 
                 File file = new File(location+"\\Test_Results_archive");
                 if(!file.exists())          	 
                 {
                	new File(location+"\\Test_Results_archive").mkdir();
                	File afile =new File(absolutePath_Excel);
                	afile.renameTo(new File(location+"\\Test_Results_archive\\"+afile.getName().substring(0,afile.getName().indexOf("."))+" "+getDatetime()+".xlsx"));
                 }
                 else
                 {
                	 File afile =new File(absolutePath_Excel);
                    afile.renameTo(new File(location+"\\Test_Results_archive\\"+afile.getName().substring(0,afile.getName().indexOf("."))+" "+getDatetime()+".xlsx"));                     }
             
    	 }      	
     }
     else
     {
        
     }
	
}


private  void createTestResult(String docName)
{
	sheet3= workbook.createSheet("Result_ "+docName);
	
	Row headrow = sheet3.createRow(0);
	 XSSFCellStyle style = ExcelCellStyle("Heading");
	 
    Cell cell_1 = headrow.createCell(0);
    cell_1.setCellStyle(style);
    cell_1.setCellValue("S3 Document Content");
    
    Cell cell_2 = headrow.createCell(1);
    cell_2.setCellStyle(style);
    cell_2.setCellValue("Onbase Document Content");
    
    Cell cell_3 = headrow.createCell(2);
    cell_3.setCellStyle(style);
    cell_3.setCellValue("Comparison Result");
    
    for(int i=2;i<sheet1.getLastRowNum();i++)
    {
    	Row row= sheet3.createRow(i);
    	Cell cell = row.createCell(0);
    	if(!(sheet1.getRow(i).getCell(2)==null))
    	cell.setCellValue(sheet1.getRow(i).getCell(2).getStringCellValue());
    }	
    for(int i=2;i<sheet2.getLastRowNum();i++)
    {
    	Row row;
    	row= sheet3.getRow(i);
    	if(row==null)
    	{
    		row= sheet3.createRow(i);
    	}
    
    	Cell cell;
    	cell = row.getCell(1);
    	if(cell==null)
    	{
    		cell = row.createCell(1);
    	}
    	if(!(sheet2.getRow(i).getCell(2)==null))
    	cell.setCellValue(sheet2.getRow(i).getCell(2).getStringCellValue());
    }
    for(int i=2;i<sheet3.getLastRowNum();i++)
    {
    	Row row= sheet3.getRow(i);
    	Cell cell = row.createCell(2);
    	if(!(sheet3.getRow(i).getCell(0)==null)&&!(sheet3.getRow(i).getCell(1)==null))
    	{
    		boolean result=sheet3.getRow(i).getCell(0).getStringCellValue().equalsIgnoreCase(sheet3.getRow(i).getCell(1).getStringCellValue());
    		if(result)
    		{
    			cell.setCellValue("PASS");
    			cell.setCellStyle(style_Pass);
    		}
    			
    		else
    		{
    			cell.setCellValue("FAIL");
    			cell.setCellStyle(style_Fail);
    		}
    	}
    		
    	
    }
    
    
	
}

	public static String pdfComparer(String baseFilePath, String actualFilePath, String resultPath) throws IOException {
		

		//String baseFilePath="\\S3toOnbase\\S3\\";
		//String actualFilePath="\\S3toOnbase\\OnBase\\";
		//String resultPath="\\S3toOnbase\\Test Results";
		//String docName="PAS-SmokeTest_1003";
		
		//Move existing excels into archive folder
		
		//moveExistingexcelToArchive(resultPath);
		
		String timeStamp = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
	    String docName=timeStamp;
      
		workbook = new XSSFWorkbook();
		
		sheet1 = workbook.createSheet("Actual");
		sheet2 = workbook.createSheet("Expected");
		try {
			FileUtils.createFolder(resultPath, "AllResult");
			resultPath=resultPath+"\\"+"AllResult";
			FileUtils.createFolder(resultPath, docName);
			resultPath=resultPath+"\\"+docName;
			out = new FileOutputStream(resultPath+"\\"+docName+"_"+new File(actualFilePath).getName().split(".pdf")[0]+".xlsx");
			new PDFComparerUtil().createExcel1(docName,resultPath);
     		new PDFComparerUtil().ExportPDFCords1(0, 0, 1, 1,baseFilePath);
     		new PDFComparerUtil().createExcel2(docName,resultPath);
     		new PDFComparerUtil().ExportPDFCords2(0, 0, 1, 1,actualFilePath);
     		new PDFComparerUtil().createTestResult(docName);
     		new PDFComparerUtil().closeExcel();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			out.close();
		}
        	return resultPath;
      	
	}

}

