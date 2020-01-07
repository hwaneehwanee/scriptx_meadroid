package com.scriptx;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
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
		
        
		/**��µ����ͼ���*************************************************************************/
        
        String sc = "unescape('%1E')";
        
        //�����ȣ
        String dlvrNumb = properties.getProperty("dlvrNumb");
		req.setAttribute("dlvrNumb", dlvrNumb);
		//�������
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd");
		String prtDate = format1.format (System.currentTimeMillis());
		req.setAttribute("prtDate", prtDate);
		//�������ڵ�
		String dlvClsfCd = properties.getProperty("dlvClsfCd");
		req.setAttribute("dlvClsfCd", dlvClsfCd);
		//�����������ڵ�
		String dlvSubClsfCd = properties.getProperty("dlvSubClsfCd");
		req.setAttribute("dlvSubClsfCd", sc);
		
		
		String prntDateStr = "" +"\""+properties.getProperty("dlvrNumb")+"\"													+"+sc+"+ \r\n";
		
		req.setAttribute("INVOICE_INFO", prntDateStr);
	}
	
}


