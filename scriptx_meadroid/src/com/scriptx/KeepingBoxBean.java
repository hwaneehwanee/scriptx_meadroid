package com.scriptx;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
        
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		//송장번호
		map.put("dlvrNumb", 			properties.getProperty("dlvrNumb"));
		//출력일자
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd");
		String prtYmd = format1.format (System.currentTimeMillis());
		map.put("prtYmd", 				prtYmd);
		//도착지코드
		map.put("dlvClsfCd", 			properties.getProperty("dlvClsfCd"));
		//도착지서브코드
		map.put("dlvSubClsfCd", 		properties.getProperty("dlvSubClsfCd"));
		
		//수화인 명
		map.put("rcvrNm", 				properties.getProperty("rcvrNm"));
		//수화인 휴대폰
		map.put("rcvrCell", 			properties.getProperty("rcvrCell"));
		//수화인 도로명주소
		map.put("rcvrNewAddr", 			properties.getProperty("rcvrNewAddr"));
		//수화인 도로명주소 상세
		map.put("rcvrNewAddrDtl", 		properties.getProperty("rcvrNewAddrDtl"));		
		//수화인 주소 약칭
		map.put("rcvrShortAddr", 		properties.getProperty("rcvrShortAddr"));

		//송화인 명
		map.put("sndprNm", 				properties.getProperty("sndprNm"));
		//송화인 휴대폰
		map.put("sndprCell", 			properties.getProperty("sndprCell"));
		//송화인 도로명주소
		map.put("sndprNewAddr", 		properties.getProperty("sndprNewAddr"));
		//송화인 도로명주소 상세
		map.put("sndprNewAddrDtl", 		properties.getProperty("sndprNewAddrDtl"));
		
		//수량
		map.put("param1", 				properties.getProperty("param1"));
		//운임
		map.put("param2", 				properties.getProperty("param2"));
		//정산
		map.put("param3", 				properties.getProperty("param3"));
		
		//상품정보
		map.put("param4", 				properties.getProperty("param4"));
		
		//기타(국내택배)
		map.put("param5", 				properties.getProperty("param5"));
		
		//배송집배점명
		map.put("dlvPreArrBranNm", 		properties.getProperty("dlvPreArrBranNm"));
		//배송SM명
		map.put("dlvPreArrEmpNm", 		properties.getProperty("dlvPreArrEmpNm"));
		//SM분류코드명
		map.put("dlvPreArrEmpNickNm", 	properties.getProperty("dlvPreArrEmpNickNm"));
		
		
		
		req.setAttribute("INVOICE_INFO", map);
	}
	
	
	
	//null체크 함수
		public String isNull(String str) 
		{
			return str == null? "":str;
		}
}


