package com.scriptx;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	try {

			//��µ�������ȸ
    		new KeepingBoxBean().printInvoiceDefault(req);
			
	        
	    	//print�������� ������
	        req.getRequestDispatcher("KeepingBoxPrintInvoice.jsp").forward(req, resp);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	

    }
}


