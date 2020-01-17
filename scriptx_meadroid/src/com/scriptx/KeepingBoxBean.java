package com.scriptx;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
        
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		//�����ȣ
		map.put("dlvrNumb", 			properties.getProperty("dlvrNumb"));
		//�������
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd");
		String prtYmd = format1.format (System.currentTimeMillis());
		map.put("prtYmd", 				prtYmd);
		//�������ڵ�
		map.put("dlvClsfCd", 			properties.getProperty("dlvClsfCd"));
		//�����������ڵ�
		map.put("dlvSubClsfCd", 		properties.getProperty("dlvSubClsfCd"));
		
		//��ȭ�� ��
		map.put("rcvrNm", 				properties.getProperty("rcvrNm"));
		//��ȭ�� �޴���
		map.put("rcvrCell", 			properties.getProperty("rcvrCell"));
		//��ȭ�� ���θ��ּ�
		map.put("rcvrNewAddr", 			properties.getProperty("rcvrNewAddr"));
		//��ȭ�� ���θ��ּ� ��
		map.put("rcvrNewAddrDtl", 		properties.getProperty("rcvrNewAddrDtl"));		
		//��ȭ�� �ּ� ��Ī
		map.put("rcvrShortAddr", 		properties.getProperty("rcvrShortAddr"));

		//��ȭ�� ��
		map.put("sndprNm", 				properties.getProperty("sndprNm"));
		//��ȭ�� �޴���
		map.put("sndprCell", 			properties.getProperty("sndprCell"));
		//��ȭ�� ���θ��ּ�
		map.put("sndprNewAddr", 		properties.getProperty("sndprNewAddr"));
		//��ȭ�� ���θ��ּ� ��
		map.put("sndprNewAddrDtl", 		properties.getProperty("sndprNewAddrDtl"));
		
		//����
		map.put("param1", 				properties.getProperty("param1"));
		//����
		map.put("param2", 				properties.getProperty("param2"));
		//����
		map.put("param3", 				properties.getProperty("param3"));
		
		//��ǰ����
		map.put("param4", 				properties.getProperty("param4"));
		
		//��Ÿ(�����ù�)
		map.put("param5", 				properties.getProperty("param5"));
		
		//�����������
		map.put("dlvPreArrBranNm", 		properties.getProperty("dlvPreArrBranNm"));
		//���SM��
		map.put("dlvPreArrEmpNm", 		properties.getProperty("dlvPreArrEmpNm"));
		//SM�з��ڵ��
		map.put("dlvPreArrEmpNickNm", 	properties.getProperty("dlvPreArrEmpNickNm"));
		
		
		
		req.setAttribute("INVOICE_INFO", map);
	}
	
	
	
	//nullüũ �Լ�
		public String isNull(String str) 
		{
			return str == null? "":str;
		}
}


