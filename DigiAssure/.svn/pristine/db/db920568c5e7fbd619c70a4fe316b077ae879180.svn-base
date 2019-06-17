package com.cg.digi.utilities;
import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

public class CSVUtils {
   
    public static List<List<String>> readCSV(String filePath) throws IOException{
    	List<List<String>> csvContent=new ArrayList<List<String>>();
    	List<String> row=null;
    	
        try (
                Reader reader = Files.newBufferedReader(Paths.get(filePath));
                CSVParser csvParser = new CSVParser(reader, CSVFormat.EXCEL);
        	
            ) {
                for (CSVRecord csvRecord : csvParser) {
                	row=new ArrayList<String>();
                	Iterator<String> list = csvRecord.iterator();
                	while(list.hasNext()){
                		row.add(list.next());
                	}
                	csvContent.add(row);
                  

                   
                }
            }
		return csvContent;
        }
}