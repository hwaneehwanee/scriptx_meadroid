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

			//출력데이터조회
    		new KeepingBoxBean().printInvoiceDefault(req);
			
	        
	    	//print페이지로 포워딩
	        req.getRequestDispatcher("KeepingBoxPrintInvoice.jsp").forward(req, resp);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	

    }
}


