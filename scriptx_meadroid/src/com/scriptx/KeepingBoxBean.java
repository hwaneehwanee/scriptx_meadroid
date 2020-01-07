package com.scriptx;

import java.io.FileInputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

public class KeepingBoxBean  {
   
	public void printInvoiceDefault(HttpServletRequest req) throws Exception{
		
		//데이터
		String resource = this.getClass().getResource("data.properties").getPath();
		Properties properties = new Properties();
		
        FileInputStream fis = new FileInputStream(resource);
         
        //파일 로딩
        properties.load(new java.io.BufferedInputStream(fis));
		
		//출력데이터셋팅
        String dlvrNumb = properties.getProperty("dlvrNumb") ;
		req.setAttribute("param1", dlvrNumb);
		
	}
	
}


