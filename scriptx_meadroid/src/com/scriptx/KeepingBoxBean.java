package com.scriptx;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
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
		
        
		/**출력데이터셋팅*************************************************************************/
        
        String sc = "unescape('%1E')";
        
        //송장번호
        String dlvrNumb = properties.getProperty("dlvrNumb");
		req.setAttribute("dlvrNumb", dlvrNumb);
		//출력일자
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd");
		String prtDate = format1.format (System.currentTimeMillis());
		req.setAttribute("prtDate", prtDate);
		//도착지코드
		String dlvClsfCd = properties.getProperty("dlvClsfCd");
		req.setAttribute("dlvClsfCd", dlvClsfCd);
		//도착지서브코드
		String dlvSubClsfCd = properties.getProperty("dlvSubClsfCd");
		req.setAttribute("dlvSubClsfCd", sc);
		
		
		String prntDateStr = "" +"\""+properties.getProperty("dlvrNumb")+"\"													+"+sc+"+ \r\n";
		
		req.setAttribute("INVOICE_INFO", prntDateStr);
	}
	
}


