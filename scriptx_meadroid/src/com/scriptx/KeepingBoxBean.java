package com.scriptx;

import java.io.FileInputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

public class KeepingBoxBean  {
   
	public void printInvoiceDefault(HttpServletRequest req) throws Exception{
		
		//������
		String resource = this.getClass().getResource("data.properties").getPath();
		Properties properties = new Properties();
		
        FileInputStream fis = new FileInputStream(resource);
         
        //���� �ε�
        properties.load(new java.io.BufferedInputStream(fis));
		
		//��µ����ͼ���
        String dlvrNumb = properties.getProperty("dlvrNumb") ;
		req.setAttribute("param1", dlvrNumb);
		
	}
	
}


